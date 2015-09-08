//
//  CategoryPageViewCell.m
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "CategoryPageViewCell.h"

@implementation CategoryPageViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)detailButtonClicked:(id)sender
{
    [self.delegate cellClicked:self.cellRow];
}

@end
