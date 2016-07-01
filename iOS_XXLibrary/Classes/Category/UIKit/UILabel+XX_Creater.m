//
//  UILabel+XX_Creater.m
//  iOS_XXLibrary
//
//  Created by LXF on 16/6/27.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "UILabel+XX_Creater.h"

@implementation UILabel (XX_Creater)

-(instancetype)initWithFont:(CGFloat)fontSize color:(UIColor *)color text:(NSString *)text{
    self = [super init];
    if (self == nil) {
        return self;
    }
    if (fontSize) {
        self.font = [UIFont systemFontOfSize:fontSize];
    }
    if (color) {
        self.textColor = color;
    }
    
    self.text = text;
    
    [self sizeToFit];
    
    return self;
}


@end
