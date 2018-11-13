//
//  DemoFeedAppTests.m
//  DemoFeedAppTests
//
//  Created by Siju Satheesachandran on 11/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SyncHelper.h"

@interface DemoFeedAppTests : XCTestCase

@end

@implementation DemoFeedAppTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}


- (void)testAsyncGetPostInfo
{
    
    //Expectation
    XCTestExpectation *expectation = [self expectationWithDescription:@"Get Post Info from server"];
    
    [SyncHelper getPosts:^(bool success){
        if (success)
        {
             [expectation fulfill];
        }
        else
        {
            
        }
    }];
    [self waitForExpectationsWithTimeout:1 handler:^(NSError *error) {
        
        if(error)
        {
            XCTFail(@"Expectation Failed with error: %@", error);
        }
        
    }];
    
}

- (void) testAsyncGetAuthorDetails
{
    
    //Expectation
    XCTestExpectation *expectation = [self expectationWithDescription:@"Get Author details from server"];
    
    [SyncHelper getDetails:^(bool success){
        if (success)
        {
            [expectation fulfill];
        }
        else
        {
            
        }
    }];
    [self waitForExpectationsWithTimeout:2 handler:^(NSError *error) {
        
        if(error)
        {
            XCTFail(@"Expectation Failed with error: %@", error);
        }
        
    }];
    
}



@end
