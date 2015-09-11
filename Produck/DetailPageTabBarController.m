//
//  DetailPageTabBarController.m
//  Produck
//
//  Created by Efe Helvaci on 21/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "DetailPageTabBarController.h"

@interface DetailPageTabBarController ()

-(void)dismissController;

@end

@implementation DetailPageTabBarController

static NSInteger activeVC = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.buttonDelegate = [self viewControllers][0];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"BackButton"] style:UIBarButtonItemStylePlain target:self action:@selector(dismissController)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(buttonClicked)];
    self.navigationItem.title = self.product.Name;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.0/255 green:102.0/255 blue:0.0/255 alpha:1.0f]];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        switch ([self selectedIndex]) {
            case 0:
                [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(buttonClicked)] animated:YES];
                self.buttonDelegate = [self viewControllers][0];
                break;
            case 1:
                self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"info"] style:UIBarButtonItemStylePlain target:self action:@selector(buttonClicked)];
                self.buttonDelegate = [self viewControllers][1];
                break;
            case 2:
                self.navigationItem.rightBarButtonItem = nil;
                break;
            case 3:
                self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Q+"] style:UIBarButtonItemStylePlain target:self action:@selector(buttonClicked)];
                break;
            default:
                break;
        }
    });
}

-(void)dismissController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)buttonClicked
{
    [self.buttonDelegate rightBarButtonItemClicked];
}

-(void)setButtonDelegate:(id<ActiveViewController>)buttonDelegate vc:(NSInteger)vc
{
    self.buttonDelegate = buttonDelegate;
    
    activeVC = vc;
    
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
