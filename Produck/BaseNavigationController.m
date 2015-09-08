//
//  BaseNavigationController.m
//  Produck
//
//  Created by Efe Helvaci on 03/09/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "BaseNavigationController.h"
#import "CategoryPageViewController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue destinationViewController] isKindOfClass:[CategoryPageViewController class]])
    {
        CategoryPageViewController *vc = (CategoryPageViewController *)[segue destinationViewController];
        vc.productCategoryName = sender;
    }
    
}

@end
