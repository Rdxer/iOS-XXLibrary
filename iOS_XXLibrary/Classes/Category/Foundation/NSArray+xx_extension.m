//
//  NSArray+xx_extension.m
//  dyss_v2
//
//  Created by LXF on 16/4/8.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "NSArray+xx_extension.h"

@implementation NSArray (xx_extension)

+(NSArray *)arrayWithContentsOfFileName:(NSString *)fileName{
    NSString *path = [[NSBundle mainBundle]pathForResource:fileName ofType:@""];
    NSArray *a = [self arrayWithContentsOfFile:path];
    return a;
}

@end
