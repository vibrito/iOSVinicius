//
//  NewsTableViewCell.h
//  iOSVinicius
//
//  Created by Vinicius Brito on 10/04/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imageViewNews;
@property (nonatomic, weak) IBOutlet UILabel *labelAuthor;
@property (nonatomic, weak) IBOutlet UILabel *labelTitle;
@property (nonatomic, weak) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelRead;

@end
