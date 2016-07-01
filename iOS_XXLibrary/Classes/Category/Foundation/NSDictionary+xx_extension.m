//
//  NSDictionary+xx_extension.m
//  dyss_v2
//
//  Created by LXF on 16/4/6.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import "NSDictionary+xx_extension.h"

@implementation NSDictionary (xx_extension)

-(id)anyKey{
    return self.allKeys.firstObject;
}

-(id)anyObject{
    id key = self.anyKey;
    if (key) {
        return [self objectForKey:key];
    }
    return nil;
}

-(NSDictionary *)dictionaryWithRemoveForKey:(NSString *)key{
    NSMutableDictionary *dict = self.mutableCopy;
    [dict removeObjectForKey:key];
    return dict.copy;
}

+(NSDictionary *)dictionaryWithContentsOfFileName:(NSString *)fileName{
    NSString *path = [[NSBundle mainBundle]pathForResource:fileName ofType:@""];
    NSDictionary *a = [self dictionaryWithContentsOfFile:path];
    return a;
}

-(BOOL)containsKey:(id)key{
    return [self.allKeys containsObject:key];
}

@end
