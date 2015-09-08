//
//  ProductCategory.h
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductCategory : NSObject

@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *ImageURL;
@property (strong, nonatomic) NSString *Name;

-(id)initWithID:(NSString *)ID ImageURL:(NSString *)ImageURL Name:(NSString *)Name;

@end
