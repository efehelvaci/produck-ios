//
//  Toast.h
//  Milliyet1
//
//  Created by Efe Helvaci on 13/08/15.
//  Copyright (c) 2015 Efe Helvaci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Toast : UIView

+ (void)showToastInView:(UIView *)parentView withText:(NSString *)text withDuaration:(float)duration;

@end
