//
//  DetailPagePerformanceViewController.m
//  Produck
//
//  Created by Efe Helvaci on 21/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "DetailPagePerformanceViewController.h"
#import "DetailPageTabBarController.h"

@interface DetailPagePerformanceViewController ()

@property (strong, nonatomic) Product *product;

@end

@implementation DetailPagePerformanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DetailPageTabBarController *tabBarController = (DetailPageTabBarController *) self.tabBarController;
    self.product = tabBarController.product;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
