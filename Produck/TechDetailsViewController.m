//
//  TechDetailsViewController.m
//  Produck
//
//  Created by Efe Helvaci on 09/09/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "TechDetailsViewController.h"
#import "TechDetailsTableViewCell.h"
#import "DetailPageTabBarController.h"
#import "Product.h"

@interface TechDetailsViewController ()

@property (strong, nonatomic) Product *product;

@end

@implementation TechDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DetailPageTabBarController *tabBarController = (DetailPageTabBarController *) self.tabBarController;
    self.product = tabBarController.product;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.questions.count;
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TechDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"techDetailCell" forIndexPath:indexPath];
    
    cell.detailName.text = @"İşlemci";
    cell.detail.text = @"Intel A5780 Super bir islemci knk";
    
    return cell;
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
