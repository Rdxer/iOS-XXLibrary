//
//  BaseView.m
//  dyss_v2
//
//  Created by LXF on 16/1/27.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDataWithFrame:frame];
        [self initUIWithFrame:frame];
        [self layoutContentViewWithFrame:frame];
        [self bindEventWithFrame:frame];
        [self initialCompleted];
    }
    return self;
}

-(void)initDataWithFrame:(CGRect)frame{};
-(void)initUIWithFrame:(CGRect)frame{};
-(void)bindEventWithFrame:(CGRect)frame{};
-(void)layoutContentViewWithFrame:(CGRect)frame{};

-(void)initialCompleted{};


@end
