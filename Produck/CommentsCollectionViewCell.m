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
    self.userPhotoImageView.layer.cornerRadius = 42.0f;
    self.userPhotoImageView.layer.borderWidth = 2.0f;
    self.userPhotoImageView.layer.borderColor = [UIColor greenColor].CGColor;
}

@end
