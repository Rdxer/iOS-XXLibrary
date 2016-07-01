//
//  XXError.h
//  Pods
//
//  Created by LXF on 16/6/29.
//
//

#import <Foundation/Foundation.h>

@interface XXError : NSError

@property (nonatomic, copy) NSString *showMessage;
@property (nonatomic, copy) NSString *mark;
//@property (nonatomic, assign , getter=isVerify) BOOL verify;

/// [self errorWithShowMessage:NSLocalizedString(@"服务器数据异常...", @"") code:-9999 userInfo:@{}];
+(instancetype)errorWithMark:(NSString *)mark;
+(instancetype)errorWithCmd:(SEL)cmd;

+(instancetype)errorWithShowMessage:(NSString *)showMessage code:(NSInteger)code userInfo:(NSDictionary *)dict;

@end

@interface XXDataError : XXError

@end

