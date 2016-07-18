//
//  UILocalNotification+Extension.h
//  dyss_v2
//
//  Created by LXF on 16/5/3.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILocalNotification (Extension)
/// 设置本地通知
///
/// @param alertTime    <#alertTime description#>
/// @param alertBodyStr <#alertBodyStr description#>
/// @param userDictStr  <#userDictStr description#>
+ (void)registerLocalNotification:(NSInteger)alertTime alertBodyStr:(NSString *)alertBodyStr userDictStr:(NSString *)userDictStr;

/// 取消本地通知的显示
///
/// @param key <#key description#>
+ (void)cancelLocalNotificationWithKey:(NSString *)key;
@end
