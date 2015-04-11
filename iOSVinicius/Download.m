//
//  Download.m
//  iOSVinicius
//
//  Created by Vinicius Brito on 01/04/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import "Download.h"
#import "Define.h"

@implementation Download

+(void)downloadWithUrl:(NSString*)url callback:(DownloadCallback)callback
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    [manager GET:kURLDefault parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         callback(YES,responseObject);
     }
     
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
         callback(NO, @"Algo inesperado aconteceu");
     }];
}

@end

