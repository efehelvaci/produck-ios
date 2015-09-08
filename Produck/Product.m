//
//  Product.m
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "Product.h"

@implementation Product

-(id)initWithID:(NSString *)ID Manufacturer:(NSString *)Manufacturer ImageURL:(NSString *)ImageURL Name:(NSString *)Name TechnicalDetails:(NSDictionary *)TechnicalDetails
{
    self.ID = ID;
    self.Manufacturer = Manufacturer;
    self.ImageURL = ImageURL;
    self.Name = Name;
    self.TechnicalDetails = TechnicalDetails;
    
    return self;
}

@end
