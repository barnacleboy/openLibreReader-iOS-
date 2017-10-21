//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Device.h"

@interface BluetoothDevice : Device
    @property (retain) BluetoothService* service;
    @property (retain) CBPeripheral* device;

+(BOOL) compatibleService:(CBService*) service;
+(BOOL) compatibleName:(CBPeripheral*) peripheral;
@end
