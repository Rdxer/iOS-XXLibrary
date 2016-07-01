//
//  UIButton+creater.m
//  FirstSmartHome
//
//  Created by LXF on 16/1/22.
//  Copyright © 2016年 FirstFacility. All rights reserved.
//

#import "UIButton+XX_Creater.h"

@implementation UIButton (creater)

+(instancetype)buttonWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage title:(NSString *)title{
//    UIButton *button = highlightedImage ? [self buttonWithType:UIButtonTypeCustom] : [self buttonWithType:UIButtonTypeSystem];
    UIButton *button = [self buttonWithType:UIButtonTypeCustom] ;
    
    if (button == nil) {
        return nil;
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    if (highlightedImage) {
        [button setImage:highlightedImage forState:UIControlStateHighlighted];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    [button sizeToFit];
    
    return button;
}

+(instancetype)buttonWithBImage:(UIImage *)image highlightedBImage:(UIImage *)highlightedImage title:(NSString *)title{
    //    UIButton *button = highlightedImage ? [self buttonWithType:UIButtonTypeCustom] : [self buttonWithType:UIButtonTypeSystem];
    UIButton *button = [self buttonWithType:UIButtonTypeCustom] ;
    
    if (button == nil) {
        return nil;
    }
    if (image) {
        [button setBackgroundImage:image forState:UIControlStateNormal];
    }
    if (highlightedImage) {
        [button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    [button sizeToFit];
    
    return button;
}

+(instancetype)buttonWithTitleColor:(UIColor *)colorN titleColorH:(UIColor *)colorH title:(NSString *)title{
    //    UIButton *button = highlightedImage ? [self buttonWithType:UIButtonTypeCustom] : [self buttonWithType:UIButtonTypeSystem];
    
    UIButton *button = [self buttonWithType:UIButtonTypeCustom] ;
    
    if (button == nil) {
        return nil;
    }
    
    if (colorN) {
        [button setTitleColor:colorN forState:UIControlStateNormal];
    }
    
    if (colorH) {
        [button setTitleColor:colorH forState:UIControlStateHighlighted];
    }
    
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    [button sizeToFit];
    
    return button;
}

+(instancetype)buttonWithTitleColor:(UIColor *)colorN titleColorSelected:(UIColor *)colorSelected title:(NSString *)title{
    
    UIButton *button = [self buttonWithType:UIButtonTypeCustom] ;
    
    if (button == nil) {
        return nil;
    }
    
    if (colorN) {
        [button setTitleColor:colorN forState:UIControlStateNormal];
    }
    
    if (colorSelected) {
        [button setTitleColor:colorSelected forState:UIControlStateSelected];
    }
    
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    [button sizeToFit];
    
    return button;
}
-(void)setTitleColor:(UIColor *)colorN titleColorSelected:(UIColor *)colorSelected;
{
    [self setTitleColor:colorN forState:UIControlStateNormal];
    [self setTitleColor:colorSelected forState:UIControlStateSelected];
}
-(void)setImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage{
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:highlightedImage forState:UIControlStateHighlighted];
}

-(void)setImage:(UIImage *)image selectedImage:(UIImage *)selectedImage{
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:selectedImage forState:UIControlStateSelected];
}

-(void)setBackgroundImage:(UIImage *)backgroundImage h_BackgroundImage:(UIImage *)h_BackgroundImage{
    [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [self setBackgroundImage:h_BackgroundImage forState:UIControlStateHighlighted];
}

-(void)setBackgroundImage:(UIImage *)backgroundImage s_BackgroundImage:(UIImage *)s_BackgroundImage{
    [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [self setBackgroundImage:s_BackgroundImage forState:UIControlStateSelected];
}

@end
