//
//  DetailViewController.h
//  Task
//
//  Created by Ekaterina on 9/12/16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *abstractLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (strong, nonatomic) NSURL *articleURL;
@end
