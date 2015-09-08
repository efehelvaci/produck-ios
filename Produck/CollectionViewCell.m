//
//  CollectionViewCell.m
//  Produck
//
//  Created by Efe Helvaci on 31/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "CollectionViewCell.h"
#import "ImagesCollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {

    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ImagesCollectionViewCell class]) bundle:nil]
                forCellWithReuseIdentifier:@"imagesCell"];
}

@end
