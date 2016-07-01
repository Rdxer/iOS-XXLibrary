//
//  UIScrollView+XXExtensin.h
//  dyss_v2
//
//  Created by LXF on 16/1/31.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (XXExtensin)

@property (assign, nonatomic) CGFloat inset_top;
@property (assign, nonatomic) CGFloat inset_bottom;
@property (assign, nonatomic) CGFloat inset_left;
@property (assign, nonatomic) CGFloat inset_right;

@property (assign, nonatomic) CGFloat offset_x;
@property (assign, nonatomic) CGFloat offset_y;

@property (assign, nonatomic) CGFloat content_width;
@property (assign, nonatomic) CGFloat content_height;

@end
