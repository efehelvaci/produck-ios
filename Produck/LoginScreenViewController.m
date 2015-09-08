//
//  LoginScreenViewController.m
//  Produck
//
//  Created by Efe Helvaci on 03/09/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "LoginScreenViewController.h"

@interface LoginScreenViewController ()

@end

@implementation LoginScreenViewController

static NSInteger backgroundImageQueue = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.logoImageView.layer.cornerRadius = 60.0f;
    
    [self changeBackgroundImage];
}

- (IBAction)dismissLoginScreenButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)facebookLoginButtonClicked:(id)sender
{
    
}

-(void)changeBackgroundImage
{
    [UIView transitionWithView:self.backgroundImageView
                      duration:1.0f
                       options:UIViewAnimationOptionCurveEaseInOut |
     UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        switch (backgroundImageQueue%9) {
                            case 0:
                                self.backgroundImageView.image = [UIImage imageNamed:@"LoginBackground1"];
                                break;
                            case 1:
                                self.backgroundImageView.image = [UIImage imageNamed:@"LoginBackground2"];
                                break;
                            case 2:
                                self.backgroundImageView.image = [UIImage imageNamed:@"LoginBackground3"];
                                break;
                            case 3:
                                self.backgroundImageView.image = [UIImage imageNamed:@"LoginBackground4"];
                                break;
                            case 4:
                                self.backgroundImageView.image = [UIImage imageNamed:@"LoginBackground5"];
                                break;
                            case 5:
                                self.backgroundImageView.image = [UIImage imageNamed:@"LoginBackground6"];
                                break;
                            case 6:
                                self.backgroundImageView.image = [UIImage imageNamed:@"LoginBackground7"];
                                break;
                            case 7:
                                self.backgroundImageView.image = [UIImage imageNamed:@"LoginBackground8"];
                                break;
                            case 8:
                                self.backgroundImageView.image = [UIImage imageNamed:@"LoginBackground9"];
                                break;
                            default:
                                break;
                        }
                    } completion:nil];
    
    backgroundImageQueue++;

    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 4.0 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self changeBackgroundImage];
    });
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
