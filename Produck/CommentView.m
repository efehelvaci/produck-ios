//
//  CommentView.m
//  Produck
//
//  Created by Efe Helvaci on 21/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "CommentView.h"

@interface CommentView ()

@property (strong, nonatomic) UILabel *textLabel;

@end

@implementation CommentView

static NSString *text = @"";

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    return self;
}

-(UILabel *)textLabel
{
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0, 5.0, self.frame.size.width - 10.0, self.frame.size.height - 8.0)];
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.numberOfLines = 1;
    self.textLabel.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:self.textLabel];
    
    return self.textLabel;
}

- (void)setText:(NSString *)textt
{
    text = textt;
    self.textLabel.text = textt;
}

-(void)addCommentToView:(UIView *)view comment:(NSString *)comment commentCount:(NSInteger)count
{
    CGRect parentFrame = view.frame;
    
    CGRect selfFrame = CGRectMake(parentFrame.origin.x+10, parentFrame.size.height+10, parentFrame.size.width-20, 300); //    x, y, width, height
    CommentView *commentView = [[CommentView alloc]initWithFrame:selfFrame];
    
    commentView.backgroundColor = [UIColor clearColor];
    commentView.layer.cornerRadius = 3.0f;
    
    [commentView setText:comment];


}

@end
