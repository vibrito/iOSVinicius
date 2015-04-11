//
//  MasterViewController.h
//  iOSVinicius
//
//  Created by Vinicius Brito on 10/04/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Define.h"
#import "Download.h"
#import "NewsTableViewCell.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController
{
    News *news;
    IBOutlet UITableView *tableViewNews;
    __weak IBOutlet UISegmentedControl *segmentedControl;
}

@property (strong, nonatomic) DetailViewController *detailViewController;

- (IBAction)actionSegControl:(id)sender;

@end

