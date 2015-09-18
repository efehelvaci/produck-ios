//
//  CategoryPageViewController.m
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "CategoryPageViewController.h"
#import "UIImageView+AFNetworking.h"
#import "NetworkManager.h"
#import "DetailPageTabBarController.h"

@interface CategoryPageViewController ()

@property (assign, nonatomic) CGSize iOSDeviceScreenSize;
@property (strong, nonatomic) NSMutableArray *products;    // Products Feed
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) UIActivityIndicatorView *spinner;

-(void)downloadProductsContents;

@end

@implementation CategoryPageViewController

static NSString * const reuseIdentifier = @"CategoryPageViewCell";
static NSInteger lastClickedCell;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self downloadProductsContents];

    self.iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    
    self.spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.spinner.frame = CGRectMake(0, 0, 30, 30);
    self.spinner.center = CGPointMake((self.iOSDeviceScreenSize.width/2), self.iOSDeviceScreenSize.height/3.0);
    self.spinner.hidesWhenStopped = YES;
    [[self collectionView]addSubview:self.spinner];
    [self.spinner startAnimating];

    self.navigationItem.title = @"Produck";
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(downloadProductsContents)
                  forControlEvents:UIControlEventValueChanged];
    [self.collectionView addSubview:self.refreshControl];
    
    self.navigationItem.title = NSLocalizedString(self.productCategoryName, nil);
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CategoryPageViewCell class]) bundle:nil]
          forCellWithReuseIdentifier:reuseIdentifier];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.iOSDeviceScreenSize.width-5, self.iOSDeviceScreenSize.height/3.0);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.products.count;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryPageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    cell.cellRow = indexPath.row;
    
    [UIView transitionWithView:cell
                      duration:0.4f
                       options:UIViewAnimationOptionCurveEaseInOut |
     UIViewAnimationOptionTransitionFlipFromBottom
                    animations:^{
                        [cell.productImageView setImageWithURL:[NSURL URLWithString:[[self.products objectAtIndex:indexPath.row] ImageURL]]];
                        cell.productNameLabel.text = [[self.products objectAtIndex:indexPath.row] Name];
                        cell.productManufacturerLabel.text = [[self.products objectAtIndex:indexPath.row] Manufacturer];
                    } completion:nil];
    
    
    cell.layer.borderWidth = 1.0f;
    cell.layer.borderColor = [UIColor grayColor].CGColor;
    cell.layer.cornerRadius = 5.0f;
    
    return cell;
}

-(void)downloadProductsContents
{
    NetworkManager *manager = [NetworkManager new];
    [manager getProductsWithCategoryName:self.productCategoryName wthSuccess:^(NSMutableArray *arr) {
        self.products = [[NSMutableArray alloc] initWithArray:arr];
        [self.collectionView reloadData];
        
        if([self.refreshControl isRefreshing]) [self.refreshControl endRefreshing];
        if([self.spinner isAnimating]) [self.spinner stopAnimating];
        
    } wthFail:^(NSInteger failType) {
        NSLog(@"Failed to download products");
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue destinationViewController] isKindOfClass:[DetailPageTabBarController class]])
    {
        DetailPageTabBarController *vc = [segue destinationViewController];
        vc.product = [self.products objectAtIndex:lastClickedCell];
    }
}

-(void)cellClicked:(NSInteger)cellRow
{
    lastClickedCell = cellRow;
    
    DetailPageTabBarController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"detailPageTabBarController"];
    vc.product = [self.products objectAtIndex:lastClickedCell];
    
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:vc];

    [self.navigationController presentViewController:navigationController animated:YES completion:nil];
//    [self performSegueWithIdentifier:@"CategoryToDetailPageSeg" sender:self];
}


@end
