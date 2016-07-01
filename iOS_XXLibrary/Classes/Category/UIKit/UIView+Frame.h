//
//  UIView+Frame.h
//
//
//  Created by lxf on 14/12/15.
//  Copyright (c) 2014年 lxf All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
// shortcuts for frame properties
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

// shortcuts for positions
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;


@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;

@property (nonatomic) CGFloat maxX;
@property (nonatomic) CGFloat maxY;

@property (nonatomic) CGFloat minX;
@property (nonatomic) CGFloat minY;
@end
