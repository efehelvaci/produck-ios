//
//  DetailPageGeneralViewController.h
//  Produck
//
//  Created by Efe Helvaci on 21/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailPageGeneralViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *commentsCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;

@end
