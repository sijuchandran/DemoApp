//
//  SplashViewControllerViewController.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 11/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "SplashViewController.h"
#import "SyncHelper.h"
#import "PostInfoViewController.h"


@interface SplashViewController()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self syncToServer];
    
    
    
    // Do any additional setup after loading the view.
}

/*!
 @brief sync all data to core data
 
 */

-(void) syncToServer {
    if ([ReachabilityManager isReachable])
    {
        [self syncData];
        
    } else {
        // No internet connection load save data from coredata
        [self showPostInfo];
    }
    
}


-(void) syncData {
    
    
    [SyncHelper syncLoggedInContent:^(bool success){
        if (success)
        {
            [self showPostInfo];
            
        } else {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                  UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"FAILED" message:@"SOMETHING WENT WRONG" preferredStyle:UIAlertControllerStyleAlert];
                 
                 UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
                         [self showPostInfo];
                 }];
                 
                 [alertController addAction:okAction];
                 
                 [self presentViewController:alertController animated:YES completion:nil]; 
          
                
            
                
                
            });
            
        }
        
    }];
}


-(void) showPostInfo {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        PostInfoViewController *settingController = [sb instantiateViewControllerWithIdentifier:@"postInfoViewController"];
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:settingController];
        [self presentViewController:navCtrl animated:YES completion:nil];
    });
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
