//
//  MainPageViewController.m
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <pop/POP.h>
#import "MainPageViewController.h"
#import "CategoryPageViewController.h"
#import "MainPageCategoriesCell.h"
#import "NetworkManager.h"
#import "UIImageView+AFNetworking.h"
#import "REFrostedViewController.h"
#import "DetailPageTabBarController.h"

@interface MainPageViewController ()

@property (assign, nonatomic) CGSize iOSDeviceScreenSize;
@property (strong, nonatomic) UIAlertView *noInternetErrorAlert;
@property (strong, nonatomic) UIActivityIndicatorView *spinner1;
@property (strong, nonatomic) UIActivityIndicatorView *spinner2;
@property (strong, nonatomic) UIActivityIndicatorView *spinner3;
@property (strong, nonatomic) NSMutableArray *collectionView1Data;
@property (strong, nonatomic) NSMutableArray *collectionView2Data;
@property (strong, nonatomic) NSMutableArray *collectionView3Data;
@property (strong, nonatomic) POPSpringAnimation *anim;

-(void)downloadTopTenCategoriesContent;

@end

@implementation MainPageViewController

static NSString * const reuseIdentifier = @"MainPageCategoriesCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NetworkManager startNetworkReachabilityMonitoring];
    
    self.iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    
//    [self setupSpinner:self.spinner1 toView:self.collectionView1];
//    [self setupSpinner:self.spinner2 toView:self.collectionView2];
//    [self setupSpinner:self.spinner3 toView:self.collectionView3];

    self.noInternetErrorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No internet connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Retry", nil];
    
    [self loginButtonClicked:nil];
    
    self.collectionView1.layer.borderWidth = 1.0f;
    self.collectionView2.layer.borderWidth = 1.0f;
    self.collectionView3.layer.borderWidth = 1.0f;
    
    self.collectionView1.layer.cornerRadius = 3.0f;
    self.collectionView2.layer.cornerRadius = 3.0f;
    self.collectionView3.layer.cornerRadius = 3.0f;
    
    self.navigationItem.title = @"Anasayfa";
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:139.0/255 green:165.0/255 blue:74.0/255 alpha:0.6]];
    
    [self.collectionView1 registerNib:[UINib nibWithNibName:NSStringFromClass([MainPageCategoriesCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView2 registerNib:[UINib nibWithNibName:NSStringFromClass([MainPageCategoriesCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView3 registerNib:[UINib nibWithNibName:NSStringFromClass([MainPageCategoriesCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.anim = [self.produckLogoImage.layer pop_animationForKey:@"rotate"];
    self.anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    self.anim.toValue = @([self.anim.fromValue floatValue] + (M_PI*2));
    self.anim.springSpeed = 1.0f;
    self.anim.springBounciness = 2;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if([NetworkManager checkInternetConnection])
    {
        if(collectionView==self.collectionView1 && [self.collectionView1Data objectAtIndex:indexPath.row])
        {
            [self performSegueWithIdentifier:@"mainPageToProductPageSeg" sender:[self.collectionView1Data objectAtIndex:indexPath.row]];
        }
        else if(collectionView == self.collectionView2 && [self.collectionView2Data objectAtIndex:indexPath.row])
        {
            [self performSegueWithIdentifier:@"mainPageToProductPageSeg" sender:[self.collectionView2Data objectAtIndex:indexPath.row]];
        }
        else if(collectionView == self.collectionView3 && [self.collectionView3Data objectAtIndex:indexPath.row])
        {
            [self performSegueWithIdentifier:@"mainPageToProductPageSeg" sender:[self.collectionView3Data objectAtIndex:indexPath.row]];
        }
    }
    else  [self.noInternetErrorAlert show];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.produckLogoImage.layer pop_addAnimation:self.anim forKey:@"rotate"];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.iOSDeviceScreenSize.width-15, 100);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    /*
     if(collectionView==self.collectionView1)
    {
        return self.collectionView1Data.count;
    }
    else if(collectionView == self.collectionView2)
    {
        return self.collectionView2Data.count;
    }
    else if(collectionView == self.collectionView3)
    {
        return self.collectionView3Data.count;
    }
     */
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainPageCategoriesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    return cell;
}

-(void)downloadTopTenCategoriesContent
{
    // TODO
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue destinationViewController] isKindOfClass:[DetailPageTabBarController class]])
    {
        DetailPageTabBarController *vc = (DetailPageTabBarController *)[segue destinationViewController];
        vc.product = sender;
    }
}

- (IBAction)showProfileMenu:(id)sender
{
    [self.profileInfoArrow removeFromSuperview];
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    self.frostedViewController.panGestureEnabled = YES;
    self.frostedViewController.menuViewSize = CGSizeMake(self.iOSDeviceScreenSize.width*(7.0/10), self.iOSDeviceScreenSize.height);
    self.frostedViewController.direction = REFrostedViewControllerDirectionRight;
    
    [self.frostedViewController presentMenuViewController];
}

- (IBAction)showCategoriesMenu:(id)sender
{
    [self.categoriesInfoArrow removeFromSuperview];
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    self.frostedViewController.panGestureEnabled = YES;
    self.frostedViewController.menuViewSize = CGSizeMake(self.iOSDeviceScreenSize.width*(7.0/10), self.iOSDeviceScreenSize.height);
    self.frostedViewController.direction = REFrostedViewControllerDirectionLeft;
    
    [self.frostedViewController presentMenuViewController];
}

- (IBAction)loginButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"mainPageToLoginScreenSeg" sender:self];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView==self.noInternetErrorAlert){
        switch (buttonIndex) {
            case 0:
                break;
            case 1:
                [self performSelector:@selector(downloadTopTenCategoriesContent) withObject:@1 afterDelay:0.1f];
                break;
            default:
                break;
        }
    }
}

-(void)setupSpinner:(UIActivityIndicatorView *)spinner toView:(UIView *)view
{
    spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.frame = CGRectMake(0, 0, 30, 30);
    spinner.center = CGPointMake((self.iOSDeviceScreenSize.width/2), 80);
    spinner.hidesWhenStopped = YES;
    [view addSubview:spinner];
    [spinner startAnimating];
}

@end
