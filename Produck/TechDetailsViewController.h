//
//  TechDetailsViewController.h
//  Produck
//
//  Created by Efe Helvaci on 09/09/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailPageTabBarController.h"

@interface TechDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ActiveViewController>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
