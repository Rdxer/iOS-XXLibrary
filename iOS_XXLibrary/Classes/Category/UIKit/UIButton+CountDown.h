//
//  UIButton+CountDown.h
//  yinshiyun-demo-2
//
//  Created by LXF on 15/12/17.
//  Copyright © 2015年 LXF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)

/// 开始倒计时
-(void)startCountDown:(NSInteger)count showText:(NSString *)text complete:(void (^)())complete;

/// 是否正在倒计时以及需要停止倒计时(set = YES)
@property (nonatomic, assign, getter=isEndCountDown) BOOL endCountDown;


@end
