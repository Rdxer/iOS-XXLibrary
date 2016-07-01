//
//  UIView+cuttingLine.h
//  dyss_v2
//
//  Created by LXF on 16/2/3.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+AutoLayout.h"

typedef NS_ENUM(NSInteger, xx_CuttingLine){
    /// 顶部填充
    xx_CuttingLineTop = xx_FillTypeTop,
    /// 左边填充
    xx_CuttingLineLeft = xx_FillTypeLeft,
    /// 下填充
    xx_CuttingLineBotton = xx_FillTypeBotton,
    /// 右填充
    xx_CuttingLineRight = xx_FillTypeRight
};

@interface UIView (cuttingLine)

-(void)setCuttingLineWithType:(xx_CuttingLine)type enabled:(BOOL)enabled color:(UIColor *)color insets:(UIEdgeInsets)insets;

-(void)enabledCuttingLineWithType:(xx_CuttingLine)type color:(UIColor *)color insets:(UIEdgeInsets)insets;

@property (nonatomic, strong) NSMutableDictionary *xx_cuttingLineViews;

@end
