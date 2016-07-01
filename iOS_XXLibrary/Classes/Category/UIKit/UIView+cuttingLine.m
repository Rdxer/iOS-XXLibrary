//
//  UIView+cuttingLine.m
//  dyss_v2
//
//  Created by LXF on 16/2/3.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "UIView+cuttingLine.h"
#import <objc/runtime.h>
#import <Masonry.h>

@implementation UIView (cuttingLine)

-(NSMutableDictionary *)xx_cuttingLineViews{
    // _cmd = @selector(xx_cuttingLineViews) sel
    NSMutableDictionary *dict = objc_getAssociatedObject(self, _cmd);
    if (dict == nil) {
        dict = [NSMutableDictionary dictionary];
        [self setXx_cuttingLineViews:dict];
    }
    return dict;
}

-(void)setXx_cuttingLineViews:(NSMutableDictionary *)xx_cuttingLineViews{
    objc_setAssociatedObject(self, @selector(xx_cuttingLineViews), xx_cuttingLineViews, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setCuttingLineWithType:(xx_CuttingLine)type enabled:(BOOL)enabled color:(UIColor *)color insets:(UIEdgeInsets)insets{
    
    
    UIView *cuttingLine = self.xx_cuttingLineViews[@(type)];
    if (cuttingLine == nil) {
        cuttingLine = [[UIView alloc]init];
        self.xx_cuttingLineViews[@(type)] = cuttingLine;
        [self addSubview:cuttingLine];
        //[cuttingLine xx_FillWithType:(xx_FillType)type referView:self constant:1 insets:insets];
        [self xx_layoutCuttingLine:type constant:1 insets:insets];
    }

    cuttingLine.backgroundColor = color;
    cuttingLine.hidden = !enabled;
}

-(void)enabledCuttingLineWithType:(xx_CuttingLine)type color:(UIColor *)color insets:(UIEdgeInsets)insets{
    [self setCuttingLineWithType:type enabled:YES color:color insets:insets];
}

- (void)xx_layoutCuttingLine:(xx_CuttingLine)type constant:(CGFloat)constant insets:(UIEdgeInsets)insets{
    UIView *view = self.xx_cuttingLineViews[@(type)];
    switch (type) {
        case xx_CuttingLineTop:
        {[view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(insets.top);
            make.left.mas_equalTo(self.mas_left).offset(insets.left);
            make.right.mas_equalTo(self.mas_right).offset(insets.right);
            make.height.mas_equalTo(constant);
            
        }];}
            break;
        case xx_CuttingLineLeft:
        {[view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(insets.left);
            make.top.mas_equalTo(self.mas_top).offset(insets.top);
            make.bottom.mas_equalTo(self.mas_bottom).offset(insets.bottom);
            make.width.mas_equalTo(constant);
        }];}
            break;
        case xx_CuttingLineBotton:
        {[view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.mas_bottom).offset(insets.bottom);
            make.left.mas_equalTo(self.mas_left).offset(insets.left);
            make.right.mas_equalTo(self.mas_right).offset(insets.right);
            make.height.mas_equalTo(constant);
            
        }];}
            break;
        case xx_CuttingLineRight:
        {[view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mas_right).offset(insets.right);
            make.top.mas_equalTo(self.mas_top).offset(insets.top);
            make.bottom.mas_equalTo(self.mas_bottom).offset(insets.bottom);
            make.width.mas_equalTo(constant);
        }];}
            break;
    }
}

@end
