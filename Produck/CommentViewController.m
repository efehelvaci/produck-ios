//
//  CommentViewController.m
//  Produck
//
//  Created by Efe Helvaci on 10/09/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.commentTextView.layer.borderWidth = 0.3f;
    self.commentTextView.layer.borderColor = [UIColor blueColor].CGColor;
    self.commentTextView.layer.cornerRadius = 5.0f;
    
    self.positiveCommentTextView.layer.borderWidth = 0.3f;
    self.positiveCommentTextView.layer.borderColor = [UIColor greenColor].CGColor;
    self.positiveCommentTextView.layer.cornerRadius = 5.0f;
    
    self.negativeCommentTextView.layer.borderWidth = 0.3f;
    self.negativeCommentTextView.layer.borderColor = [UIColor redColor].CGColor;
    self.negativeCommentTextView.layer.cornerRadius = 5.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendButton:(id)sender
{
    
}

- (IBAction)cancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
