//
//  UIScrollView+XXExtensin.m
//  dyss_v2
//
//  Created by LXF on 16/1/31.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "UIScrollView+XXExtensin.h"

@implementation UIScrollView (XXExtensin)

-(void)setInset_top:(CGFloat)inset_top{
    UIEdgeInsets inset = self.contentInset;
    inset.top = inset_top;
    self.contentInset = inset;
}
-(CGFloat)inset_top{
    return self.contentInset.top;
}

-(void)setInset_bottom:(CGFloat)inset_bottom{
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = inset_bottom;
    self.contentInset = inset;
}
-(CGFloat)inset_bottom{
    return self.contentInset.bottom;
}

-(void)setInset_left:(CGFloat)inset_left{
    UIEdgeInsets inset = self.contentInset;
    inset.left = inset_left;
    self.contentInset = inset;
}
-(CGFloat)inset_left{
    return self.contentInset.left;
}

-(void)setInset_right:(CGFloat)inset_right{
    UIEdgeInsets inset = self.contentInset;
    inset.right = inset_right;
    self.contentInset = inset;
}
-(CGFloat)inset_right{
    return self.contentInset.right;
}

- (void)setOffset_x:(CGFloat)offset_x
{
    CGPoint offset = self.contentOffset;
    offset.x = offset_x;
    self.contentOffset = offset;
}

- (CGFloat)offset_x
{
    return self.contentOffset.x;
}

- (void)setOffset_y:(CGFloat)offset_y
{
    CGPoint offset = self.contentOffset;
    offset.y = offset_y;
    self.contentOffset = offset;
}

- (CGFloat)offset_y
{
    return self.contentOffset.y;
}

- (void)setContent_width:(CGFloat)content_width
{
    CGSize size = self.contentSize;
    size.width = content_width;
    self.contentSize = size;
}

- (CGFloat)content_width
{
    return self.contentSize.width;
}

- (void)setContent_height:(CGFloat)content_height
{
    CGSize size = self.contentSize;
    size.height = content_height;
    self.contentSize = size;
}

- (CGFloat)content_height
{
    return self.contentSize.height;
}


@end
