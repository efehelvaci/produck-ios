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
        self.laptopFeatures = @[@[NSLocalizedString(@"generalFeatures", nil),
                                  NSLocalizedString(@"manufacturer", nil),
                                  NSLocalizedString(@"colorOptions", nil),
                                  NSLocalizedString(@"width", nil),
                                  NSLocalizedString(@"height", nil),
                                  NSLocalizedString(@"length", nil),
                                  NSLocalizedString(@"weight", nil)],
                                @[NSLocalizedString(@"displayFeatures", nil),
                                  NSLocalizedString(@"size", nil),
                                  NSLocalizedString(@"resolution", nil),
                                  NSLocalizedString(@"type", nil),
                                  NSLocalizedString(@"graphicCardManufacturer", nil),
                                  NSLocalizedString(@"graphicCardModel", nil),
                                  NSLocalizedString(@"graphicMemoryAccesibility", nil)],
                                @[NSLocalizedString(@"processorFeatures", nil),
                                  NSLocalizedString(@"processorManufacturer", nil),
                                  NSLocalizedString(@"processorModel", nil),
                                  NSLocalizedString(@"processorSpeed", nil),
                                  NSLocalizedString(@"processorCore", nil)],
                                @[NSLocalizedString(@"batteryFeatures", nil),
                                  NSLocalizedString(@"cellCount", nil),
                                  NSLocalizedString(@"chemistry", nil),
                                  NSLocalizedString(@"capacity", nil),
                                  NSLocalizedString(@"maxPower", nil)],
                                @[NSLocalizedString(@"memoryFeatures", nil),
                                  NSLocalizedString(@"ram", nil),
                                  NSLocalizedString(@"ramCapacity", nil),
                                  NSLocalizedString(@"ramSpeed", nil),
                                  NSLocalizedString(@"ramType", nil),
                                  NSLocalizedString(@"ramMaxCapacity", nil),
                                  NSLocalizedString(@"ramHomeCount", nil),],
                                @[NSLocalizedString(@"storageFeatures", nil),
                                  NSLocalizedString(@"capacity", nil),
                                  NSLocalizedString(@"opticDriverType", nil)],
                                @[NSLocalizedString(@"connectivityFeatures", nil),
                                  NSLocalizedString(@"wifi", nil),
                                  NSLocalizedString(@"bluetooth", nil),
                                  NSLocalizedString(@"hdmi", nil),
                                  NSLocalizedString(@"vga", nil),
                                  NSLocalizedString(@"usb2", nil),
                                  NSLocalizedString(@"usb3", nil)],
                                @[NSLocalizedString(@"platformFeatures", nil),
                                  NSLocalizedString(@"operatingSystem", nil),
                                  NSLocalizedString(@"operatingSystemBits", nil)],
                                @[NSLocalizedString(@"otherFeatures", nil),
                                  NSLocalizedString(@"includedAccesories", nil),
                                  NSLocalizedString(@"sound", nil),
                                  NSLocalizedString(@"webcam", nil),
                                  NSLocalizedString(@"microphone", nil)]
                                ];
        self.laptopFeaturesIcons =  @[@[@"Manufacturer",
                                        @"ColorOptions",
                                        @"Width",
                                        @"Height",
                                        @"Length",
                                        @"Weight"],
                                      @[@"DisplaySize",
                                        @"DisplayResolution",
                                        @"DisplayType",
                                        @"DisplayGraphicCardManufacturer",
                                        @"DisplayGraphicCardModel",
                                        @"DisplayCardAccessibility"],
                                      @[@"ProcessorManufacturer",
                                        @"ProcessorModel",
                                        @"ProcessorSpeed",
                                        @"ProcessorCore"],
                                      @[@"BatteryCellCount",
                                        @"BatteryChemistry",
                                        @"BatteryCapacity",
                                        @"BatteryMaxPower"],
                                      @[@"RAM",
                                        @"RamCapacity",
                                        @"RamSpeed",
                                        @"RamType",
                                        @"RamMaxCapacity",
                                        @"RamHomeCount"],
                                      @[@"StorageCapacity",
                                        @"OpticDriverType"],
                                      @[@"Wifi",
                                        @"Bluetooth",
                                        @"HDMI",
                                        @"VGA",
                                        @"Usb2",
                                        @"Usb3"],
                                      @[@"OperatingSystem",
                                        @"OperatingSystemBit"],
                                      @[@"IncludedAccessories",
                                        @"Sound",
                                        @"Webcam",
                                        @"Microphone"]
                                      ];
    }
    return self;
}

@end
