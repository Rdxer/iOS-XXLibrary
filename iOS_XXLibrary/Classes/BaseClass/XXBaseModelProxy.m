//
//  BaseModelProxy.m
//  dyss_v2
//
//  Created by LXF on 16/1/27.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "XXBaseModelProxy.h"
#import "XXBaseModel.h"
#import <objc/runtime.h>
#import <YYModel.h>

@interface XXBaseModelProxy ()

@property (nonatomic, strong) XXBaseModel *model;

@end

@implementation XXBaseModelProxy

-(BOOL)insertToDb{
    __block BOOL res = false;
    STDbQueue *dbQueue = [STDbQueue defaultQueue];
    [dbQueue execute:^(STDb *db) {
        res = [db insertDbObject:self.model];
    }];
    return res;
}
-(BOOL)replaceToDb{
    __block BOOL res = false;
    STDbQueue *dbQueue = [STDbQueue defaultQueue];
    [dbQueue execute:^(STDb *db) {
        res = [db replaceDbObject:self.model];
    }];
    return res;
}
-(BOOL)removeFromDb{
    __block BOOL res = false;
    STDbQueue *dbQueue = [STDbQueue defaultQueue];
    [dbQueue execute:^(STDb *db) {
        res = [self.model removeFromDb];
    }];
    return res;
}


+(NSArray *)allModelProxy{
    // 取出所有用户
    NSArray *models = [[self modelClass] allDbObjects];
    return [self mpsWithModels:models];
}

+(Class)modelClass{
    return objc_getAssociatedObject(self, _cmd);
}

+(void)setModelClass:(Class)clazz{
    objc_setAssociatedObject(self, @selector(modelClass), clazz, OBJC_ASSOCIATION_RETAIN);
}

+(Class)modelClassSafe{
    Class clazz = [self modelClass];
    if (clazz) {
        return clazz;
    }
    
    NSString *clazzName = [NSStringFromClass(self) stringByReplacingOccurrencesOfString:@"Proxy" withString:@""];
    clazz = NSClassFromString(clazzName);
    
    if ([clazz isSubclassOfClass:[XXBaseModel class]]) {
        [self setModelClass:clazz];
        return clazz;
    }
    
//     (@"请检查继承的类型(%@)是否是 BaseModel 的子类型.class<%@>. 或者名字是否为 <ModelClassName>+Proxy",clazz,self);
    return nil;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        //self.model = [[[self.class modelClassSafe] alloc] init];
    }
    return self;
}

+(instancetype)mpWithModel:(XXBaseModel *)model{
    XXBaseModelProxy *mp = [[self alloc]init];
    
    mp.model = model;
    
    return mp;
}

/// 创建 proxy 默认方法
///
/// @param modelDict 模型的字典
+(instancetype)mpWithModelDict:(NSDictionary *)modelDict{
    XXBaseModelProxy *mp = [[self alloc]init];
    
    mp.model = [[self modelClassSafe]modelWithDict:modelDict];
    
    return mp;
}

+(instancetype)mpWithModelJson:(NSString *)modelJson{
    
    if (modelJson == nil) {
        return nil;
    }
    if ([modelJson isEqual:@""]) {
        return nil;
    }
    
    XXBaseModelProxy *mp = [[self alloc]init];
    
    mp.model = [[self modelClassSafe] yy_modelWithJSON:modelJson];
    
    return mp;
}

+(NSArray *)mpsWithModels:(NSArray *)models{
    if (models.count < 1) {
        return [NSArray array];
    }
    NSMutableArray *arrayM = [NSMutableArray array];
    for (XXBaseModel *model in models) {
        [arrayM addObject:[self mpWithModel:model]];
    }
    return arrayM;
}

+(NSArray *)mpsWithDicts:(NSArray *)dicts{
    if (dicts.count < 1) {
        return [NSArray array];
    }
    Class clazz = [self modelClassSafe];
    NSArray *array = [clazz modelsWithDicts:dicts];
    array = [self mpsWithModels:array];
    return array;
}

+(NSArray *)modelsWithMps:(NSArray *)mps{
    NSMutableArray *arrarM = [NSMutableArray array];
    
    for (XXBaseModelProxy *mp in mps) {
        [arrarM addObject:mp.model];
    }
    
    return arrarM.copy;
}

-(NSString *)description{
    return [self yy_modelToJSONString];
}

@end
