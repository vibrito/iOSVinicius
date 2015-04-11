//
//  Download.h
//  iOSVinicius
//
//  Created by Vinicius Brito on 01/04/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Download : NSObject

typedef void(^DownloadCallback)(BOOL success, id result);

+(void)downloadWithUrl:(NSString*)url callback:(DownloadCallback)callback;

@end
