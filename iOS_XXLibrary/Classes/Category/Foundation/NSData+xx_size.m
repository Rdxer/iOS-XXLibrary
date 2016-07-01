//
//  NSData+xx_size.m
//  dyss_v2
//
//  Created by LXF on 16/3/30.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "NSData+xx_size.h"

@implementation NSData (xx_size)

+(NSString *)descriptionWithByteLength:(NSInteger)length{
    if (length < 1024) {
        return [NSString stringWithFormat:@"%zdByte/s",length];
    }
    if (length < 1024 * 1024) {
        return [NSString stringWithFormat:@"%.1fKB/s",length/1024.0];
    }
    if (length < 1024 * 1024 * 1024) {
        return [NSString stringWithFormat:@"%.1fMB/s",length/1024.0/1024.0];
    }
    return @"您的网速已经飞了";
}

@end
