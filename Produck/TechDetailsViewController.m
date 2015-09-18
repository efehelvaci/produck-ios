//
//  TechDetailsViewController.m
//  Produck
//
//  Created by Efe Helvaci on 09/09/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "TechDetailsViewController.h"
#import "TechDetailsTableViewCell.h"
#import "TechDetailExtraTableViewCell.h"
#import "Product.h"
#import "DataManager.h"

@interface TechDetailsViewController ()

@property (strong, nonatomic) Product *product;
@property (strong, nonatomic) DetailPageTabBarController *tabBarController;

@end

@implementation TechDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBarController = [DetailPageTabBarController new];
    self.tabBarController = (DetailPageTabBarController *) self.tabBarController;
    self.product = self.tabBarController.product;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[[[DataManager sharedManager] laptopFeatures] objectAtIndex:section] objectAtIndex:0];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    return view;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tabBarController setButtonDelegate:self vc:1];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[[DataManager sharedManager] laptopFeatures] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[[DataManager sharedManager] laptopFeatures] objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if([[[[DataManager sharedManager] laptopFeatures] objectAtIndex:indexPath.section] count]-1 != indexPath.row){
        TechDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"techDetailCell" forIndexPath:indexPath];
        
        cell.detailName.text = [[[[DataManager sharedManager] laptopFeatures] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row+1];
        cell.detailImage.image = [UIImage imageNamed:[[[[DataManager sharedManager] laptopFeaturesIcons] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
        cell.detail.text = @"";
        
        return cell;
    }
    else
    {
        TechDetailExtraTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"techExtraDetailCell" forIndexPath:indexPath];
        cell.extrasLabel.text = @"Automatic Compression Technology 2.0";
        
        return cell;
    }
}

-(void)rightBarButtonItemClicked
{
    
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
