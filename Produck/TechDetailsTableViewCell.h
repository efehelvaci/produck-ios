//
//  TechDetailsTableViewCell.h
//  Produck
//
//  Created by Efe Helvaci on 09/09/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TechDetailsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UILabel *detailName;
@property (weak, nonatomic) IBOutlet UILabel *detail;

@end
