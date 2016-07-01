//
//  BaseModelProxy.h
//  dyss_v2
//
//  Created by LXF on 16/1/27.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XXError.h"

#define proxyInterface(modelClazzName) \
@property (nonatomic, strong) modelClazzName *model;

#define proxyImplementation(modelClazzName) \
+(Class)modelClass{\
return [modelClazzName class];\
}

@class XXBaseModel;

@interface XXBaseModelProxy : NSObject

/// 返回当前proxy类代理的对应模型类型,请在子类中重写
///
/// @return  Clazz 继承自 BaseModel
+(Class)modelClass;

/// 创建 proxy 默认方法
///
/// @param model 模型
+(instancetype)mpWithModel:(XXBaseModel *)model;

/// 创建 proxy 默认方法
///
/// @param modelDict 模型的字典
+(instancetype)mpWithModelDict:(NSDictionary *)modelDict;

/// 创建 proxy
///
/// @param modelJsonString 模型json
+(instancetype)mpWithModelJson:(NSString *)modelJson;


/// 模型数组 转化为 proxy 数组
///
/// @param models models
///
/// @return proxys
+(NSArray *)mpsWithModels:(NSArray *)models;

/// proxy 数组转化为 模型数组
+(NSArray *)modelsWithMps:(NSArray *)mps;

/// 字典数组 转化为 proxy 数组
///
/// @param dicts 字典数组
///
/// @return  proxys
+(NSArray *)mpsWithDicts:(NSArray *)dicts;

@end


