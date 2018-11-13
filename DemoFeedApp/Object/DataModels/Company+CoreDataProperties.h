//
//  Company+CoreDataProperties.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//
//

#import "Company+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Company (CoreDataProperties)

+ (NSFetchRequest<Company *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *companyName;
@property (nullable, nonatomic, copy) NSString *bs;
@property (nullable, nonatomic, copy) NSString *catchPhrase;
@property (nullable, nonatomic, retain) AuthorDetailsInfo *author;

@end

NS_ASSUME_NONNULL_END
