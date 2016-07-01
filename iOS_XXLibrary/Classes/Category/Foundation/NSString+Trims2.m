//
//  NSString+Trims2.m
//  dyss_v2
//
//  Created by LXF on 16/2/5.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "NSString+Trims2.h"

@implementation NSString (Trims2)

-(NSString *)trim:(NSString *)targetStr{
    NSString *result = self.copy;
    
    NSRange targetRange;
    
    while ((targetRange = [result rangeOfString:targetStr]).location != NSNotFound) {
        if (targetRange.location != 0) {
            break;
        }
        result = [result stringByReplacingCharactersInRange:targetRange withString:@""];
    }
    
    while ((targetRange = [result rangeOfString:targetStr options:NSBackwardsSearch]).location != NSNotFound) {
        if (targetRange.location + targetRange.length  != result.length) {
            break;
        }
        result = [result stringByReplacingCharactersInRange:targetRange withString:@""];
    }
    
    return result;
}
-(NSString *)trimWithSpace{
    return [self trim:@" "];
}

@end
