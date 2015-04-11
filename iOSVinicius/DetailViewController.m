//
//  DetailViewController.m
//  iOSVinicius
//
//  Created by Vinicius Brito on 10/04/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.news)
    {
        self.textViewContent.text = [self.news content];
        labelTitle.text = [self.news title];
        labelAuthor.text = [self.news authors];
        labelWebSite.text = [self.news website];
        labelDate.text = [self.news date];
        if (self.news.image != (id)[NSNull null])
        {
            NSURL *url = [NSURL URLWithString:self.news.image];
            [imageViewThumb setImageWithURL:url placeholderImage:nil];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
