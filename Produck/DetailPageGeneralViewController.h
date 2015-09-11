//
//  DetailPageGeneralViewController.h
//  Produck
//
//  Created by Efe Helvaci on 21/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailPageTabBarController.h"

@interface DetailPageGeneralViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UIPopoverPresentationControllerDelegate, ActiveViewController>

@property (strong, nonatomic) IBOutlet UICollectionView *imagesCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *commentsCollectionView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imagesCollectionViewHeight;

@end
