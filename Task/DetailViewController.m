//
//  DetailViewController.m
//  Task
//
//  Created by Ekaterina on 9/12/16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterTableViewController.h"

@interface DetailViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) UIButton *button;

@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpBitton];
    [self createConstraintsForImageView];
    [self createConstraintsForLabel];
    [self createConstraintsForButton];
}

- (UIImageView *)imageView {
    
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, 150.0, 150.0)];
        _imageView.backgroundColor = [UIColor redColor];
        _imageView.contentMode = UIViewContentModeScaleToFill;
        _imageView.layer.cornerRadius = _imageView.bounds.size.width/2.0;
        _imageView.clipsToBounds = YES;
        [self.view addSubview: _imageView];
    }
    return _imageView;
}

- (UILabel *)abstractLabel {
    if (!_abstractLabel) {
        _abstractLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 300.0 , 80.0)];
        _abstractLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _abstractLabel.numberOfLines = 0;
        _abstractLabel.textAlignment = NSTextAlignmentCenter;
        _abstractLabel.font = [UIFont systemFontOfSize:13];
        [self.view addSubview:_abstractLabel];
    }
    return _abstractLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpBitton {
    
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(100, 500, 130, 60)];
    [self.button setBackgroundColor:[UIColor lightGrayColor]];
    [self.button setTitle:@"Go to article" forState:UIControlStateNormal];
    self.button.layer.borderWidth = 1.0f;
    self.button.layer.borderColor = [UIColor blackColor].CGColor;
    self.button.layer.cornerRadius = 4.0f;
    [self.button.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.button addTarget:self action:@selector(goToPage:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)goToPage:(id)sender {
    
    [[UIApplication sharedApplication]openURL:self.articleURL];
}

#pragma mark - Create constraints
- (void)createConstraintsForImageView {
    
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    self.imageView.layer.cornerRadius = self.imageView.bounds.size.width/2.0;
    self.imageView.layer.borderWidth = 1.0;
    self.imageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.imageView.clipsToBounds = YES;

    [self.view addSubview:self.imageView];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:143];
    
    [self.view addConstraint:centerXConstraint];
    [self.view addConstraint:centerYConstraint];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150];

    [self.view addConstraint:widthConstraint];
    [self.view addConstraint:heightConstraint];
}

- (void)createConstraintsForLabel {
    
    self.abstractLabel.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:self.abstractLabel];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self.abstractLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.imageView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self.abstractLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.imageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:40];
    
    [self.view addConstraint:centerXConstraint];
    [self.view addConstraint:centerYConstraint];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.abstractLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:310];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.abstractLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:70];
    
    [self.view addConstraint:widthConstraint];
    [self.view addConstraint:heightConstraint];
}

- (void)createConstraintsForButton {
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.button];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.abstractLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:80];
    
    [self.view addConstraint:centerXConstraint];
    [self.view addConstraint:centerYConstraint];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:110];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:25];
    
    [self.view addConstraint:widthConstraint];
    [self.view addConstraint:heightConstraint];

}

@end
