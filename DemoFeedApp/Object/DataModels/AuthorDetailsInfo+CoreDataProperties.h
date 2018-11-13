//
//  AuthorDetailsInfo+CoreDataProperties.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//
//

#import "AuthorDetailsInfo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface AuthorDetailsInfo (CoreDataProperties)

+ (NSFetchRequest<AuthorDetailsInfo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *email;
@property (nonatomic) int16_t idVal;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *phone;
@property (nullable, nonatomic, copy) NSString *username;
@property (nullable, nonatomic, copy) NSString *website;
@property (nullable, nonatomic, retain) Address *address;
@property (nullable, nonatomic, retain) Company *company;

@end

NS_ASSUME_NONNULL_END
