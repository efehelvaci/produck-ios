//
//  CommentsCollectionViewCell.m
//  Produck
//
//  Created by Efe Helvaci on 22/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "CommentsCollectionViewCell.h"

@implementation CommentsCollectionViewCell

- (void)awakeFromNib {
    self.userPhotoImageView.layer.borderWidth = 1.0f;
    self.userPhotoImageView.layer.borderColor = [UIColor grayColor].CGColor;
}

@end
