//
//  XXURLInfo.m
//  Pods
//
//  Created by LXF on 16/6/29.
//
//

#import "XXURLInfo.h"

@implementation XXURLInfo

- (NSString *)generateAbsoluteStringWithBaseURL:(NSURL *)baseURL parameter:(NSDictionary **)parameter error:(NSError **)error{
    NSString *absUrl = [self processParameter:parameter error:error];
    return [[NSURL URLWithString:absUrl relativeToURL:baseURL] absoluteString];
}

- (NSString *)processParameter:(NSDictionary **)parameter error:(NSError **)error{
    NSString *Url = self.url;
    NSDictionary *para = *parameter;
    
    if ([Url rangeOfString:@"{"].location != NSNotFound && para != nil && para.count > 0)
    {
        NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
        __block NSString *urlTemp = Url.copy;
        [para enumerateKeysAndObjectsUsingBlock:^(id  key, id  obj, BOOL * stop) {
            NSString *keyT = [NSString stringWithFormat:@"{%@}",key];
            NSRange range = [urlTemp rangeOfString:keyT];
            if (range.location == NSNotFound) {
                [dictM setObject:obj forKey:key];
            }else{
                if ([obj isKindOfClass:[NSString class]] == false) {
                    obj = [obj description];
                }
                urlTemp = [urlTemp stringByReplacingOccurrencesOfString:keyT withString:obj];
            }
        }];
        Url = urlTemp;
        *parameter = dictM.count ? dictM.copy : nil;
        
    }
    return Url;
}

@end
