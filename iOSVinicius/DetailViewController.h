//
//  DetailViewController.h
//  iOSVinicius
//
//  Created by Vinicius Brito on 10/04/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Define.h"

@interface DetailViewController : UIViewController
{
    __weak IBOutlet UILabel *labelTitle;
    __weak IBOutlet UILabel *labelWebSite;
    __weak IBOutlet UILabel *labelAuthor;
    __weak IBOutlet UILabel *labelDate;
    __weak IBOutlet UIImageView *imageViewThumb;
}


@property (strong, nonatomic) News *news;
@property (weak, nonatomic) IBOutlet UITextView *textViewContent;

@end

