//
//  NSString+xx_extension.m
//  dyss_v2
//
//  Created by LXF on 16/3/31.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "NSString+xx_extension.h"

@implementation NSString (xx_extension)

-(instancetype)appendNotNilStr:(id)notNilStr{
    if (notNilStr) {
        return [self stringByAppendingString:[notNilStr description]];
    }
    return self;
}

@end
