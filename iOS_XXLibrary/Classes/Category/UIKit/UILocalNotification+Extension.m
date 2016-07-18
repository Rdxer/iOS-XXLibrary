//
//  UILocalNotification+Extension.m
//  dyss_v2
//
//  Created by LXF on 16/5/3.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "UILocalNotification+Extension.h"

@implementation UILocalNotification (Extension)
// 设置本地通知
+ (void)registerLocalNotification:(NSInteger)alertTime alertBodyStr:(NSString *)alertBodyStr userDictStr:(NSDictionary *)userDict {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.alertBody =  alertBodyStr;
    // 徽章 *** （需修改）
    notification.applicationIconBadgeNumber = [UIApplication sharedApplication].applicationIconBadgeNumber + 1;
    // 通知被触发时播放的声音
    notification.soundName = UILocalNotificationDefaultSoundName;
//    NSDictionary *userDict = [NSDictionary dictionaryWithObject:userDictStr forKey:kNC_Notification_UserOutHome];
    notification.userInfo = userDict;
    
    // 执行通知注册
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

// 取消某个本地推送通知
+ (void)cancelLocalNotificationWithKey:(NSString *)key {
    // 获取所有本地通知数组
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    
    for (UILocalNotification *notification in localNotifications) {
        NSDictionary *userInfo = notification.userInfo;
        if (userInfo) {
            // 根据设置通知参数时指定的key来获取通知参数
            NSString *info = userInfo[key];
            
            // 如果找到需要取消的通知，则取消
            if (info != nil) {
                [[UIApplication sharedApplication] cancelLocalNotification:notification];
                break;
            }
        }
    }
}
@end
