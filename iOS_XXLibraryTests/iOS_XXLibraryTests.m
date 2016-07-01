//
//  iOS_XXLibraryTests.m
//  iOS_XXLibraryTests
//
//  Created by LXF on 16/6/25.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+XX_Extension.h"

#import <AFNetworking.h>

@interface iOS_XXLibraryTests : XCTestCase


@end

@implementation iOS_XXLibraryTests

- (void)setUp {
    [super setUp];

}

- (void)tearDown {

    [super tearDown];
}

/// 异步测试
- (void)testThatItAppendsAString{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Handler called"];
    AFHTTPSessionManager *m = [AFHTTPSessionManager manager];
    [m GET:@"http://www.baidu.com" parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [expectation fulfill];
        XCTAssertNotNil(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [expectation fulfill];
        XCTFail(@"网络请求失败....");
    }];
    // 这么多时间内运行完毕
    [self waitForExpectationsWithTimeout:15 handler:nil];
}


@end
