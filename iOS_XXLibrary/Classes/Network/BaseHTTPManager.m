//
//  BaseHTTPManager.m
//  iOS_XXLibrary
//
//  Created by LXF on 16/6/27.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "BaseHTTPManager.h"
#import "XXURLInfo.h"
#import "XXNetworkDelegate.h"
#import "NSDate+dateStamp.h"
#import "XXError.h"

#import "CustomLogTools.h"

#import "XXJSONRequestSerializer.h"
#import "XXJSONResponseSerializer.h"

@interface BaseHTTPManager ()
@property (readwrite, nonatomic, strong) NSURL *baseURL;
@end

@implementation BaseHTTPManager
@dynamic responseSerializer;

+ (instancetype)manager {
    return [[[self class] alloc] initWithBaseURL:nil];
}

- (instancetype)init {
    return [self initWithBaseURL:nil];
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    return [self initWithBaseURL:url sessionConfiguration:nil];
}

- (instancetype)initWithSessionConfiguration:(NSURLSessionConfiguration *)configuration {
    return [self initWithBaseURL:nil sessionConfiguration:configuration];
}

- (instancetype)initWithBaseURL:(NSURL *)url
           sessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    self = [super initWithSessionConfiguration:configuration];
    if (!self) {
        return nil;
    }
    
    // Ensure terminal slash for baseURL path, so that NSURL +URLWithString:relativeToURL: works as expected
    if ([[url path] length] > 0 && ![[url absoluteString] hasSuffix:@"/"]) {
        url = [url URLByAppendingPathComponent:@""];
    }
    
    self.baseURL = url;
    
    self.requestSerializer = [XXJSONRequestSerializer serializer];
    self.responseSerializer = [XXJSONResponseSerializer serializer];
    
    [self setCompletionQueue:dispatch_get_global_queue(0, 0)];
    [self setCompletionCallBackQueue:dispatch_get_main_queue()];
    
    return self;
}

#pragma mark -

- (void)setRequestSerializer:(AFHTTPRequestSerializer <AFURLRequestSerialization> *)requestSerializer {
    NSParameterAssert(requestSerializer);
    
    _requestSerializer = requestSerializer;
}

- (void)setResponseSerializer:(AFHTTPResponseSerializer <AFURLResponseSerialization> *)responseSerializer {
    NSParameterAssert(responseSerializer);
    
    [super setResponseSerializer:responseSerializer];
}

#pragma mark -



//
//- (NSURLSessionDataTask *)POST:(NSString *)URLString
//                    parameters:(nullable id)parameters
//     constructingBodyWithBlock:(nullable void (^)(id<AFMultipartFormData> _Nonnull))block
//                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
//                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
//{
//    return [self POST:URLString parameters:parameters constructingBodyWithBlock:block progress:nil success:success failure:failure];
//}
//
//- (NSURLSessionDataTask *)POST:(NSString *)URLString
//                    parameters:(id)parameters
//     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
//                      progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress
//                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
//                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
//{
//    NSError *serializationError = nil;
//    NSMutableURLRequest *request = [self.requestSerializer multipartFormRequestWithMethod:@"POST" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters constructingBodyWithBlock:block error:&serializationError];
//    if (serializationError) {
//        if (failure) {
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wgnu"
//            dispatch_async(self.completionQueue ?: dispatch_get_main_queue(), ^{
//                failure(nil, serializationError);
//            });
//#pragma clang diagnostic pop
//        }
//        
//        return nil;
//    }
//    
//    __block NSURLSessionDataTask *task = [self uploadTaskWithStreamedRequest:request progress:uploadProgress completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
//        if (error) {
//            if (failure) {
//                failure(task, error);
//            }
//        } else {
//            if (success) {
//                success(task, responseObject);
//            }
//        }
//    }];
//    
//    [task resume];
//    
//    return task;
//}

- (NSURLSessionDataTask *)doTaskUrlInfo:(XXURLInfo *)urlInfo
                             parameters:(id)parameters
                            netdelegate:(XXNetworkDelegate *)netdelegate
                                success:(void (^)(NSURLSessionDataTask * , id ,id target))success
                                dataerr:(void (^)(NSURLSessionDataTask *task, id responseObject,XXError *error))dataerr
                                failure:(void (^)(NSURLSessionDataTask * , NSError * ))failure
{
    NSURLSessionDataTask *dataTask = [self dataTaskWithHTTPUrlInfo:urlInfo parameters:parameters netdelegate:netdelegate uploadProgress:NULL downloadProgress:NULL success:success dataerr:dataerr failure:failure];
    
    [dataTask resume];
    
    return dataTask;
}

- (NSURLSessionDataTask *)doTaskUrlInfo:(XXURLInfo *)urlInfo
                             parameters:(id)parameters
                            netdelegate:(XXNetworkDelegate *)netdelegate
                         uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                       downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                success:(void (^)(NSURLSessionDataTask * , id ,id target))success
                                dataerr:(void (^)(NSURLSessionDataTask *task, id responseObject,XXError *error))dataerr
                                failure:(void (^)(NSURLSessionDataTask * , NSError * ))failure
{
    NSURLSessionDataTask *dataTask = [self dataTaskWithHTTPUrlInfo:urlInfo parameters:parameters netdelegate:netdelegate uploadProgress:uploadProgress downloadProgress:downloadProgress success:success dataerr:dataerr failure:failure];
    
    [dataTask resume];
    
    return dataTask;
}


- (NSURLSessionDataTask *)dataTaskWithHTTPUrlInfo:(XXURLInfo *)urlInfo
                                       parameters:(id)parameters
                                      netdelegate:(XXNetworkDelegate *)netdelegate
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *task, id responseObject,id target))success
                                         dataerr:(void (^)(NSURLSessionDataTask *task, id responseObject,XXError *error))dataerr
                                         failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    NSError *serializationError = nil;
    NSString *dataStamp = [[NSDate date] dateStamp];
    
    // 处理参数
    netdelegate.processParames(&parameters,dataStamp,&serializationError,urlInfo);
    
    if(serializationError){
        if (failure) {
            dispatch_async(self.completionCallBackQueue ?: dispatch_get_main_queue(), ^{
                printE(@"<1>发送请求错误..%@",serializationError);
                failure(nil, serializationError);
            });
        }
        return nil;
    }
    
    // 生成绝对的 URL
    NSString *absUrl = [urlInfo generateAbsoluteStringWithBaseURL:self.baseURL parameter:&parameters error:&serializationError];
    
    if(serializationError){
        if (failure) {
            dispatch_async(self.completionCallBackQueue ?: dispatch_get_main_queue(), ^{
                printE(@"<2>发送请求错误..%@",serializationError);
                failure(nil, serializationError);
            });
        }
        return nil;
    }
    
    // 生成 请求
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:urlInfo.method URLString:absUrl parameters:parameters error:&serializationError];
    
    // 刷新 请求头
    netdelegate.processRequestHeader(&parameters,dataStamp,request,&serializationError,urlInfo);
    
    
    if (serializationError) {
        if (failure) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
            dispatch_async(self.completionCallBackQueue ?: dispatch_get_main_queue(), ^{
                printE(@"<3>发送请求错误..%@",serializationError);
                failure(nil, serializationError);
            });
#pragma clang diagnostic pop
        }
        
        return nil;
    }
    
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [self dataTaskWithRequest:request
                          uploadProgress:uploadProgress
                        downloadProgress:downloadProgress
                       completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
                           if (error) {
                               if (failure) {
                                   dispatch_async(self.completionCallBackQueue ?: dispatch_get_main_queue(), ^{
                                        printE(@"<4>发送请求错误..%@",error);
                                        failure(dataTask, error);
                                   });
                               }
                           } else {
                               XXError *serializationError = nil;
                               id target = netdelegate.parseResponse(responseObject,&serializationError,dataTask);
                               if (serializationError) {
                                   if (dataerr) {
                                       dispatch_async(self.completionCallBackQueue ?: dispatch_get_main_queue(), ^{
                                           printW(@"请求失败~..%@",serializationError);
                                           dataerr(dataTask, responseObject,serializationError);
                                       });
                                   }
                                   return ;
                               }
                               if (success) {
                                   dispatch_async(self.completionCallBackQueue ?: dispatch_get_main_queue(), ^{
                                       success(dataTask, responseObject,target);
                                   });
                                   return;
                               }
                           }
                       }];
    
    return dataTask;
}

#pragma mark - NSObject

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, baseURL: %@, session: %@, operationQueue: %@>", NSStringFromClass([self class]), self, [self.baseURL absoluteString], self.session, self.operationQueue];
}

#pragma mark - NSSecureCoding

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    NSURL *baseURL = [decoder decodeObjectOfClass:[NSURL class] forKey:NSStringFromSelector(@selector(baseURL))];
    NSURLSessionConfiguration *configuration = [decoder decodeObjectOfClass:[NSURLSessionConfiguration class] forKey:@"sessionConfiguration"];
    if (!configuration) {
        NSString *configurationIdentifier = [decoder decodeObjectOfClass:[NSString class] forKey:@"identifier"];
        if (configurationIdentifier) {
#if (defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && __IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (defined(__MAC_OS_X_VERSION_MIN_REQUIRED) && __MAC_OS_X_VERSION_MIN_REQUIRED >= 1100)
            configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:configurationIdentifier];
#else
            configuration = [NSURLSessionConfiguration backgroundSessionConfiguration:configurationIdentifier];
#endif
        }
    }
    
    self = [self initWithBaseURL:baseURL sessionConfiguration:configuration];
    if (!self) {
        return nil;
    }
    
    self.requestSerializer = [decoder decodeObjectOfClass:[AFHTTPRequestSerializer class] forKey:NSStringFromSelector(@selector(requestSerializer))];
    self.responseSerializer = [decoder decodeObjectOfClass:[AFHTTPResponseSerializer class] forKey:NSStringFromSelector(@selector(responseSerializer))];
    AFSecurityPolicy *decodedPolicy = [decoder decodeObjectOfClass:[AFSecurityPolicy class] forKey:NSStringFromSelector(@selector(securityPolicy))];
    if (decodedPolicy) {
        self.securityPolicy = decodedPolicy;
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    
    [coder encodeObject:self.baseURL forKey:NSStringFromSelector(@selector(baseURL))];
    if ([self.session.configuration conformsToProtocol:@protocol(NSCoding)]) {
        [coder encodeObject:self.session.configuration forKey:@"sessionConfiguration"];
    } else {
        [coder encodeObject:self.session.configuration.identifier forKey:@"identifier"];
    }
    [coder encodeObject:self.requestSerializer forKey:NSStringFromSelector(@selector(requestSerializer))];
    [coder encodeObject:self.responseSerializer forKey:NSStringFromSelector(@selector(responseSerializer))];
    [coder encodeObject:self.securityPolicy forKey:NSStringFromSelector(@selector(securityPolicy))];
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone {
    BaseHTTPManager *HTTPClient = [[[self class] allocWithZone:zone] initWithBaseURL:self.baseURL sessionConfiguration:self.session.configuration];
    
    HTTPClient.requestSerializer = [self.requestSerializer copyWithZone:zone];
    HTTPClient.responseSerializer = [self.responseSerializer copyWithZone:zone];
    HTTPClient.securityPolicy = [self.securityPolicy copyWithZone:zone];
    return HTTPClient;
}


@end
