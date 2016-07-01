//
//  NSDate+KC.h
//  FirstSmartHome
//
//  Created by LXF on 15/12/18.
//  Copyright © 2015年 FirstFacility. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (dateStamp)

-(NSString *)dateStamp;
-(NSInteger)dateStampInt;

/// yyyyMMddHHmmss
-(NSString *)dateStamp2;

-(NSString *)dateStringWithFormat:(NSString *)format;

+(instancetype)dateWithString:(NSString *)dateStr formetStr:(NSString *)formatStr;


@end
