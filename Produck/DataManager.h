//
//  SharedManager.h
//  Produck
//
//  Created by Efe Helvaci on 10/09/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

@property (nonatomic, retain) NSArray *laptopFeatures;
@property (nonatomic, retain) NSArray *cellphonesFeatures;
@property (nonatomic, retain) NSArray *tabletFeatures;

@property (nonatomic, retain) NSArray *laptopFeaturesIcons;

+ (id)sharedManager;

@end
