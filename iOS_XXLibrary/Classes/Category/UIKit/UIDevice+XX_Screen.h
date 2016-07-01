//
//  UIDevice+screen___.h
//  dyss_v2
//
//  Created by LXF on 16/2/3.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 各种屏幕尺寸的枚举
typedef NS_ENUM(NSInteger,UIDevice_Screen) {
    /// iPhone 非Retina
    UIDevice_Screen_iPhone_NORetina        = 1,
    /// iPhone 3.5寸 Retina  (320x480)
    UIDevice_Screen_iPhone_Retina_3_5      = 2,
    /// iPhone 4.0寸 Retina  (320x568)
    UIDevice_Screen_iPhone_Retina_4        = 3,
    /// iPhone 4.7寸 Retina  (375x667)
    UIDevice_Screen_iPhone_Retina_4_7      = 4,
    /// iPhone 5.5寸 Retina  (414x736)
    UIDevice_Screen_iPhone_Retina_5_5      = 5,
    /// iPad Retina
    UIDevice_Screen_iPad_NORetina          = 6,
    /// iPad Retina
    UIDevice_Screen_iPad_Retina            = 7
};

#pragma mark - 屏幕尺寸大小

#define iPhone_Retina_3_5_W 320.0
#define iPhone_Retina_3_5_H 480.0

#define iPhone_Retina_4_W 320.0
#define iPhone_Retina_4_H 568.0

#define iPhone_Retina_4_7_W 375.0
#define iPhone_Retina_4_7_H 667.0

#define iPhone_Retina_5_5_W 414.0
#define iPhone_Retina_5_5_H 736.0


#define CGSizeiPhone_Retina_3_5 CGSizeMake(iPhone_Retina_3_5_W, iPhone_Retina_3_5_H)
#define CGSizeiPhone_Retina_4   CGSizeMake(iPhone_Retina_4_W,   iPhone_Retina_4_H)
#define CGSizeiPhone_Retina_4_7 CGSizeMake(iPhone_Retina_4_7_W, iPhone_Retina_4_7_H)
#define CGSizeiPhone_Retina_5_5 CGSizeMake(iPhone_Retina_5_5_W, iPhone_Retina_5_5_H)

#define nvFont5_5T(value) [UIDevice convertFontSizeFrom_5_5:(value)/3.0]
#define nvFont4_7D(value) [UIDevice convertFontSizeFrom_4_7:(value)/2.0]
#define nvFont4_7D(value) [UIDevice convertFontSizeFrom_4_7:(value)/2.0]

#pragma mark - 自动转化 宏(倍值)
/// 使用 4_7D 直接输入 像素即可
/// 使用 5_5T 直接输入 像素即可
/// 都不需要除以 scale (缩放值)
#define nvY4_7D(value) [UIDevice convertVFrom_4_7:(value)/2.0]
#define nvY5_5T(value) [UIDevice convertVFrom_5_5:(value)/3.0]
#define nvX4_7D(value) [UIDevice convertHFrom_4_7:(value)/2.0]
#define nvX5_5T(value) [UIDevice convertHFrom_5_5:(value)/3.0]
#define nvH4_7D(value) [UIDevice convertVFrom_4_7:(value)/2.0]
#define nvH5_5T(value) [UIDevice convertVFrom_5_5:(value)/3.0]
#define nvW4_7D(value) [UIDevice convertHFrom_4_7:(value)/2.0]
#define nvW5_5T(value) [UIDevice convertHFrom_5_5:(value)/3.0]


#define nvFont5_5X(value) [UIDevice convertFontSizeFrom_5_5:(value)]
#define nvFont4_7X(value) [UIDevice convertFontSizeFrom_4_7:(value)]

#pragma mark - 自动转化 宏(原值)
/// 使用 带 X 的 输入的数值为视网膜屏的点 不能为像素值, 除以 scale 才为 点
#define nvY4_7X(value) [UIDevice convertVFrom_4_7:(value)]
#define nvY5_5X(value) [UIDevice convertVFrom_5_5:(value)]
#define nvX4_7X(value) [UIDevice convertHFrom_4_7:(value)]
#define nvX5_5X(value) [UIDevice convertHFrom_5_5:(value)]
#define nvH4_7X(value) [UIDevice convertVFrom_4_7:(value)]
#define nvH5_5X(value) [UIDevice convertVFrom_5_5:(value)]
#define nvW4_7X(value) [UIDevice convertHFrom_4_7:(value)]
#define nvW5_5X(value) [UIDevice convertHFrom_5_5:(value)]


/// CGSizeMake
#define CGSizeMake4_7X(widthV, heightV) [UIDevice convertCGSizeMake4_7WithWidth:widthV height:heightV]
#define CGSizeMake5_5X(widthV, heightV) [UIDevice convertCGSizeMake5_5WithWidth:widthV height:heightV]

#define CGSizeMake4_7D(width, height) CGSizeMake4_7X((width)/2.0, (height)/2.0)
#define CGSizeMake5_5T(width, height) CGSizeMake4_7X((width)/3.0, (height)/3.0)

@interface UIDevice (screen___)

/// 竖直方向 输入源(4.7寸)
+ (CGFloat)convertVFrom_4_7:(CGFloat)number;
/// 竖直方向 输入源(5.5寸)
+ (CGFloat)convertVFrom_5_5:(CGFloat)number;

/// 纵向 输入源(4.7寸)
+ (CGFloat)convertHFrom_4_7:(CGFloat)number;
/// 纵向 输入源(5.5寸)
+ (CGFloat)convertHFrom_5_5:(CGFloat)number;

/// 字体size 输入源(4.7寸)
+ (CGFloat)convertFontSizeFrom_4_7:(CGFloat)number;
/// 字体size 输入源(5.5寸)
+ (CGFloat)convertFontSizeFrom_5_5:(CGFloat)number;

/// CGFloat
+ (CGSize)convertCGSizeMake4_7WithWidth:(CGFloat) width height:(CGFloat) height;
/// CGFloat
+ (CGSize)convertCGSizeMake5_5WithWidth:(CGFloat) width height:(CGFloat) height;

+ (UIDevice_Screen) currentScreen;

@end
