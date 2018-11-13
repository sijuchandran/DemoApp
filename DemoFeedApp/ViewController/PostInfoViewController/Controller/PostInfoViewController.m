//
//  PostInfoViewController.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "PostInfoViewController.h"
#import "AuthorDetailsViewController.h"
#import "AppDelegate.h"

@interface PostInfoViewController () 

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) AuthorDetailsInfo *authorInfoObject;
@property (strong, nonatomic) PostsInfo *postsInfoObject;

@end

@implementation PostInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"Posts"];
    NSError *error;
    if (![[self fetchedResultsController] performFetch:&error]) {
        // Update to handle the error appropriately.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    
    }
    _postInfoTableView.postInfoDelegate = self;
    [_postInfoTableView loadPostTableViewWith:self.fetchedResultsController];
}


#pragma mark - fetchedResultsController


// Get fetchedResultsController object
- (NSFetchedResultsController *) fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    
    NSManagedObjectContext *context = [CoreDataContext getManagedObjectContext];
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"PostsInfo" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"body" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:context sectionNameKeyPath:nil
                                                   cacheName:@"Root"];
    self.fetchedResultsController = theFetchedResultsController;

    
    return _fetchedResultsController;
    
}
/*!
 @brief Show authod details
 
 @param postInfo post info object
 
 */


-(void) showDetails:(PostsInfo *) postInfo {
    
    _postsInfoObject = postInfo;
    _authorInfoObject = [AuthorDetailsDataHelper getAuthorDetailsUsingUserId:postInfo.userId];
    if(_authorInfoObject != nil) {
        [self performSegueWithIdentifier:@"showDetails" sender:nil];
    }
    
  
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetails"]) {
        AuthorDetailsViewController *detailsViewController = (AuthorDetailsViewController *)[segue destinationViewController];
        detailsViewController.detailsInfo = _authorInfoObject;
        detailsViewController.postsInfo = _postsInfoObject;
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
