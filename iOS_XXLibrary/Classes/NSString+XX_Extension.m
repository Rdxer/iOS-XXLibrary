//
//  NSString+XX_Extension.m
//  iOS-XXLibrary
//
//  Created by LXF on 16/6/25.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "NSString+XX_Extension.h"

@implementation NSString (XX_Extension)

- (instancetype)xx_add{
    return [self stringByAppendingString:@"__xxxx"];
}

- (void)appendString:(NSString *)other resultHandler:(void(^)(NSString *result))handler{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        handler(@"xxxxx");
    });
}

@end
