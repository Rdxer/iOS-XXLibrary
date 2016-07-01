//
//  XXURLInfo.h
//  Pods
//
//  Created by LXF on 16/6/29.
//
//

#import <Foundation/Foundation.h>

@interface XXURLInfo : NSObject

@property (nonatomic, copy) NSString *method;
@property (nonatomic, copy) NSString *url;

- (NSString *)generateAbsoluteStringWithBaseURL:(NSURL *)baseURL parameter:(NSDictionary **)parameter error:(NSError **)error;
@end
