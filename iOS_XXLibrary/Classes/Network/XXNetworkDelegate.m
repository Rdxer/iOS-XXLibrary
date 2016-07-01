//
//  XXNetworkDelegate.m
//  Pods
//
//  Created by LXF on 16/6/29.
//
//

#import "XXNetworkDelegate.h"
#import "XXError.h"

@implementation XXNetworkDelegate

-(ProcessParamesHandle)defaultProcessParames{
    return ^(NSDictionary **parames,NSString *timeStamp,NSError **serializationError,id mark){
    };
}
-(ProcessRequestHeaderHandle)defaultProcessRequestHeader{
    return ^(NSDictionary **parames,NSString *timeStamp,NSMutableURLRequest *request,NSError **serializationError,id mark){
        
    };
}

-(ParseResponsHandle)defaultParseResponse{
    return (id)^(id response,NSError **serializationError,id mark){
         return response;
    };
}


-(ProcessParamesHandle)processParames{
    if (_processParames == nil) {
        return [self defaultProcessParames];
    }
    return _processParames;
}
-(ProcessRequestHeaderHandle)processRequestHeader{
    if (_processRequestHeader == nil) {
        _processRequestHeader = [self defaultProcessRequestHeader];
    }
    return _processRequestHeader;
}
-(ParseResponsHandle)parseResponse{
    if (_parseResponse == nil) {
        _parseResponse = [self defaultParseResponse];
    }
    return _parseResponse;
}

@end
