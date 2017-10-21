//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import "BluetoothDevice.h"

@implementation BluetoothDevice

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)isReady {
    //notify readiness
}

+(BOOL) compatibleService:(CBService*) service {
    @throw [NSException exceptionWithName:@"Instantiationexception"
                                   reason:@"not possible"
                                 userInfo:nil];
    return NO;
}

+(BOOL) compatibleName:(CBPeripheral*) peripheral {
    @throw [NSException exceptionWithName:@"Instantiationexception"
                                   reason:@"not possible"
                                 userInfo:nil];
    return NO;
}

@end
