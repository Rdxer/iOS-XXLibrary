//
//  NSDate+KC.m
//  FirstSmartHome
//
//  Created by LXF on 15/12/18.
//  Copyright © 2015年 FirstFacility. All rights reserved.
//

#import "NSDate+dateStamp.h"

@implementation NSDate (dateStamp)

-(NSString *)dateStamp{
    NSTimeInterval timeInterval = [self timeIntervalSince1970];
    timeInterval = timeInterval * 1000;
    return [NSString stringWithFormat:@"%.0f",timeInterval];
}

-(NSInteger)dateStampInt{
    return [[self dateStamp]integerValue];
}

/// yyyyMMddHHmmss
-(NSString *)dateStamp2{
    return [self dateStringWithFormat:@"yyyyMMddHHmmss"];
}

-(NSString *)dateStringWithFormat:(NSString *)format{
    NSString *dateString = @"";
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: format];
    
    dateString = [dateFormatter stringFromDate:self];
    
    return dateString;
}

+(instancetype)dateWithString:(NSString *)dateString formetStr:(NSString *)formatStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: formatStr];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
}
@end
