//
//  FrostedViewController.m
//  Produck
//
//  Created by Efe Helvaci on 21/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "FrostedViewController.h"

@interface FrostedViewController ()

@end

@implementation FrostedViewController

-(void)awakeFromNib
{
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BaseNavigationController"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SideMenuViewController"];
}

@end
