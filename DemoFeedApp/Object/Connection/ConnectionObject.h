//
//  ConnectionObject.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 11/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Object to contain connection details */
@interface ConnectionObject : NSObject

/** urlString - NSString for the URL */
@property(nonatomic, strong)NSString *urlString;

/**
 * httpMethod - NSNumber INT for the HTTP method
 *
 * @warning 0 = POST, 1 = GET, 2 = DELETE, 3 = PUT
 */
@property(nonatomic, strong)NSNumber *httpMethod;

/** serviceName - NSString for the service name */
@property(nonatomic,strong)NSString *serviceName;


@end
