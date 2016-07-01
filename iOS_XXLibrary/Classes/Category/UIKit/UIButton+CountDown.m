//
//  UIButton+CountDown.m
//  yinshiyun-demo-2
//
//  Created by LXF on 15/12/17.
//  Copyright © 2015年 LXF. All rights reserved.
//

#import "UIButton+CountDown.h"
#import <objc/runtime.h>

const char endCountDownKey;
@implementation UIButton (CountDown)


-(BOOL)isEndCountDown{
    return [objc_getAssociatedObject(self, (void *)&endCountDownKey) boolValue];
}
-(void)setEndCountDown:(BOOL)endCountDown{
    self.enabled = endCountDown;
    objc_setAssociatedObject(self, (void *)&endCountDownKey, [NSNumber numberWithBool:endCountDown], OBJC_ASSOCIATION_COPY);
}

-(void)startCountDown:(NSInteger)count showText:(NSString *)text complete:(void (^)())complete{
    [self setEndCountDown:NO];
    __weak typeof(self) weakSelf = self;
    [self setTitle:[NSString stringWithFormat:text,count] forState:UIControlStateNormal];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.isEndCountDown || count <= 0) {
                [self setEndCountDown:YES];
                complete();
                return ;
            }
            [weakSelf startCountDown: count - 1 showText:text complete:complete];
        });
    });
    
}

@end
