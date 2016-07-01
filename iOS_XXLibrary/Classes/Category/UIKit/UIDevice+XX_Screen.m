//
//  UIDevice+screen___.m
//  dyss_v2
//
//  Created by LXF on 16/2/3.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "UIDevice+XX_Screen.h"
#import "CustomLogTools.h"

#define CGSizeEqualToSize2(size1,size2) XX__CGSizeEqualToSize2(size1,size2)

CG_INLINE BOOL XX__CGSizeEqualToSize2(CGSize size1, CGSize size2)
{
    return ABS(size1.width - size2.width) < 0.000001 && ABS(size1.height - size2.height) < 0.000001;
}


@implementation UIDevice (screen___)

/// 判断当前屏幕是几寸屏幕
+ (UIDevice_Screen) currentScreen {
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
//            result = CGSizeMake(result.width * [UIScreen mainScreen].scale, result.height * [UIScreen mainScreen].scale);
//            printD(@"%zd",[[UIScreen mainScreen]scale]);
            if (CGSizeEqualToSize2(result, CGSizeiPhone_Retina_3_5)) {
                return UIDevice_Screen_iPhone_Retina_3_5;
            }
            if (CGSizeEqualToSize2(result, CGSizeiPhone_Retina_4)) {
                return UIDevice_Screen_iPhone_Retina_4;
            }
            if (CGSizeEqualToSize2(result, CGSizeiPhone_Retina_4_7)) {
                return UIDevice_Screen_iPhone_Retina_4_7;
            }
            if (CGSizeEqualToSize2(result, CGSizeiPhone_Retina_5_5)) {
                return UIDevice_Screen_iPhone_Retina_5_5;
            }
            printE(@"意料之外的屏幕尺寸!!!!");
            return UIDevice_Screen_iPhone_NORetina;
        } else{
            return UIDevice_Screen_iPhone_NORetina;
        }
    } else{
        return (([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) ? UIDevice_Screen_iPad_Retina : UIDevice_Screen_iPad_NORetina);
    }
}
#pragma mark - 竖直方向
/// 竖直方向
+ (CGFloat)convertVFrom_4_7:(CGFloat)number{
    return [self convertVFrom:number baseNumber:iPhone_Retina_4_7_H];
}
/// 竖直方向
+ (CGFloat)convertVFrom_5_5:(CGFloat)number{
    return [self convertVFrom:number baseNumber:iPhone_Retina_5_5_H];
}

+ (CGFloat)convertVFrom:(CGFloat)number baseNumber:(CGFloat)baseNumber{
    CGFloat result = number;
    CGFloat scale = 1;
    switch ([self currentScreen]) {
            // iPad
        case UIDevice_Screen_iPad_NORetina:
            break;
        case UIDevice_Screen_iPad_Retina:
            break;
            // iPhone
        case UIDevice_Screen_iPhone_NORetina:
            break;
        case UIDevice_Screen_iPhone_Retina_3_5:
            scale = iPhone_Retina_3_5_H / baseNumber;
            break;
        case UIDevice_Screen_iPhone_Retina_4:
            scale = iPhone_Retina_4_H / baseNumber;
            break;
        case UIDevice_Screen_iPhone_Retina_4_7:
            scale = iPhone_Retina_4_7_H / baseNumber;
            break;
        case UIDevice_Screen_iPhone_Retina_5_5:
            scale = iPhone_Retina_5_5_H / baseNumber;
            break;
    }
    return result * scale;
}

#pragma mark - 横向
/// 横
+ (CGFloat)convertHFrom_4_7:(CGFloat)number{
    return [self convertHFrom:number baseNumber:iPhone_Retina_4_7_W];
}
/// 横
+ (CGFloat)convertHFrom_5_5:(CGFloat)number{
    return [self convertHFrom:number baseNumber:iPhone_Retina_5_5_W];
}
+ (CGFloat)convertHFrom:(CGFloat)number baseNumber:(CGFloat)baseNumber{
    CGFloat result = number;
    CGFloat scale = 1;
    switch ([self currentScreen]) {
            // iPad
        case UIDevice_Screen_iPad_NORetina:
            break;
        case UIDevice_Screen_iPad_Retina:
            break;
            // iPhone
        case UIDevice_Screen_iPhone_NORetina:
            break;
        case UIDevice_Screen_iPhone_Retina_3_5:
            scale = iPhone_Retina_3_5_W / baseNumber;
            break;
        case UIDevice_Screen_iPhone_Retina_4:
            scale = iPhone_Retina_4_W / baseNumber;
            break;
        case UIDevice_Screen_iPhone_Retina_4_7:
            scale = iPhone_Retina_4_7_W / baseNumber;
            break;
        case UIDevice_Screen_iPhone_Retina_5_5:
            scale = iPhone_Retina_5_5_W / baseNumber;
            break;
    }
    return result * scale;
}

#pragma mark - 字体
/// 字体size 输入源(4.7寸)
+ (CGFloat)convertFontSizeFrom_4_7:(CGFloat)number{
    return [self convertFontSizeFrom:number baseNumber:iPhone_Retina_4_7_W];
}
/// 字体size 输入源(5.5寸)
+ (CGFloat)convertFontSizeFrom_5_5:(CGFloat)number{
    return [self convertFontSizeFrom:number baseNumber:iPhone_Retina_5_5_W];
}
+ (CGFloat)convertFontSizeFrom:(CGFloat)number baseNumber:(CGFloat)baseNumber{
    CGFloat result = number;
    CGFloat scale = 1;
    switch ([self currentScreen]) {
            // iPad
        case UIDevice_Screen_iPad_NORetina:
            break;
        case UIDevice_Screen_iPad_Retina:
            break;
            // iPhone
        case UIDevice_Screen_iPhone_NORetina:
            break;
        case UIDevice_Screen_iPhone_Retina_3_5:
            /// 3.5寸屏幕的字体 和 4寸屏幕的字体一样大小
            //scale = iPhone_Retina_3_5_W / baseNumber;
            //break;
        case UIDevice_Screen_iPhone_Retina_4:
            scale = iPhone_Retina_4_W / baseNumber;
            break;
        case UIDevice_Screen_iPhone_Retina_4_7:
            scale = iPhone_Retina_4_7_W / baseNumber;
            break;
        case UIDevice_Screen_iPhone_Retina_5_5:
            scale = iPhone_Retina_5_5_W / baseNumber;
            break;
    }
    return result * scale;
}

+ (CGSize)convertCGSizeMake4_7WithWidth:(CGFloat) width height:(CGFloat) height{
    if ([self currentScreen] == UIDevice_Screen_iPhone_Retina_3_5) {
        return CGSizeMake(nvW4_7X(width), nvW4_7X(height));
    }
    return CGSizeMake(nvW4_7X(width), nvH4_7X(height));
}

+ (CGSize)convertCGSizeMake5_5WithWidth:(CGFloat) width height:(CGFloat) height{
    if ([self currentScreen] == UIDevice_Screen_iPhone_Retina_3_5) {
        return CGSizeMake(nvW5_5X(width), nvW5_5X(height));
    }
    return CGSizeMake(nvW5_5X(width), nvH5_5X(height));
}


@end
