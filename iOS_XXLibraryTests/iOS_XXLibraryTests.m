//
//  iOS_XXLibraryTests.m
//  iOS_XXLibraryTests
//
//  Created by LXF on 16/6/25.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+XX_Extension.h"

@interface iOS_XXLibraryTests : XCTestCase

@property (nonatomic) dispatch_group_t dispatchGroup;

@end

@implementation iOS_XXLibraryTests

- (void)performGroupedBlock:(dispatch_block_t)block{
    dispatch_group_enter(self.dispatchGroup);
    
//    [self performBlock:^{
//        block();
//        dispatch_group_leave(self.dispatchGroup);
//    }];
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/// 这是一个性能测试用例的一个例子。
- (void)testPerformanceExample {
    [self measureBlock:^{
//        for (int i = 0; i < 100000; i++) {
//            NSString *str = [NSString string];
//            NSLog(@"%@",str);
//        }
    }];
}

/// 异步测试
- (void)testThatItAppendsAString{
    NSString *s1 = @"Foo";
    XCTestExpectation *expectation = [self expectationWithDescription:@"Handler called"];
    
    [s1 appendString:@"Bar" resultHandler:^(NSString *result){
        [expectation fulfill];
        XCTAssertEqualObjects(result, @"xxxxx");
    }];
//    expectation = [self expectationWithDescription:@"Handler called"];
//    [s1 appendString:@"Bar" resultHandler:^(NSString *result){
//        [expectation fulfill];
//        XCTAssertEqualObjects(result, @"xxx1xx");
//    }];
//    expectation = [self expectationWithDescription:@"Handler called"];
//    [s1 appendString:@"Bar" resultHandler:^(NSString *result){
//        [expectation fulfill];
//        XCTAssertEqualObjects(result, @"xxxxx");
//    }];
//    expectation = [self expectationWithDescription:@"Handler called"];
//    [s1 appendString:@"Bar" resultHandler:^(NSString *result){
//        [expectation fulfill];
//        XCTAssertEqualObjects(result, @"xx1xxx");
//    }];
    // 这么多时间内运行完毕
    [self waitForExpectationsWithTimeout:15 handler:nil];
}


@end
