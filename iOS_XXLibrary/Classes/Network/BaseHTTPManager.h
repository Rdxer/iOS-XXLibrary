//
//  BaseHTTPManager.h
//  iOS_XXLibrary
//
//  Created by LXF on 16/6/27.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "XXURLInfo.h"
#import "XXNetworkDelegate.h"
#import "XXError.h"


@interface BaseHTTPManager : AFURLSessionManager

@property (nonatomic, strong, nullable) dispatch_queue_t completionCallBackQueue;

/**
 The URL used to construct requests from relative paths in methods like `requestWithMethod:URLString:parameters:`, and the `GET` / `POST` / et al. convenience methods.
 */
@property (readonly, nonatomic, strong, nullable) NSURL *baseURL;

/**
 Requests created with `requestWithMethod:URLString:parameters:` & `multipartFormRequestWithMethod:URLString:parameters:constructingBodyWithBlock:` are constructed with a set of default headers using a parameter serialization specified by this property. By default, this is set to an instance of `AFHTTPRequestSerializer`, which serializes query string parameters for `GET`, `HEAD`, and `DELETE` requests, or otherwise URL-form-encodes HTTP message bodies.
 
 @warning `requestSerializer` must not be `nil`.
 */
@property (nonatomic, strong) AFHTTPRequestSerializer <AFURLRequestSerialization> * requestSerializer;

/**
 Responses sent from the server in data tasks created with `dataTaskWithRequest:success:failure:` and run using the `GET` / `POST` / et al. convenience methods are automatically validated and serialized by the response serializer. By default, this property is set to an instance of `AFJSONResponseSerializer`.
 
 @warning `responseSerializer` must not be `nil`.
 */
@property (nonatomic, strong) AFHTTPResponseSerializer <AFURLResponseSerialization> * responseSerializer;

///---------------------
/// @name Initialization
///---------------------

/**
 Creates and returns an `AFHTTPSessionManager` object.
 */
+ (instancetype)manager;

/**
 Initializes an `AFHTTPSessionManager` object with the specified base URL.
 
 @param url The base URL for the HTTP client.
 
 @return The newly-initialized HTTP client
 */
- (instancetype)initWithBaseURL:(nullable NSURL *)url;

/**
 Initializes an `AFHTTPSessionManager` object with the specified base URL.
 
 This is the designated initializer.
 
 @param url The base URL for the HTTP client.
 @param configuration The configuration used to create the managed session.
 
 @return The newly-initialized HTTP client
 */
- (instancetype)initWithBaseURL:(nullable NSURL *)url
           sessionConfiguration:(nullable NSURLSessionConfiguration *)configuration NS_DESIGNATED_INITIALIZER;


///  创建一个 dataTask
- (NSURLSessionDataTask *)dataTaskWithHTTPUrlInfo:(XXURLInfo *)urlInfo
                                       parameters:(id)parameters
                                      netdelegate:(XXNetworkDelegate *)netdelegate
                                   uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                 downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                          success:(void (^)(NSURLSessionDataTask *task, id responseObject,id target))success
                                          dataerr:(void (^)(NSURLSessionDataTask *task, id responseObject,XXError *error))dataerr
                                          failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

///  创建一个 dataTask，并且开始请求
///
///  @param urlInfo          url 信息，包括 url 路径，谓词（请求方法）
///  @param parameters       参数
///  @param netdelegate      网络代理对象
///  @param uploadProgress   上传进度
///  @param downloadProgress 下载进度
///  @param success          成功回调
///  @param dataerr          服务器返回数据解析失败回调
///  @param failure          网络错误等等回调
///
///  @return 创建并且已经开始的 数据任务。
- (NSURLSessionDataTask *)doTaskUrlInfo:(XXURLInfo *)urlInfo
                             parameters:(id)parameters
                            netdelegate:(XXNetworkDelegate *)netdelegate
                         uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                       downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                success:(void (^)(NSURLSessionDataTask *task, id responseObject,id target))success
                                dataerr:(void (^)(NSURLSessionDataTask *task, id responseObject,XXError *error))dataerr
                                failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

///  创建一个 dataTask，并且开始请求
///
///  @param urlInfo          url 信息，包括 url 路径，谓词（请求方法）
///  @param parameters       参数
///  @param netdelegate      网络代理对象
///  @param success          成功回调
///  @param dataerr          服务器返回数据解析失败回调
///  @param failure          网络错误等等回调
///
///  @return 创建并且已经开始的 数据任务。
- (NSURLSessionDataTask *)doTaskUrlInfo:(XXURLInfo *)urlInfo
                             parameters:(id)parameters
                            netdelegate:(XXNetworkDelegate *)netdelegate
                                success:(void (^)(NSURLSessionDataTask *task, id responseObject,id target))success
                                dataerr:(void (^)(NSURLSessionDataTask *task, id responseObject,XXError *error))dataerr
                                failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
