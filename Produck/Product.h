//
//  Product.h
//  Produck
//
//  Created by Efe Helvaci on 19/08/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *Manufacturer;
@property (strong, nonatomic) NSString *ImageURL;
@property (strong, nonatomic) NSString *Name;
@property (strong, nonatomic) NSDictionary *TechnicalDetails;

-(id)initWithID:(NSString *)ID Manufacturer:(NSString *)Manufacturer ImageURL:(NSString *)ImageURL Name:(NSString *)Name TechnicalDetails:(NSDictionary *)TechnicalDetails;

@end
