//
//  BaseView.h
//  dyss_v2
//
//  Created by LXF on 16/1/27.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView


-(void)initDataWithFrame:(CGRect)frame;
-(void)initUIWithFrame:(CGRect)frame;
-(void)bindEventWithFrame:(CGRect)frame;
-(void)layoutContentViewWithFrame:(CGRect)frame;

-(void)initialCompleted;

@end
