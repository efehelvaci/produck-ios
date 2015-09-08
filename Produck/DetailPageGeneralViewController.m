//
//  DetailPageGeneralViewController.m
//  Produck
//
//  Created by Efe Helvaci on 21/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "DetailPageGeneralViewController.h"
#import "ImagesCollectionViewCell.h"
#import "CommentsCollectionViewCell.h"
#import "CollectionViewCell.h"
#import "DetailPageTabBarController.h"

@interface DetailPageGeneralViewController ()

@property (strong, nonatomic) Product *product;

@end

@implementation DetailPageGeneralViewController

static NSString * const reuseIdentifierForImages = @"imagesCell";
static NSString * const reuseIdentifierForComments = @"commentsCell";
static NSString * const reuseIdentifierForCollectionViewCell = @"collectionViewCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DetailPageTabBarController *tabBarController = (DetailPageTabBarController *) self.tabBarController;
    self.product = tabBarController.product;
    
    self.productNameLabel.text = self.product.Name;


    [self.commentsCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CollectionViewCell class]) bundle:nil]                                             forCellWithReuseIdentifier:reuseIdentifierForCollectionViewCell];
    [self.commentsCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CommentsCollectionViewCell class]) bundle:nil]
          forCellWithReuseIdentifier:reuseIdentifierForComments];
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        return CGSizeMake([[UIScreen mainScreen] bounds].size.width, 300);
    }
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width-10, 300);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(collectionView==self.commentsCollectionView)
    {
        if(indexPath.row==0){
            CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierForCollectionViewCell forIndexPath:indexPath];
            cell.collectionView.delegate = self;
            cell.collectionView.dataSource = self;
            
            return cell;
        }
        CommentsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierForComments forIndexPath:indexPath];
        
        cell.userNameLabel.text = @"Efe Helvacı";
        cell.commentLabel.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        cell.layer.borderWidth = 0.5f;
        cell.layer.cornerRadius = 5.0f;
        
        return cell;
    }
    else
    {
        ImagesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierForImages forIndexPath:indexPath];
        
        return cell;
    }
}

- (IBAction)backButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
