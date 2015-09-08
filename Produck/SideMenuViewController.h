//
//  SideMenuViewController.h
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
