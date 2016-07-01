//
//  NSDictionary+JSONString.m
//

#import "NSDictionary+JSONString.h"
#import "CustomLogTools.h"

@implementation NSDictionary (JSONString)
/**
 *  @brief NSDictionary转换成JSON字符串
 *
 *  @return  JSON字符串
 */
-(NSString *)JSONString{
    NSError *error = nil;
    
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:&error];
    if (jsonData == nil) {
        printE(@"字典转化为 JSON 字符串失败!!!: %@, error: %@", self, error);
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}


@end
