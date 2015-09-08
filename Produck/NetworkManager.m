//
//  NetworkManager.m
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "NetworkManager.h"
#import "TSMessage.h"

#define baseLink @"https://peaceful-savannah-2455.herokuapp.com/"

@implementation NetworkManager

-(void)getCategoriesWithSuccess:(void (^)(NSMutableArray *arr))success wthFail:(void(^)(NSInteger failType))fail
{
    [self GET:[NSString stringWithFormat:@"%@%@", baseLink, @"categories"] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *categories = [NSMutableArray new];
        NSMutableArray *root = [[NSMutableArray alloc] initWithArray:responseObject];
       
        NSString *ID;
        NSString *ImageURL;
        NSString *Name;
        
        for(NSInteger i = 0; i<root.count; i++)
        {
            if([[[root objectAtIndex:i] objectForKey:@"_id"]isKindOfClass:[NSString class]])
            {
                ID = [[root objectAtIndex:i]objectForKey:@"_id"];
            }
            else ID = @" ";
            
            if([[[root objectAtIndex:i] objectForKey:@"imageUrl"]isKindOfClass:[NSString class]])
            {
                ImageURL = [[root objectAtIndex:i]objectForKey:@"imageUrl"];
            }
            else ImageURL = @" ";
            
            if([[[root objectAtIndex:i] objectForKey:@"name"]isKindOfClass:[NSString class]])
            {
                Name = [[root objectAtIndex:i]objectForKey:@"name"];
            }
            else Name = @" ";
            
            ProductCategory *temp = [[ProductCategory alloc] initWithID:ID ImageURL:ImageURL Name:Name];
            [categories addObject:temp];
        }
        
        success(categories);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(0);
    }];
}

-(void)getProductsWithCategoryName:(NSString *)categoryName wthSuccess:(void (^)(NSMutableArray *arr))success wthFail:(void(^)(NSInteger failType))fail
{
    [self GET:[NSString stringWithFormat:@"%@%@", baseLink, categoryName] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *products = [NSMutableArray new];
        NSMutableArray *root = [[NSMutableArray alloc] initWithArray:responseObject];
        
        NSString *ID;
        NSString *Manufacturer;
        NSString *ImageURL;
        NSString *Name;
        NSDictionary *TechnicalDetails = [NSDictionary new];
        
        for(NSInteger i = 0; i<root.count; i++)
        {
            if([[[root objectAtIndex:i] objectForKey:@"_id"]isKindOfClass:[NSString class]])
            {
                ID = [[root objectAtIndex:i]objectForKey:@"_id"];
            }
            else ID = @" ";
            
            if([[[root objectAtIndex:i] objectForKey:@"manufacturer"]isKindOfClass:[NSString class]])
            {
                Manufacturer = [[root objectAtIndex:i]objectForKey:@"manufacturer"];
            }
            else Manufacturer = @" ";
            
            if([[[root objectAtIndex:i] objectForKey:@"imageUrl"]isKindOfClass:[NSString class]])
            {
                ImageURL = [[root objectAtIndex:i]objectForKey:@"imageUrl"];
            }
            else ImageURL = @" ";
            
            if([[[root objectAtIndex:i] objectForKey:@"name"]isKindOfClass:[NSString class]])
            {
                Name = [[root objectAtIndex:i]objectForKey:@"name"];
            }
            else Name = @" ";
            
            TechnicalDetails = [[root objectAtIndex:i] objectForKey:@"technicalDetails"];
            
            Product *temp = [[Product alloc] initWithID:ID Manufacturer:Manufacturer ImageURL:ImageURL Name:Name TechnicalDetails:TechnicalDetails];
            
            [products addObject:temp];
        }
        
        success(products);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(0);
    }];
}

+(void)startNetworkReachabilityMonitoring {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];

    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    [TSMessage showNotificationWithTitle:@"Bravo!"
                                                subtitle:@"Internet canavar knk."
                                                    type:TSMessageNotificationTypeSuccess];
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    [TSMessage showNotificationWithTitle:@"Ow shet"
                                                subtitle:@"Internet gitti amk"
                                                    type:TSMessageNotificationTypeError];
                default:
                    break;
            }
        }];
    });
    }

+(BOOL)checkInternetConnection
{
    return [[AFNetworkReachabilityManager sharedManager] isReachable];
}

@end
