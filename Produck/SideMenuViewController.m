//
//  SideMenuViewController.m
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "SideMenuViewController.h"
#import "SideMenuViewCell.h"
#import "REFrostedViewController.h"

@interface SideMenuViewController ()

@property (assign, nonatomic) CGSize iOSDeviceScreenSize;
@property (strong, nonatomic) NSArray *productCategories;
@property (strong, nonatomic) NSArray *profileMenuCategories;

@end

@implementation SideMenuViewController

static NSString * const reuseIdentifier = @"SideMenuCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.productCategories = @[@"tablets", @"cellPhones", @"laptops"];
    self.profileMenuCategories = @[@"Anasayfa", @"Profil", @"Favori ürünler", @"Son incelenenler", @"Çıkış"];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SideMenuViewCell class]) bundle:nil]
         forCellReuseIdentifier:reuseIdentifier];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if(self.frostedViewController.direction==REFrostedViewControllerDirectionRight)
    {
        self.tableView.tableHeaderView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 184.0f)];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
            imageView.image = [UIImage imageNamed:@"testProfileImage"];
            imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            imageView.layer.masksToBounds = YES;
            imageView.layer.cornerRadius = 50.0;
            imageView.layer.borderColor = [UIColor whiteColor].CGColor;
            imageView.layer.borderWidth = 3.0f;
            imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
            imageView.layer.shouldRasterize = YES;
            imageView.clipsToBounds = YES;
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
            label.text = @"Efe Helvacı";
            label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
            label.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
            [label sizeToFit];
            label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            
            [view addSubview:imageView];
            [view addSubview:label];
            view;
        });
    }
    
    else
    {
        self.tableView.tableHeaderView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 40.0f)];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 0, 24)];
            NSDictionary *underlineAttribute = @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
            label.attributedText = [[NSMutableAttributedString alloc]initWithString:@"Kategoriler" attributes:underlineAttribute];
            label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
            label.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor colorWithRed:162/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
            [label sizeToFit];
            label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            
            [view addSubview:label];
            view;
        });
    }
    
    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.frostedViewController.direction==REFrostedViewControllerDirectionLeft)
    {
        [self.frostedViewController.contentViewController performSegueWithIdentifier:@"categorySeg" sender:[self.productCategories objectAtIndex:indexPath.row]];
    }
    else
    {
        switch (indexPath.row) {
            case 0:
                [self.frostedViewController.navigationController popToRootViewControllerAnimated:NO];
                break;
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                exit(0);
                break;
            default:
                break;
        }
    }
    [self.frostedViewController hideMenuViewController];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.frostedViewController.direction==REFrostedViewControllerDirectionRight)
    {
        return 5;
    }
    
    return self.productCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SideMenuViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if(self.frostedViewController.direction==REFrostedViewControllerDirectionRight)
    {
        cell.itemNameLabel.text = [self.profileMenuCategories objectAtIndex:indexPath.row];
        switch (indexPath.row) {
            case 0:
                cell.itemIcon.image = [UIImage imageNamed:@"HomepageIcon"];
                break;
            case 1:
                cell.itemIcon.image = [UIImage imageNamed:@"ProfileIcon"];
                break;
            case 2:
                cell.itemIcon.image = [UIImage imageNamed:@"FavoritesIcon"];
                break;
            case 3:
                cell.itemIcon.image = [UIImage imageNamed:@"HourglassIcon"];
                break;
            case 4:
                cell.itemIcon.image = [UIImage imageNamed:@"ExitIcon"];
                break;
            default:
                break;
        }
    }
    else
    {
        if([[self.productCategories objectAtIndex:indexPath.row] isEqualToString:@"tablets"])
        {
            cell.itemNameLabel.text = @"Tabletler";
            cell.itemIcon.image = [UIImage imageNamed:@"TabletIcon"];
        }
        else if([[self.productCategories objectAtIndex:indexPath.row] isEqualToString:@"cellPhones"])
        {
            cell.itemNameLabel.text = @"Cep telefonları";
            cell.itemIcon.image = [UIImage imageNamed:@"CellphoneIcon"];
        }
        else if([[self.productCategories objectAtIndex:indexPath.row] isEqualToString:@"laptops"])
        {
            cell.itemNameLabel.text = @"Dizüstü Bilgisayarlar";
            cell.itemIcon.image = [UIImage imageNamed:@"LaptopIcon"];
        }
    }
    
    return cell;
}

- (IBAction)closeButtonClicked:(id)sender
{
    [self.frostedViewController hideMenuViewController];
}

@end
