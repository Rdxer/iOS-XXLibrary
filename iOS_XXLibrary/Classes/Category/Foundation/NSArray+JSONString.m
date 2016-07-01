//
//  NSArray+JSONString.m
//  LXF-Categories
//
//  Created by LXF on 16/1/4.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "NSArray+JSONString.h"
#import "CustomLogTools.h"

@implementation NSArray (JSONString)

/**
 *
 *  @return  JSON字符串
 */
-(NSString *)JSONString{
    NSError *error = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:&error];
    if (jsonData == nil) {
        printE(@"数组转化为 JSON 字符串失败!!!: %@, error: %@", self, error);
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
