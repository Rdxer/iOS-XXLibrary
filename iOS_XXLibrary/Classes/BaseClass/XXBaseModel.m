//
//  BaseModel.m
//  dyss_v2
//
//  Created by LXF on 16/1/27.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "XXBaseModel.h"

#import <YYModel.h>

@interface XXBaseModel ()

@property (nonatomic, assign) BOOL isInit__ID__;

@end

@implementation XXBaseModel

-(NSInteger)__id__{
    if (self.isInit__ID__ == NO) {
        [super setValue:@(self.objectIdentifier) forKey:@"__id__"];
        self.isInit__ID__ = YES;
    }
    return [super __id__];
}

-(NSInteger)objectIdentifier{
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if ([self respondsToSelector:@selector(id)]) {
        id __id = [self valueForKey:@"id"];
        if ([__id respondsToSelector:@selector(integerValue)]) {
            return __id ? [__id integerValue] : -1;
        }
    }
#pragma clang diagnostic pop
    
    if ([self respondsToSelector:@selector(identifier)]) {
        id __identifier = [self valueForKey:@"identifier"];
        if ([__identifier respondsToSelector:@selector(integerValue)]) {
            return __identifier ? [__identifier integerValue] : -1;
        }
    }
    
    return -1;
}

+(NSArray *)xx_ignoreKeyArray{
    return [[super xx_ignoreKeyArray]arrayByAddingObjectsFromArray:@[
                                                                     @"isInit__ID__"
                                                                     ]];
}

+(instancetype)modelWithDict:(NSDictionary *)dict{
    XXBaseModel *model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

+(NSArray<XXBaseModel *> *)modelsWithDicts:(NSArray *)dicts{
    NSMutableArray<XXBaseModel *> * arrrayM = @[].mutableCopy;
    for (NSDictionary *dict in dicts) {
        [arrrayM addObject:[self modelWithDict:dict]];
    }

    return arrrayM;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([XXBaseModel convertKeys][key]) {
        [self setValue:value forKey:[XXBaseModel convertKeys][key]];
    }
}

+(NSDictionary *)convertKeys{
    return @{
             @"id" : @"identifier"
             };
}

-(NSString *)toJSONString{
    return [self yy_modelToJSONString];
}

-(NSString *)description{
    return [[super description] stringByAppendingString:[self yy_modelToJSONString]];
}
//+(instancetype)modelWithJSONString:(NSString *)jsonStr{
//    
//    NSError *error = nil;
//    
//    id result = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&error];
//    
//    if (result == nil || [result isKindOfClass:[NSDictionary class]] == NO) {
//        printE(@"此 JSONString 不是 字典的 JSON 字符串 %@, error: %@", jsonStr, error);
//        return nil;
//    }
//    
//    return [self modelWithDict:result];
//}





@end
