//
//  ProductCategory.m
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "ProductCategory.h"

@implementation ProductCategory

-(id)initWithID:(NSString *)ID ImageURL:(NSString *)ImageURL Name:(NSString *)Name
{
    self.ID = ID;
    self.ImageURL = ImageURL;
    self.Name = Name;
    
    return self;
}

@end
