//
//  TaskUITests.m
//  TaskUITests
//
//  Created by Ekaterina on 9/12/16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TaskUITests : XCTestCase

@end

@implementation TaskUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *tablesQuery = app.tables;
    [tablesQuery.staticTexts[@"Prince Rhaegar Targaryen is an unseen character in Game of Thrones. He is deceased when the..."] pressForDuration:3.8];
    [app.navigationBars[@"Rhaegar Targaryen"].buttons[@"Characters"] tap];
    [tablesQuery.staticTexts[@"Lord Ramsay Bolton, formerly known as Ramsay Snow, is a major character in the fourth, fifth and..."] pressForDuration:0.6];
    [app.buttons[@"Go to article"] tap];
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationLandscapeRight;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationLandscapeRight;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationLandscapeRight;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationLandscapeRight;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortraitUpsideDown;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationLandscapeLeft;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationLandscapeLeft;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    [app.navigationBars[@"Ramsay Bolton"].buttons[@"Characters"] tap];
    
}

@end
