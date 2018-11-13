//
//  ConnectionHelper.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "ConnectionHelper.h"
#import "ConnectionDetailHelper.h"
#import "HelpersConstants.h"

@implementation ConnectionHelper
@synthesize returnJSON;
//@synthesize authHelp;

@synthesize returnJSONArray;
@synthesize dataTask;
@synthesize serviceName;
@synthesize curSessionConfig;

@synthesize returnData;

kResponseType responseType;

#pragma mark - initialisation functions
-(id)init
{
    self = [super init];
    
    returnJSON = [[NSMutableDictionary alloc] init];
    returnJSONArray = [[NSMutableArray alloc] init];
    returnData =  [[NSMutableData alloc] init];
    return self;
}


#pragma mark - general call function
-(void)callGeneralService:(ConnectionObject*)conObject postData:(NSData*)postData completionHandler:(void (^)(bool))completionBlock
{
    serviceName = conObject.serviceName;
    if ([conObject.httpMethod intValue] == 1)
    {
        [self getAuthGetRequest:conObject.urlString completionHandler:^(NSMutableURLRequest *request){
            [self callService:request completionHandler:^(bool success){
                
                completionBlock(success);
            }];
        }];
    }
    
}



#pragma mark - web service call function
-(void)callService:(NSMutableURLRequest*)request completionHandler:(void (^)(bool))completionBlock
{
    curSessionConfig = [ConnectionDetailHelper getSessionConfig];
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguration.timeoutIntervalForRequest = [curSessionConfig.requestTimeout floatValue];
    sessionConfiguration.timeoutIntervalForResource = [curSessionConfig.resourceTimeout floatValue];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:Nil];
    
    dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
        
        NSLog(@"httpResponse: %@", httpResponse);
        
        int responseStatusCode = (int)[httpResponse statusCode];
        
         __block BOOL returnCode = NO;
        
        NSLog(@"responseStatusCode: %i", responseStatusCode);
        
        if (responseStatusCode >= 200 && responseStatusCode <= 299)
        {

            self->returnJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self->returnJSONArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            responseType = kResponseOk;
            
            returnCode = YES;
        }
        else if (responseStatusCode == 400)
        {
            responseType = kResponseError;
            self->returnJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"returnJSON: %@", self->returnJSON);
        }

        else
        {
            responseType = kResponseError;
        }
        
        completionBlock(returnCode);
        
    }];
    
    [dataTask resume];
}

-(void)getAuthGetRequest:(NSString*)urlString completionHandler:(void (^)(NSMutableURLRequest*))completionBlock
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:urlString]];
    completionBlock(request);
    
}


#pragma mark - response function
-(NSMutableDictionary*)getResponseData
{
    return returnJSON;
}

#pragma mark - response function
-(NSData *)getResponseNSData
{
    return returnData;
}

-(NSMutableArray*)getResponseDataArray
{
    return returnJSONArray;
}

-(kResponseType)getResponseType
{
    return responseType;
}

@end
