//
//  CategoryPageViewCell.h
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol cellClickedDelegate <NSObject>

-(void)cellClicked:(NSInteger)cellRow;

@end

@interface CategoryPageViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productManufacturerLabel;
@property (strong, nonatomic) id <cellClickedDelegate> delegate;
@property (assign, nonatomic) NSInteger cellRow;

@end
