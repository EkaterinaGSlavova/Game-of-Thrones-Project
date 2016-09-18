//
//  TaskTests.m
//  TaskTests
//
//  Created by Ekaterina on 9/12/16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MasterTableViewController.h"
#import "DetailViewController.h"

@interface TaskTests : XCTestCase

@property (nonatomic) MasterTableViewController *masterViewController;
@end

@implementation TaskTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.masterViewController = [[MasterTableViewController alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        [self.masterViewController httpGetRequest];
    }];
}

@end
