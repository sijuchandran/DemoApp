//
//  AuthorDetailsViewController.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "AuthorDetailsViewController.h"

#import "Address+CoreDataClass.h"

@interface AuthorDetailsViewController ()

@end

@implementation AuthorDetailsViewController
@synthesize detailsInfo;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Author Details"];
    [_authorDetailView buildViewWithAuthorDetail:detailsInfo andPostInfo:_postsInfo];
    // Do any additional setup after loading the view.
}

/*!
 @brief Show address details
 
 */

- (IBAction)showAddress:(id)sender {
    
    [self performSegueWithIdentifier:@"showAddress" sender:nil];
    
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showAddress"]) {
        
        Address *addrInfo = detailsInfo.address;
        AddressViewController *addrViewController = (AddressViewController *)[segue destinationViewController];
        addrViewController.addressInfo = addrInfo;
        
        

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
