//
//  NSDictionary+xx_extension.h
//  dyss_v2
//
//  Created by LXF on 16/4/6.
//  Copyright © 2016年 First Facility. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary<KeyType, ObjectType> (xx_extension)

-(NSDictionary *)dictionaryWithRemoveForKey:(KeyType)key;

+(NSDictionary *)dictionaryWithContentsOfFileName:(NSString *)fileName;

/// 是否存在此 key
///
/// @param key <#key description#>
///
/// @return <#return value description#>
-(BOOL)containsKey:(KeyType)key;

- (ObjectType)anyObject;
- (KeyType)anyKey;

@end
