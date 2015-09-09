//
//  CommentsCollectionViewCell.h
//  Produck
//
//  Created by Efe Helvaci on 22/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userPhotoImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *positiveCommentsLabel;
@property (weak, nonatomic) IBOutlet UILabel *negativeCommentsLabel;

@end
