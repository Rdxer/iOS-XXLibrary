//
//  XXConstant.m
//  Pods
//
//  Created by Rdxer on 16/9/3.
//
//

#import "XXConstant.h"

@implementation XXConstant

+(void)load{
    xx___dispatch_serial_queue = dispatch_queue_create("XXConstant.serialQueue", DISPATCH_QUEUE_SERIAL);
}

@end

dispatch_queue_t xx___dispatch_serial_queue;
dispatch_queue_t dispatch_get_serial_queue(){
    return xx___dispatch_serial_queue;
}
