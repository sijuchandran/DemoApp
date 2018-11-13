//
//  ConnectionHelper.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionObject.h"
#import "ConnectionDetailHelper.h"
#import "SessionConfig.h"


/** Helper class for connections to the API */
@interface ConnectionHelper : NSObject <NSURLSessionDelegate>
{
    NSMutableDictionary *returnJSON;
    NSURLSessionDataTask *dataTask;
    NSString *serviceName;
    SessionConfig *curSessionConfig;
}
/** @name Properties */

/** returnJSON - NSMutableDictionary for the JSON that has been returned */
@property(nonatomic,strong) NSMutableDictionary *returnJSON;


/** returnJSON - NSMutableDictionary for the Data that has been returned */
@property(nonatomic,strong) NSMutableData *returnData;



/** returnJSONArray - NSMutableArray for the array of JSON that has been returned */
@property(nonatomic,strong)NSMutableArray *returnJSONArray;

/** dataTask - NSURLSessionDataTask */
@property(nonatomic,strong)NSURLSessionDataTask *dataTask;

/** serviceName - NSString for the name of the service called */
@property(nonatomic,strong)NSString *serviceName;

/** curSessionConfig - SessionConfig session configuration */
@property(nonatomic, strong)SessionConfig *curSessionConfig;


/** @name Functions */

/**
 * Function to initialise the helper
 *
 * @return id - the ConnectionHelper instance
 */
-(id)init;



/**
 * Function to call a service
 *
 * @param conObject - ConnectionObject for the connection details
 * @param postData - NSData for the data to be posted
 * @param completionBlock - bool returning YES if call was successful, NO if not
 */
-(void)callGeneralService:(ConnectionObject*)conObject postData:(NSData*)postData completionHandler:(void (^)(bool))completionBlock;

/**
 * Function to call the specified web service
 *
 * @param request - NSMutableURLRequest for the request
 * @param completionBlock - return block that returns YES if successful and NO if not
 */
-(void)callService:(NSMutableURLRequest*)request completionHandler:(void (^)(bool))completionBlock;


/**
 * Function to get the response data
 *
 * @return NSMutableDictionary - dictionary of data returned JSON
 */
-(NSMutableDictionary*)getResponseData;

/**
 * Function to get the response data
 *
 * @return NSMutableData - dictionary of data returned NSData
 */

-(NSMutableData*) getResponseNSData;

/**
 * Function to get the response data in an array
 *
 * @return NSMutableArray - array containing JSON data
 */
-(NSMutableArray*)getResponseDataArray;


@end
