//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import "Configurable.h"

@implementation Configurable

+(NSString*) configurationName {
    @throw [NSException exceptionWithName:@"Instantiationexception"
                                   reason:@"not possible"
                                 userInfo:nil];
    return nil;
}

+(NSString*) configurationDescription {
    @throw [NSException exceptionWithName:@"Instantiationexception"
                                   reason:@"not possible"
                                 userInfo:nil];
    return nil;
}
+(UIViewController*) configurationViewController {
    @throw [NSException exceptionWithName:@"Instantiationexception"
                                   reason:@"not possible"
                                 userInfo:nil];
    return nil;
}

@end
