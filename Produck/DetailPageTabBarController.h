//
//  DetailPageTabBarController.h
//  Produck
//
//  Created by Efe Helvaci on 21/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@protocol ActiveViewController <NSObject>

-(void)rightBarButtonItemClicked;

@end

@interface DetailPageTabBarController : UITabBarController

@property (strong, nonatomic) Product *product;
@property (strong, nonatomic) id <ActiveViewController> buttonDelegate;

-(void)setButtonDelegate:(id<ActiveViewController>)buttonDelegate vc:(NSInteger)vc;

@end
