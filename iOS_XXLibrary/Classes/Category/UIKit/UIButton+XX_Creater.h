//
//  UIButton+creater.h
//  FirstSmartHome
//
//  Created by LXF on 16/1/22.
//  Copyright © 2016年 FirstFacility. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (creater)

+(instancetype)buttonWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage title:(NSString *)title;
+(instancetype)buttonWithBImage:(UIImage *)image highlightedBImage:(UIImage *)highlightedImage title:(NSString *)title;
+(instancetype)buttonWithTitleColor:(UIColor *)colorN titleColorH:(UIColor *)colorH title:(NSString *)title;
+(instancetype)buttonWithTitleColor:(UIColor *)colorN titleColorSelected:(UIColor *)colorSelected title:(NSString *)title;

-(void)setTitleColor:(UIColor *)colorN titleColorSelected:(UIColor *)colorSelected;


-(void)setImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage;
-(void)setImage:(UIImage *)image selectedImage:(UIImage *)selectedImage;

-(void)setBackgroundImage:(UIImage *)backgroundImage h_BackgroundImage:(UIImage *)h_BackgroundImage;
-(void)setBackgroundImage:(UIImage *)backgroundImage s_BackgroundImage:(UIImage *)s_BackgroundImage;

@end
