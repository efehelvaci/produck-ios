//
//  DetailPageGeneralViewController.m
//  Produck
//
//  Created by Efe Helvaci on 21/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "DetailPageGeneralViewController.h"
#import "CommentsCollectionViewCell.h"
#import "ImagesCollectionViewCell.h"
#import "CommentViewController.h"

@interface DetailPageGeneralViewController ()

@property (strong, nonatomic) Product *product;
@property (strong, nonatomic) DetailPageTabBarController *tabBarController;

@end

@implementation DetailPageGeneralViewController

static NSString * const reuseIdentifierForImages = @"imagesCell";
static NSString * const reuseIdentifierForComments = @"commentsCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBarController = [[DetailPageTabBarController alloc]init];
    self.tabBarController = (DetailPageTabBarController *) self.tabBarController;
    self.product = self.tabBarController.product;

    [self.commentsCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CommentsCollectionViewCell class]) bundle:nil]
          forCellWithReuseIdentifier:reuseIdentifierForComments];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tabBarController setButtonDelegate:self vc:0];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(collectionView==self.commentsCollectionView)
    {
        CGFloat widthOfMyTextBox = [[UIScreen mainScreen] bounds].size.width-95;
     
        NSString *commentText =  @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        NSString *positivesCommentText = @"Acayip iyi bir şey ya acayiiip";
        NSString *negativesCommentText = @"O kadar iyi değil değillll puanım 1";

        CGSize constraint = CGSizeMake(widthOfMyTextBox, MAXFLOAT);

        NSDictionary *attributes = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:14.0] forKey:NSFontAttributeName];

        CGRect commentTextsize = [commentText boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        CGRect positivesCommentTextsize = [positivesCommentText boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        CGRect negativesCommentTextsize = [negativesCommentText boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];

        CGFloat totalHeight = commentTextsize.size.height + positivesCommentTextsize.size.height + negativesCommentTextsize.size.height;

        return CGSizeMake([[UIScreen mainScreen] bounds].size.width-10, totalHeight+85);
    }
    else
    {
        return CGSizeMake([[UIScreen mainScreen] bounds].size.width-10, self.imagesCollectionView.frame.size.height-5);
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(collectionView==self.commentsCollectionView)
    {
        CommentsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierForComments forIndexPath:indexPath];
        
        cell.userNameLabel.text = @"Efe Helvacı";
        cell.commentLabel.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        cell.locationLabel.text = @"Miyendis";
        cell.dateLabel.text = @"01.09.2015";
        cell.positiveCommentsLabel.text = @"Acayip iyi bir şey ya acayiiip";
        cell.negativeCommentsLabel.text = @"O kadar iyi değil değillll puanım 1";
        cell.layer.borderWidth = 0.2f;
        cell.layer.cornerRadius = 5.0f;
        
        return cell;
    }
    else
    {
        ImagesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierForImages forIndexPath:indexPath];
        
        return cell;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if([self.commentsCollectionView isDragging])
    {
        CGPoint translation = [scrollView.panGestureRecognizer translationInView:scrollView];
        
        if(translation.y > 1 && self.imagesCollectionViewHeight.constant<=200 && self.commentsCollectionView.contentOffset.y<=200)
        {
            self.imagesCollectionViewHeight.constant += 10;
            if(self.commentsCollectionView.contentOffset.y==0) {
                self.imagesCollectionViewHeight.constant = 220;
                self.imagesCollectionView.alpha = 1.0f;
            }
            if(self.imagesCollectionView.alpha <= 1 && self.imagesCollectionView.alpha >= 0) self.imagesCollectionView.alpha += 0.02f;
            [self.imagesCollectionView reloadData];
        } else if(translation.y < -30 && self.imagesCollectionViewHeight.constant>=0)
        {
            self.imagesCollectionViewHeight.constant -= 5.0f;
            if(self.imagesCollectionView.alpha <= 2 && self.imagesCollectionView.alpha >= 0) self.imagesCollectionView.alpha -= 0.01f;
            [self.imagesCollectionView reloadData];
        }
    }
}

-(void)rightBarButtonItemClicked
{
    CommentViewController *dateVC = [CommentViewController new];
    UINavigationController *destNav = [[UINavigationController alloc] initWithRootViewController:dateVC];
    
    UIPopoverPresentationController *popPC = destNav.popoverPresentationController;
    dateVC.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-15,[UIScreen mainScreen].bounds.size.height-220);
    destNav.modalPresentationStyle = UIModalPresentationPopover;
    popPC = destNav.popoverPresentationController;
    popPC.delegate = self;
    popPC.sourceView = self.view;
    popPC.sourceRect = CGRectMake([UIScreen mainScreen].bounds.size.width-36, 29, 22, 22);
    destNav.modalPresentationStyle = UIModalPresentationPopover;
    destNav.navigationBarHidden = YES;
    [self presentViewController:destNav animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
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
