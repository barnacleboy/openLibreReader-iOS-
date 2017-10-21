//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import "mgdl.h"

@implementation mgdl

+(NSString*) configurationName {
    return @"mg/dl";
}

+(NSString*) configurationDescription {
    return NSLocalizedString(@"use this if your values are measured in mg/dl, typically between 50 and 300",@"Description for mg/dl unit");
}

+(UIViewController*) configurationViewController {
    return nil;
}

@end
