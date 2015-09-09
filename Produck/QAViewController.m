//
//  QAViewController.m
//  Produck
//
//  Created by Efe Helvaci on 09/09/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "QAViewController.h"
#import "DetailPageTabBarController.h"
#import "QATableViewCell.h"
#import "Product.h"

@interface QAViewController ()

@property (strong, nonatomic) NSMutableArray *questions; // Feed data
@property (strong, nonatomic) Product *product;

@end

@implementation QAViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DetailPageTabBarController *tabBarController = (DetailPageTabBarController *) self.tabBarController;
    self.product = tabBarController.product;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat widthOfMyTextBox = [[UIScreen mainScreen] bounds].size.width-30;
    
    NSString *cellText = @"ASDJASDJASJDASJDQWDLKAJSDKLJWQLasdasdasdDASDASDDKDJASDHKWQHDKJASHDKJQWHKDJAHSJDHASJKDHSAJDHASJDHSAJKDH";
    //set the desired size of your textbox
    CGSize constraint = CGSizeMake(widthOfMyTextBox, MAXFLOAT);
    //set your text attribute dictionary
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:15.0] forKey:NSFontAttributeName];
    //get the size of the text box
    CGRect textsize = [cellText boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    //calculate your size
    float textHeight = textsize.size.height +20;
    //I have mine set for a minimum size
    textHeight = (textHeight < 50.0) ? 50.0 : textHeight;
    
    return textHeight+8;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.questions.count;
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"questionCell" forIndexPath:indexPath];
    
    cell.questionLabel.text = @"ASDJASDJASJDASJDQWDLKAJSDKLJWQLasdasdasdDASDASDDKDJASDHKWQHDKJASHDKJQWHKDJAHSJDHASJKDHSAJDHASJDHSAJKDH";
    
    return cell;
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
