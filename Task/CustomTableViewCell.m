//
//  CustomTableViewCell.m
//  Task
//
//  Created by Ekaterina on 9/12/16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    if (selected) {
        
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        
        self.expandingLabel = [[UILabel alloc]initWithFrame:CGRectMake(70.0, 25.0, 250.0, 60.0)];
        self.expandingLabel.textAlignment = NSTextAlignmentLeft;
        self.expandingLabel.font = [UIFont systemFontOfSize:13];
        self.expandingLabel.textColor = [UIColor lightGrayColor];
        self.expandingLabel.numberOfLines = 0;
        self.expandingLabel.lineBreakMode = NSLineBreakByCharWrapping;
        
        self.thumbnailImageView = [[UIImageView alloc]init];
        self.thumbnailImageView.layer.cornerRadius = self.thumbnailImageView.bounds.size.width/2.0;
        self.thumbnailImageView.clipsToBounds = YES;
        self.separatorInset = UIEdgeInsetsMake(0, 60, 0, 0);
        
        [self.contentView.superview setClipsToBounds:YES];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.expandingLabel];
        [self.contentView addSubview:self.thumbnailImageView];
        
    }
    return self;

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    
    frame= CGRectMake(boundsX+10 ,8, 50, 50);
    self.thumbnailImageView.frame = frame;
    self.thumbnailImageView.layer.cornerRadius = self.thumbnailImageView.bounds.size.width/2.0;
    self.thumbnailImageView.clipsToBounds = YES;
    self.separatorInset = UIEdgeInsetsMake(0, 60, 0, 0);
    
    frame= CGRectMake(boundsX+70 ,0, 200, 25);
    self.titleLabel.frame = frame;
    
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
}


@end
