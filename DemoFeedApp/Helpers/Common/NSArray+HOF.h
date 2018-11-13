//
//  NSArray+HOF.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 11/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HOF)

- (NSArray *)map:(id (^)(id obj))block;
- (NSArray *)filter:(BOOL (^)(id obj))block;
- (id)reduce:(id)initial
       block:(id (^)(id obj1, id obj2))block;
- (NSArray *)flatMap:(id (^)(id obj))block;
- (BOOL)contains:(BOOL (^)(id obj))block;
- (void)forEach:(void (^)(id obj))block;

@end
