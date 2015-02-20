//
//  SBTVServices.m
//  CDF
//
//  Created by Franklin Cruz on 9/4/14.
//  Copyright (c) 2014 Smartbox TV. All rights reserved.
//

#import "SBTVServices.h"
#import "DDXML.h"
#import "JSONServiceParser.h"

#import <CommonCrypto/CommonDigest.h>

#define MAX_ATTEMPTS 4
#import "AFHTTPRequestOperationManager.h"
@implementation SBTVServices {
    
    

}




+ (void)getWsUrl:(NSString *)pathWS sucess:(void (^) (id responseObject)) completion failure:(void (^) (NSError *error))failure{

    [SBTVServices getWsUrl:pathWS sucess:completion failure:failure withTryCount:0];
}


+ (void)getWsUrl:(NSString *)pathWS sucess:(void (^) (id responseObject)) completion failure:(void (^) (NSError *error))failure withTryCount:(NSInteger)tries{
    NSString *url = [SBTVServices getWS:pathWS];

    __block NSInteger attempts = tries;

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:url parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {

             completion(responseObject);

             NSString *hashStr = [self convertIntoMD5:[operation.request.URL description]];
             NSArray *paths = NSSearchPathForDirectoriesInDomains
             (NSDocumentDirectory, NSUserDomainMask, YES);
             NSString *documentsDirectory = [paths objectAtIndex:0];




             if([pathWS isEqualToString:@"login"]){

                 NSString *fileName = [NSString stringWithFormat:@"%@/%@.json",
                                       documentsDirectory,pathWS];
                 NSError *jsonError = nil;

                 NSData *TheData = [NSJSONSerialization dataWithJSONObject:responseObject
                                                                   options:0
                                                                     error:&jsonError];



                 if (!jsonError)
                 {


                     [[NSFileManager defaultManager] createFileAtPath:fileName
                                                             contents:TheData
                                                           attributes:nil];

                     if (![[NSFileManager defaultManager] createFileAtPath:fileName
                                                                  contents:TheData
                                                                attributes:nil])
                     {
                         NSLog(@"Error was code: %d - message: %s", errno, strerror(errno));
                     }
                 }
                 else {
                     [[NSFileManager defaultManager] createFileAtPath:fileName
                                                             contents:TheData
                                                           attributes:nil];
                 }

             }else{

                 NSString *fileName = [NSString stringWithFormat:@"%@/%@.json",
                                       documentsDirectory,hashStr];
                 NSError *jsonError = nil;

                 NSData *TheData = [NSJSONSerialization dataWithJSONObject:responseObject
                                                                   options:0
                                                                     error:&jsonError];
                 if (!jsonError)
                 {


                     [[NSFileManager defaultManager] createFileAtPath:fileName
                                                             contents:TheData
                                                           attributes:nil];

                     if (![[NSFileManager defaultManager] createFileAtPath:fileName
                                                                  contents:TheData
                                                                attributes:nil])
                     {
                         NSLog(@"Error was code: %d - message: %s", errno, strerror(errno));
                     }
                 }
                 else {
                     [[NSFileManager defaultManager] createFileAtPath:fileName
                                                             contents:TheData
                                                           attributes:nil];
                 }



             }




         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             attempts++;


             if([pathWS isEqualToString:@"login"]){

                 if (attempts == MAX_ATTEMPTS) {
                     // NSString *hashStr = [self convertIntoMD5:[operation.request.URL description]];

                     NSArray *paths = NSSearchPathForDirectoriesInDomains
                     (NSDocumentDirectory, NSUserDomainMask, YES);
                     NSString *documentsDirectory = [paths objectAtIndex:0];

                     //make a file name to write the data to using the documents directory:
                     NSString *fileName = [NSString stringWithFormat:@"%@/%@.json",
                                           documentsDirectory,pathWS];

                     NSError *errorr =nil;

                     NSString *jsonFilePath =fileName;

                     NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath options:kNilOptions error:&errorr];

                     if (!errorr) {
                         id responseObject =[NSJSONSerialization JSONObjectWithData:jsonData
                                                                            options: NSJSONReadingMutableContainers
                                                                              error: &errorr];

                         if (!errorr) {
                             completion(responseObject);
                         }
                         else {
                             failure(error);
                         }

                     }
                     else {
                         failure(error);
                     }

                     failure(error);
                 }
                 else {
                     NSLog(@"Here we go again!!");
                     [SBTVServices getWsUrl:pathWS sucess:completion failure:failure withTryCount:attempts];
                 }
             }else{

                 if (attempts == MAX_ATTEMPTS) {
                     NSString *hashStr = [self convertIntoMD5:[operation.request.URL description]];

                     NSArray *paths = NSSearchPathForDirectoriesInDomains
                     (NSDocumentDirectory, NSUserDomainMask, YES);
                     NSString *documentsDirectory = [paths objectAtIndex:0];

                     //make a file name to write the data to using the documents directory:
                     NSString *fileName = [NSString stringWithFormat:@"%@/%@.json",
                                           documentsDirectory,hashStr];

                     NSError *errorr =nil;

                     NSString *jsonFilePath =fileName;

                     NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath options:kNilOptions error:&errorr];

                     if (!errorr) {
                         id responseObject =[NSJSONSerialization JSONObjectWithData:jsonData
                                                                            options: NSJSONReadingMutableContainers
                                                                              error: &errorr];
                         
                         if (!errorr) {
                             completion(responseObject);
                         }
                         else {
                             failure(error);
                         }
                         
                     }
                     else {
                         failure(error);
                     }
                     
                     failure(error);
                 }
                 else {
                     NSLog(@"Here we go again!!");
                     [SBTVServices getWsUrl:pathWS sucess:completion failure:failure withTryCount:attempts];
                 }
                 
                 
                 
             }
         }];
    
}


+ (NSString *)getWS:(NSString *)name
{

    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:@"RutasWebservices.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"RutasWebservices" ofType:@"plist"];
    }
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:plistXML
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                          format:&format
                                          errorDescription:&errorDesc];
    if (!temp) {

    }
    NSLog(@" %@ - %@", [temp objectForKey:@"urlBase"], [temp objectForKey:name]);

    return [NSString stringWithFormat:@"%@%@", [temp objectForKey:@"url_base"], [temp objectForKey:name]];
    
    
}



+ (NSString *)convertIntoMD5:(NSString *) string{
    const char *cStr = [string UTF8String];
    unsigned char digest[16];

    CC_MD5( cStr, (int)strlen(cStr), digest ); // This is the md5 call

    NSMutableString *resultString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];

    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [resultString appendFormat:@"%02x", digest[i]];
    return  resultString;
}


+ (void)getWsUrl:(NSString *)pathWS params:(NSString *)p sucess:(void (^) (id responseObject)) completion failure:(void (^) (NSError *error))failure {

    [SBTVServices getWsUrl:pathWS params:p sucess:completion failure:failure withTryCount:0];

}
+ (void)getWsUrl:(NSString *)pathWS params:(NSString *)p sucess:(void (^) (id responseObject)) completion failure:(void (^) (NSError *error))failure withTryCount:(NSInteger)tries{

    __block NSInteger attempts = tries;
    NSString *url = [NSString stringWithFormat:@"%@%@", [SBTVServices getWS:pathWS], p];
    NSLog(@"%@",url);





    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:url parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {

             completion(responseObject);

             NSString *hashStr = [self convertIntoMD5:[operation.request.URL description]];
             NSArray *paths = NSSearchPathForDirectoriesInDomains
             (NSDocumentDirectory, NSUserDomainMask, YES);
             NSString *documentsDirectory = [paths objectAtIndex:0];




             if([pathWS isEqualToString:@"login"]){

                 NSString *fileName = [NSString stringWithFormat:@"%@/%@.json",
                                       documentsDirectory,pathWS];
                 NSError *jsonError = nil;

                 NSData *TheData = [NSJSONSerialization dataWithJSONObject:responseObject
                                                                   options:0
                                                                     error:&jsonError];

                 if (!jsonError)
                 {


                     [[NSFileManager defaultManager] createFileAtPath:fileName
                                                             contents:TheData
                                                           attributes:nil];

                     if (![[NSFileManager defaultManager] createFileAtPath:fileName
                                                                  contents:TheData
                                                                attributes:nil])
                     {
                         NSLog(@"Error was code: %d - message: %s", errno, strerror(errno));
                     }
                 }
                 else {
                     [[NSFileManager defaultManager] createFileAtPath:fileName
                                                             contents:TheData
                                                           attributes:nil];
                 }

             }else{

                 NSString *fileName = [NSString stringWithFormat:@"%@/%@.json",
                                       documentsDirectory,hashStr];
                 NSError *jsonError = nil;

                 NSData *TheData = [NSJSONSerialization dataWithJSONObject:responseObject
                                                                   options:0
                                                                     error:&jsonError];
                 if (!jsonError)
                 {


                     [[NSFileManager defaultManager] createFileAtPath:fileName
                                                             contents:TheData
                                                           attributes:nil];

                     if (![[NSFileManager defaultManager] createFileAtPath:fileName
                                                                  contents:TheData
                                                                attributes:nil])
                     {
                         NSLog(@"Error was code: %d - message: %s", errno, strerror(errno));
                     }
                 }
                 else {
                     [[NSFileManager defaultManager] createFileAtPath:fileName
                                                             contents:TheData
                                                           attributes:nil];
                 }



             }




         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             attempts++;


             if([pathWS isEqualToString:@"login"]){

                 if (attempts == MAX_ATTEMPTS) {
                     // NSString *hashStr = [self convertIntoMD5:[operation.request.URL description]];

                     NSArray *paths = NSSearchPathForDirectoriesInDomains
                     (NSDocumentDirectory, NSUserDomainMask, YES);
                     NSString *documentsDirectory = [paths objectAtIndex:0];

                     //make a file name to write the data to using the documents directory:
                     NSString *fileName = [NSString stringWithFormat:@"%@/%@.json",
                                           documentsDirectory,pathWS];

                     NSError *errorr =nil;

                     NSString *jsonFilePath =fileName;

                     NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath options:kNilOptions error:&errorr];

                     if (!errorr) {
                         id responseObject =[NSJSONSerialization JSONObjectWithData:jsonData
                                                                            options: NSJSONReadingMutableContainers
                                                                              error: &errorr];

                         if (!errorr) {
                             completion(responseObject);
                         }
                         else {
                             failure(error);
                         }

                     }
                     else {
                         failure(error);
                     }

                     failure(error);
                 }
                 else {
                     NSLog(@"Here we go again!!");
                     [SBTVServices getWsUrl:pathWS sucess:completion failure:failure withTryCount:attempts];
                 }
             }else{

                 if (attempts == MAX_ATTEMPTS) {
                     NSString *hashStr = [self convertIntoMD5:[operation.request.URL description]];

                     NSArray *paths = NSSearchPathForDirectoriesInDomains
                     (NSDocumentDirectory, NSUserDomainMask, YES);
                     NSString *documentsDirectory = [paths objectAtIndex:0];

                     //make a file name to write the data to using the documents directory:
                     NSString *fileName = [NSString stringWithFormat:@"%@/%@.json",
                                           documentsDirectory,hashStr];

                     NSError *errorr =nil;

                     NSString *jsonFilePath =fileName;

                     NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath options:kNilOptions error:&errorr];

                     if (!errorr) {
                         id responseObject =[NSJSONSerialization JSONObjectWithData:jsonData
                                                                            options: NSJSONReadingMutableContainers
                                                                              error: &errorr];
                         
                         if (!errorr) {
                             completion(responseObject);
                         }
                         else {
                             failure(error);
                         }
                         
                     }
                     else {
                         failure(error);
                     }
                     
                     failure(error);
                 }
                 else {
                     NSLog(@"Here we go again!!");
                     [SBTVServices getWsUrl:pathWS sucess:completion failure:failure withTryCount:attempts];
                 }
                 
                 
                 
             }
         }];
}




+(void)getUserCountry:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler {
//
//    NSURL *url = [NSURL URLWithString:@"http://54.207.109.226/geo/api/1.0/common/country"];
//
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//
//    NSDate *lastCheck = [defaults objectForKey:@"last_country_check"];
//
//    if (lastCheck != nil) {
//        //Check only once a day
//        if ([[NSDate date] timeIntervalSinceDate:lastCheck] < 6 * 60 * 60 && NO) {
//            handler([defaults stringForKey:@"user_country_code"]);
//        }
//        else {
//            [defaults setObject:[NSDate date] forKey:@"last_country_check"];
//            [defaults synchronize];
//            [[[JSONServiceParser alloc] initWithTimeout:20] getJSONFromUrl:url withHandler:^(id data) {
//
//                NSString *countryCode = [data objectForKey:@"data"];
//                [defaults setObject:countryCode forKey:@"user_country_code"];
//                [defaults synchronize];
//
//                handler(countryCode);
//
//            } orErrorHandler:^(NSError *err) {
//                handler([defaults stringForKey:@"user_country_code"]);
//            }];
//        }
//    }
//    else {
//        [defaults setObject:[NSDate date] forKey:@"last_country_check"];
//        [defaults synchronize];
//        [[[JSONServiceParser alloc] initWithTimeout:20] getJSONFromUrl:url withHandler:^(id data) {
//
//            NSString *countryCode = [data objectForKey:@"data"];
//            [defaults setObject:countryCode forKey:@"user_country_code"];
//            [defaults synchronize];
//            NSLog(@"Country CODE: %@", countryCode);
//            handler(countryCode);
//
//        } orErrorHandler:^(NSError *err) {
//            handler([defaults stringForKey:@"user_country_code"]);
//        }];
//    }

    
    
}




@end
