//
//  UITextField+leftSpace.m
//  dyss_v2
//
//  Created by LXF on 16/2/15.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "UITextField+leftSpace.h"
#import "UIView+Frame.h"

@implementation UITextField (leftSpace)

-(CGFloat)leftSpace{
    return self.leftView.width;
}
-(void)setLeftSpace:(CGFloat)leftSpace{
    UIView *leftView = self.leftView;
    if (leftSpace < 0) {
        return;
    }
    if (leftView == nil) {
        self.leftView = leftView = [[UIView alloc]init];
    }
    leftView.width = leftSpace;
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end
