//
//  NetworkManager.h
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "ProductCategory.h"
#import "Product.h"

@interface NetworkManager : AFHTTPRequestOperationManager

-(void)getCategoriesWithSuccess:(void (^)(NSMutableArray *arr))success wthFail:(void(^)(NSInteger failType))fail;
-(void)getProductsWithCategoryName:(NSString *)categoryName wthSuccess:(void (^)(NSMutableArray *arr))success wthFail:(void(^)(NSInteger failType))fail;
+(BOOL)checkInternetConnection;
+(void)startNetworkReachabilityMonitoring;


@end
