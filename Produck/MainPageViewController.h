//
//  MainPageViewController.h
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainPageViewController : UIViewController <UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *categoriesInfoArrow;
@property (weak, nonatomic) IBOutlet UIImageView *profileInfoArrow;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView1;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView2;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView3;
@property (weak, nonatomic) IBOutlet UIImageView *produckLogoImage;

@end
