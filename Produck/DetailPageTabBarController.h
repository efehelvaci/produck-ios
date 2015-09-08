//
//  DetailPageTabBarController.h
//  Produck
//
//  Created by Efe Helvaci on 21/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface DetailPageTabBarController : UITabBarController

@property (strong, nonatomic) Product *product;

@end
