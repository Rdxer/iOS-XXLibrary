//
//  NSString+XX_Extension.h
//  iOS-XXLibrary
//
//  Created by LXF on 16/6/25.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XX_Extension)

- (instancetype)xx_add;

- (void)appendString:(NSString *)other resultHandler:(void(^)(NSString *result))handler;

@end
