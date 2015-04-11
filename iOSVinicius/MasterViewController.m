//
//  MasterViewController.m
//  iOSVinicius
//
//  Created by Vinicius Brito on 10/04/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSMutableArray *arrayObjects;

@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [tableViewNews reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    //Download data Download.h
    //TODO internet check
    [Download downloadWithUrl:kURLDefault callback:^(BOOL success, id result)
     {
         if (success)
         {
             _arrayObjects = [[NSMutableArray alloc] init];
             for (NSDictionary *dict in result)
             {
                 news = [[News alloc] init];
                 news.authors = [dict objectForKey:@"authors"];
                 news.content = [dict objectForKey:@"content"];
                 news.date = [dict objectForKey:@"date"];
                 news.image = [dict objectForKey:@"image"];
                 news.title = [dict objectForKey:@"title"];
                 news.website = [dict objectForKey:@"website"];
                 news.read = NO;
                 [_arrayObjects addObject:news];
             }
             
             //Make the first sort to make the array match with the segmentedControl
             NSArray *sortedArray = [_arrayObjects sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
                 NSString *first = [(News*)a authors];
                 NSString *second = [(News*)b authors];
                 return [first compare:second];
             }];
             
             _arrayObjects = sortedArray.mutableCopy;
             [tableViewNews reloadData];
         }
         
         else
         {
             
         }
     }];
    
    //[MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        News *object = self.arrayObjects[indexPath.row];
        
        //check the read flag
        object.read = YES;
        
        [_arrayObjects replaceObjectAtIndex:indexPath.row withObject:object];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        controller.news = object;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayObjects.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    News *object = self.arrayObjects[indexPath.row];
    cell.labelTitle.text = object.title;
    cell.labelDate.text = object.date;
    cell.labelAuthor.text = object.authors;
    [cell.imageViewNews setImage:nil];
    [cell.labelRead setHidden:YES];
    
    if (object.read == YES)
        [cell.labelRead setHidden:NO];

    //to avoid crashs with image nil
    if (object.image != (id)[NSNull null])
    {
        NSURL *url = [NSURL URLWithString:object.image];
        [cell.imageViewNews setImageWithURL:url placeholderImage:nil];
    }

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (IBAction)actionSegControl:(id)sender
{
    NSArray *sortedArray;

    //Sort by authors
    if (segmentedControl.selectedSegmentIndex == 0)
    {
        sortedArray = [_arrayObjects sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
            NSString *first = [(News*)a authors];
            NSString *second = [(News*)b authors];
            return [first compare:second];
        }];
    }
    
    //Sort by date
    else if(segmentedControl.selectedSegmentIndex == 1)
    {
        sortedArray = [_arrayObjects sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
            NSString *first = [(News*)a date];
            NSString *second = [(News*)b date];
            return [first compare:second];
        }];
    }
    
    //Sort by title
    else
    {
        sortedArray = [_arrayObjects sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
            NSString *first = [(News*)a title];
            NSString *second = [(News*)b title];
            return [first compare:second];
        }];
    }
    
    _arrayObjects = sortedArray.mutableCopy;
    [tableViewNews reloadData];
}

@end
