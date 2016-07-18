//
//  BaseModel.h
//  dyss_v2
//
//  Created by LXF on 16/1/27.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STDbKit.h"
#import <CustomLogTools.h>

@interface XXBaseModel : STDbObject

// 子类请重写 并且返回唯一标示数字 如果 允许本地创建 可以返回 -1 为自动创建;
// 不重写 也行. 自动调用 id / identifier 的 转为为 int 
-(NSInteger)objectIdentifier;

+(instancetype)modelWithDict:(NSDictionary *)dict;

+(NSArray<XXBaseModel *> *)modelsWithDicts:(NSArray *)dicts;

-(NSString *)toJSONString;

@end
