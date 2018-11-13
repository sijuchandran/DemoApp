//
//  AddressView.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Address+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddressView : UIView
@property (weak, nonatomic) IBOutlet UILabel *streetLabel;
@property (weak, nonatomic) IBOutlet UILabel *suiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *zipcodeLabel;

@property (weak, nonatomic) IBOutlet MKMapView *locationMapView;

-(void) buildViewWithAddressInfo:(Address *) address;

@end

NS_ASSUME_NONNULL_END
