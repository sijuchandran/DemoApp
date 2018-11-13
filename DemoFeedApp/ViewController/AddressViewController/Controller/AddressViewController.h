//
//  AddressViewController.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Address+CoreDataClass.h"
#import "AddressView.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddressViewController : UIViewController

@property(nonatomic,strong) Address *addressInfo;
@property (strong, nonatomic) IBOutlet AddressView *addrView;

@end

NS_ASSUME_NONNULL_END
