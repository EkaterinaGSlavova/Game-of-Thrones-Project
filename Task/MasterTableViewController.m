 //
//  MasterTableViewController.m
//  Task
//
//  Created by Ekaterina on 9/13/16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import "MasterTableViewController.h"
#import "CustomTableViewCell.h"
#import "DetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MasterTableViewController () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (strong, nonatomic) UILongPressGestureRecognizer *longPressRecognizer;
@property (strong, nonatomic) NSMutableArray *titles;
@property (strong, nonatomic) NSMutableArray *abstracts;
@property (strong, nonatomic) NSMutableArray *thumbnails;
@property (strong, nonatomic) NSMutableArray *urls;
@end

@implementation MasterTableViewController {
    
    long selectedIndex;
}

- (NSMutableArray *)titles {
    
    if (!_titles) {
        _titles = [[NSMutableArray alloc]init];
    }
    return _titles;
}

- (NSMutableArray *)abstracts {
    
    if (!_abstracts) {
        _abstracts = [[NSMutableArray alloc]init];
    }
    return _abstracts;
}

- (NSMutableArray *)thumbnails {
   
    if (!_thumbnails) {
        _thumbnails = [[NSMutableArray alloc]init];
    }
    return _thumbnails;
}

- (NSMutableArray *)urls {
    
    if (!_urls) {
        _urls = [[NSMutableArray alloc]init];
    }
    return _urls;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    selectedIndex = -1;
    [self httpGetRequest];
   
    self.longPressRecognizer.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 60;
    
    self.longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.tableView addGestureRecognizer:self.longPressRecognizer];
}

- (void)httpGetRequest {
    
    NSString *urlString = @"http://gameofthrones.wikia.com/api/v1/Articles/Top?expand=1&category=Characters&limit=75";
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        if (!connectionError) {
             [self getData:data];
        }
    }];
}

- (void)getData:(NSData *)data {
 
    NSError *error = nil;
    NSDictionary *receivedData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSArray *items = [[NSArray alloc]initWithArray:[receivedData objectForKey:@"items"]];
    
    for (int i = 1; i < items.count; i++) {
        NSDictionary *itemResults = [items objectAtIndex:i];
        NSString *title = [itemResults objectForKey:@"title"];
        [self.titles addObject:title];
        NSString *thumbnail = [itemResults objectForKey:@"thumbnail"];
        [self.thumbnails addObject:thumbnail];
        NSString *abstract = [itemResults objectForKey:@"abstract"];
        [self.abstracts addObject:abstract];
        NSString *url = [itemResults objectForKey:@"url"];
        [self.urls addObject:url];
        [self.tableView reloadData];
    }
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titles.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (selectedIndex == indexPath.row) {
        tableView.rowHeight = UITableViewAutomaticDimension;
        return 80 ;
    } else {
        return 60;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.titleLabel.text = [self.titles objectAtIndex:indexPath.row];
    cell.expandingLabel.text = [self.abstracts objectAtIndex:indexPath.row];
    [cell.expandingLabel sizeToFit];
    
    [cell.thumbnailImageView sd_setImageWithURL:[NSURL URLWithString:self.thumbnails[indexPath.row]]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailViewController *detailController = [[DetailViewController alloc] init];
    NSString *title = [self.titles objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    [detailController.navigationItem setTitle:title];
    NSString *abstract = [self.abstracts objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.thumbnails[indexPath.row]]];
    UIImage *image = [UIImage imageWithData:data];
    detailController.imageView.image = image;

    [detailController.abstractLabel setText:abstract];
    
    
    NSString *mainURL = @"http://gameofthrones.wikia.com";
    NSString *correctSufix = [self.urls objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    NSString *fullURL = [mainURL stringByAppendingString:correctSufix];
    NSURL *theURL = [NSURL URLWithString:fullURL];
    detailController.articleURL = theURL;
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromTop;
    
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:detailController animated:NO];
}

-(void)longPress:(UILongPressGestureRecognizer*)longPress {
    
    self.longPressRecognizer.minimumPressDuration = 0.2;
    if (self.longPressRecognizer.state == UIGestureRecognizerStateBegan) {
        
        CGPoint p = [self.longPressRecognizer locationInView:self.tableView];
        
        NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];

        if (selectedIndex == indexPath.row) {
            selectedIndex = -1;
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            return;
        }
        
        if (selectedIndex != -1) {
            NSIndexPath *previousPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
            selectedIndex = indexPath.row;
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:previousPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        
        selectedIndex = indexPath.row;
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
