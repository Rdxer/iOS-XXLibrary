//
//  NSString+xx_json2xx.m
//  dyss_v2
//
//  Created by LXF on 16/3/31.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "NSString+xx_json2xx.h"
#import "CustomLogTools.h"

@implementation NSString (xx_json2xx)

-(id)xx_toJSONObject{
    NSError *err = nil;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&err];
    if (err) {
        printE(@"json 解析出现问题");
    }
    return jsonObj;
}
@end
