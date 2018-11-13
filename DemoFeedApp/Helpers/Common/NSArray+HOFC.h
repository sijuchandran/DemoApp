//
//  NSArray+HOFC.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 11/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HOFC)

- (NSArray *)map:(id (^)(id obj))block
           class:(Class)aClass;
- (NSArray *)filter:(BOOL (^)(id obj))block
              class:(Class)aClass;
- (id)reduce:(id)initial
       block:(id (^)(id obj1, id obj2))block
       class:(Class)aClass;
- (NSArray *)flatMap:(id (^)(id obj))block
               class:(Class)aClass;
- (BOOL)contains:(BOOL (^)(id obj))block
           class:(Class)aClass;
- (void)forEach:(void (^)(id obj))block
          class:(Class)aClass;

@end
