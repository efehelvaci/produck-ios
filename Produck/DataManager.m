//
//  SharedManager.m
//  Produck
//
//  Created by Efe Helvaci on 10/09/15.
//  Copyright (c) 2015 Produck. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+ (id)sharedManager {
    static DataManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        self.laptopFeatures = @[@[@"Genel Özellikler",
                                  @"Menşei",
                                  @"Rengi"],
                                @[@"İşlemci Özellikleri",
                                  @"İşlemci Ön Bellek",
                                  @"İşlemci Markası",
                                  @"İşlemci Teknolojisi",
                                  @"İşlemci Hızı",
                                  @"İşlemci Numarası"],
                                @[@"RAM (Bellek) Özellikleri",
                                  @"Bellek Kapasitesi",
                                  @"Bellek Tipi",
                                  @"Bellek Bus Hızı"],
                                @[@"Ekran Özellikleri",
                                  @"Ekran Boyu",
                                  @"Ekran Çözünürlüğü",
                                  @"Ekran tipi"],
                                @[@"Ekran Kartı",
                                  @"Ekran Kartı Tipi",
                                  @"Ekran Kartı Markası",
                                  @"Ekran Kartı Chipseti"],
                                @[@"HDD Özellikleri",
                                  @"Disk Kapasitesi",
                                  @"Disk Türü"],
                                @[@"Diğer",
                                  @"İşletim Sistemi"],
                                @[@"Multimedya Özellikler",
                                  @"FaceTime HD Kamera"]
                                ];
    }
    return self;
}

@end
