//
//  NSString+Trims2.h
//  dyss_v2
//
//  Created by LXF on 16/2/5.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Trims2)

/// 去除两头的字符
-(NSString *)trim:(NSString *)targetStr;

/// 去除两头的空格
-(NSString *)trimWithSpace;

/// 返回 非 0  表示 字符串长度 > 0 字符串去掉空格之后的长度 > 0 并且字符串不为空
-(BOOL)notEmpty;

@end
