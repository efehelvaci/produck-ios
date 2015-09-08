//
//  CategoryPageViewController.h
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryPageViewCell.h"
#import "Product.h"

@interface CategoryPageViewController : UIViewController <UICollectionViewDelegateFlowLayout, cellClickedDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSString *productCategoryName;

@end
