//
//  PostsDataHelper.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "PostsDataHelper.h"
#import "PostsInfo+CoreDataClass.h"





@implementation PostsDataHelper

+(void)parsePostInfoResponse:(NSMutableArray *) postInfoarray {
    
    
    
    NSManagedObjectContext *context = [CoreDataContext getManagedObjectContext];
    
    if ([postInfoarray count] > 0) {
        [self clearAllData];
    }
    
    [postInfoarray map:^id(id obj) { return [self createPostInfoFrom: (NSDictionary *) obj]; }];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
}

/*!
 @brief Map the post info data to corresponding NSManagedObject Modal.
 
 @param  postInfoDic The dictionary of post info.
 
 @return NSManagedObject The mapped model of post info.
 
 */

+(NSManagedObject *)createPostInfoFrom:(NSDictionary *) postInfoDic {
    
    NSManagedObjectContext *context = [CoreDataContext getManagedObjectContext];
    PostsInfo *infoObjectModel = [NSEntityDescription insertNewObjectForEntityForName:@"PostsInfo" inManagedObjectContext:context];
    if (infoObjectModel != nil) {
        infoObjectModel.body = [postInfoDic objectForKey:@"body"];
        infoObjectModel.idVal = [[postInfoDic objectForKey:@"id"] intValue];
        infoObjectModel.title = [postInfoDic objectForKey:@"title"];
        infoObjectModel.userId = [[postInfoDic objectForKey:@"userId"] intValue];
    }
    return infoObjectModel;
}



+(void) clearAllData {
    

    NSManagedObjectContext *context = [CoreDataContext getManagedObjectContext];
    NSFetchRequest *fetchRequest=  [NSFetchRequest fetchRequestWithEntityName:@"PostsInfo"];
    @try {
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        NSError *deleteError = nil;
        [context executeRequest:delete error:&deleteError];
        
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
    }
    

}






@end
