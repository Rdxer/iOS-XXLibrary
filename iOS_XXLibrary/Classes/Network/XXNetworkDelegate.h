//
//  XXNetworkDelegate.h
//  Pods
//
//  Created by LXF on 16/6/29.
//
//

#import <Foundation/Foundation.h>

typedef void(^ProcessParamesHandle)(NSDictionary **parames,NSString *dateStamp,NSError **serializationError,id mark);
typedef void(^ProcessRequestHeaderHandle)(NSDictionary **parames,NSString *dateStamp,NSMutableURLRequest *request,NSError **serializationError,id mark);
typedef id(^ParseResponsHandle)(id response,NSError **serializationError,id mark);


@interface XXNetworkDelegate : NSObject

@property (nonatomic, copy) ProcessParamesHandle processParames;

@property (nonatomic, copy) ProcessRequestHeaderHandle processRequestHeader;

@property (nonatomic, copy) ParseResponsHandle parseResponse;

-(void)setProcessParames:(ProcessParamesHandle)processParames;
-(void)setProcessRequestHeader:(ProcessRequestHeaderHandle)processRequestHeader;
-(void)setParseResponse:(ParseResponsHandle)parseResponse;

-(ProcessParamesHandle)defaultProcessParames;
-(ProcessRequestHeaderHandle)defaultProcessRequestHeader;
-(ParseResponsHandle)defaultParseResponse;

@end
