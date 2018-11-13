//
//  AddressView.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "AddressView.h"

@implementation AddressView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*!
@brief Function to configure the adrress view

@param  address The address object

*/

-(void) buildViewWithAddressInfo:(Address *) address {
    [_streetLabel setText:address.street];
    [_suiteLabel setText:address.suite];
    [_cityLabel setText:address.city];
    [_zipcodeLabel setText:address.zipcode];
    

    _locationMapView.mapType = MKMapTypeStandard;
    _locationMapView.showsUserLocation = YES;
    
    
    // place pin in map view
    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc] init];
    myAnnotation.coordinate = CLLocationCoordinate2DMake(-31.8129, 62.5342);
    myAnnotation.title = address.suite;
    myAnnotation.subtitle = [NSString stringWithFormat:@"%@,%@,%@",address.street, address.city,address.zipcode];
    [_locationMapView addAnnotation:myAnnotation];
    

    MKCoordinateRegion adjustedRegion = [_locationMapView regionThatFits:MKCoordinateRegionMakeWithDistance(myAnnotation.coordinate, 200, 200)];
    [_locationMapView setRegion:adjustedRegion animated:YES];

    
    

    
}

@end
