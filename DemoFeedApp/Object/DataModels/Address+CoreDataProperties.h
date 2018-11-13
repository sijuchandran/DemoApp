//
//  Address+CoreDataProperties.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//
//

#import "Address+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Address (CoreDataProperties)

+ (NSFetchRequest<Address *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *street;
@property (nullable, nonatomic, copy) NSString *suite;
@property (nullable, nonatomic, copy) NSString *city;
@property (nullable, nonatomic, copy) NSString *zipcode;
@property (nonatomic) double lat;
@property (nonatomic) double lag;
@property (nullable, nonatomic, retain) AuthorDetailsInfo *author;

@end

NS_ASSUME_NONNULL_END
