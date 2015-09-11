//
//  CommentViewController.h
//  Produck
//
//  Created by Efe Helvaci on 10/09/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (weak, nonatomic) IBOutlet UITextView *positiveCommentTextView;
@property (weak, nonatomic) IBOutlet UITextView *negativeCommentTextView;


@end
