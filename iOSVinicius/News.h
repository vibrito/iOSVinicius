//
//  News.h
//  iOSVinicius
//
//  Created by Vinicius Brito on 10/04/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic) NSString *authors;
@property (nonatomic) NSString *content;
@property (nonatomic) NSString *date;
@property (nonatomic) NSString *image;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *website;
@property (nonatomic) BOOL read;

@end
