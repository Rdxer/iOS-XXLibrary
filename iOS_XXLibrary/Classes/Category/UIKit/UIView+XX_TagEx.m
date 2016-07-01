//
//  UIView+XX_TagEx.m
//  iOS_XXLibrary
//
//  Created by LXF on 16/6/27.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "UIView+XX_TagEx.h"
#import <objc/runtime.h>

@implementation UIView (XX_TagEx)
-(id)tagEX{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setTagEX:(id)tagEX{
    objc_setAssociatedObject(self, @selector(tagEX), tagEX, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
