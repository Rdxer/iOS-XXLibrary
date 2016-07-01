//
//  XXError.m
//  Pods
//
//  Created by LXF on 16/6/29.
//
//

#import "XXError.h"

@implementation XXError

+(instancetype)errorWithCmd:(SEL)cmd{
    XXError *e = [self errorWithShowMessage:NSLocalizedString(@"服务器数据异常...", @"") code:-9999 userInfo:@{}];
    e.mark = NSStringFromSelector(cmd);
    return e;
}

+(instancetype)errorWithMark:(NSString *)mark{
    XXError *e = [self errorWithShowMessage:NSLocalizedString(@"服务器数据异常...", @"") code:-9999 userInfo:@{}];
    e.mark = mark;
    return e;
}

+(instancetype)errorWithShowMessage:(NSString *)showMessage code:(NSInteger)code userInfo:(NSDictionary *)dict{
    XXError *e = [[XXError alloc]initWithDomain:@"com.rdxer.XXLibrary.XXError" code:code userInfo:dict];
    e.showMessage = showMessage;
    return e;
}

-(NSString *)description{
    return [[super description] stringByAppendingFormat:@" showMessage:%@",self.showMessage];
}

@end

@implementation XXDataError



@end
