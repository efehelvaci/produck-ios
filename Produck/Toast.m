//
//  Toast.m
//  Milliyet1
//
//  Created by Efe Helvaci on 13/08/15.
//  Copyright (c) 2015 Efe Helvaci. All rights reserved.
//

#import "Toast.h"

@implementation Toast

static UILabel *textLabel;
static NSString *text = @"";

float const ToastHeight = 30.0f;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    return self;
}

-(UILabel *)textLabel
{
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0, 5.0, self.frame.size.width - 10.0, self.frame.size.height - 8.0)];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.textColor = [UIColor whiteColor];
        textLabel.numberOfLines = 1;
        textLabel.font = [UIFont systemFontOfSize:13.0];
        [self addSubview:textLabel];

    return textLabel;
}

- (void)setText:(NSString *)textt
{
    text = textt;
    self.textLabel.text = textt;
}

+ (void)showToastInView:(UIView *)parentView withText:(NSString *)text withDuaration:(float)duration;
{
    CGRect parentFrame = parentView.frame;
    
    CGRect selfFrame = CGRectMake(parentFrame.origin.x+((parentFrame.size.width/2.0)-parentFrame.size.width*(3.0/10)), parentFrame.size.height-70.0, parentFrame.size.width*(3.0/5), ToastHeight);
    Toast *toast = [[Toast alloc] initWithFrame:selfFrame];
    
    toast.backgroundColor = [UIColor lightGrayColor];
    toast.alpha = 0.0f;
    toast.layer.cornerRadius = 4.0;
    [toast setText:text];
    
    [parentView addSubview:toast];
    
    [UIView animateWithDuration:0.4 animations:^{
        toast.alpha = 0.9f;
        toast.textLabel.alpha = 0.9f;
    }completion:^(BOOL finished) {
        if(finished){
            
        }
    }];
    
    
    [toast performSelector:@selector(hideSelf) withObject:nil afterDelay:duration];
    
}

- (void)hideSelf
{
    [UIView animateWithDuration:0.4 animations:^{
        self.alpha = 0.0;
        self.textLabel.alpha = 0.0;
    }completion:^(BOOL finished){
        if(finished)
        {
            [self removeFromSuperview];
        }
    }];
}


@end
