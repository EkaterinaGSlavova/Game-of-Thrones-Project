//
//  MasterTableViewController.h
//  Task
//
//  Created by Ekaterina on 9/13/16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterTableViewController : UITableViewController

- (void)httpGetRequest;
- (void)getData:(NSData *)data;
@end
