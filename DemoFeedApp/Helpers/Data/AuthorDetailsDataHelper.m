//
//  AuthorDetailsDataHelper.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "AuthorDetailsDataHelper.h"
#import "Address+CoreDataClass.h"
#import "Company+CoreDataClass.h"


@implementation AuthorDetailsDataHelper

+(void)parseAuthorDetailsResponse:(NSMutableArray *) authorInfoArray {
    
    
    NSManagedObjectContext *context = [CoreDataContext getManagedObjectContext];
    
    /*! clear already existing posts coredata */
    if ([authorInfoArray count] > 0) {
        [self clearAllData];
    }
    
    [authorInfoArray map:^id(id obj) { return [self createAuthorDetailsFrom: (NSDictionary *) obj]; }];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
}



/*!
 @brief Map the author details data to corresponding NSManagedObject Modal.
 
 @param  authorDetailInfoDictionary The dictionary of author details.
 
 @return NSManagedObject The mapped model of author details.
 
*/



+(NSManagedObject *)createAuthorDetailsFrom:(NSDictionary *) authorDetailInfoDictionary {

    NSManagedObjectContext *context = [CoreDataContext getManagedObjectContext];

    Address *addressObjectModel = [NSEntityDescription insertNewObjectForEntityForName:@"Address" inManagedObjectContext:context];
    
    
    if(addressObjectModel != nil) {
        NSMutableDictionary *addressDic = [authorDetailInfoDictionary objectForKey:@"address"];
        addressObjectModel.suite = [addressDic objectForKey:@"suite"];
        addressObjectModel.city = [addressDic objectForKey:@"city"];
        addressObjectModel.zipcode = [addressDic objectForKey:@"zipcode"];
        addressObjectModel.street = [addressDic objectForKey:@"street"];
        
        NSMutableDictionary *geoDic = [authorDetailInfoDictionary objectForKey:@"geo"];
        addressObjectModel.lat = [[geoDic objectForKey:@"lat"] doubleValue];
        addressObjectModel.lag = [[geoDic objectForKey:@"lng"] doubleValue];
        
    }
    
    Company *companyObjectModel = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:context];
    
    
    if(companyObjectModel != nil) {
        NSMutableDictionary *companyDic = [authorDetailInfoDictionary objectForKey:@"company"];
        companyObjectModel.companyName = [companyDic objectForKey:@"name"];
        companyObjectModel.catchPhrase = [companyDic objectForKey:@"catchPhrase"];
        companyObjectModel.bs = [companyDic objectForKey:@"bs"];
    }
    

    AuthorDetailsInfo *infoObjectModel = [NSEntityDescription insertNewObjectForEntityForName:@"AuthorDetailsInfo" inManagedObjectContext:context];
    if (infoObjectModel != nil) {
        
        infoObjectModel.name = [authorDetailInfoDictionary objectForKey:@"name"];
        infoObjectModel.idVal = [[authorDetailInfoDictionary objectForKey:@"id"] intValue];
        infoObjectModel.username = [authorDetailInfoDictionary objectForKey:@"username"];
        infoObjectModel.email = [authorDetailInfoDictionary objectForKey:@"email"];
        infoObjectModel.address = addressObjectModel;
        infoObjectModel.phone = [authorDetailInfoDictionary objectForKey:@"phone"];
        infoObjectModel.website = [authorDetailInfoDictionary objectForKey:@"website"];
        infoObjectModel.company = companyObjectModel;
     
        
    }
    return infoObjectModel;
}

/*!
 @brief clear all data in Author details .
 
 */

+(void) clearAllData {
    
    
    NSManagedObjectContext *context = [CoreDataContext getManagedObjectContext];
    NSFetchRequest *fetchRequest=  [NSFetchRequest fetchRequestWithEntityName:@"AuthorDetailsInfo"];
    @try {
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        NSError *deleteError = nil;
        [context executeRequest:delete error:&deleteError];
        
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
    }
    
    
}

+(AuthorDetailsInfo *) getAuthorDetailsUsingUserId:(NSInteger) userId {
    
    NSArray *fetchedObjects;
    NSManagedObjectContext *context = [CoreDataContext getManagedObjectContext];
    NSFetchRequest *fetchRequest=  [NSFetchRequest fetchRequestWithEntityName:@"AuthorDetailsInfo"];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"AuthorDetailsInfo"  inManagedObjectContext: context];
    [fetchRequest setEntity:entityDescription];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"idVal == %d",userId]];
    
    NSError * error = nil;
    fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    if([fetchedObjects count] == 1)
        return [fetchedObjects objectAtIndex:0];
    else
        return nil;
}


@end
