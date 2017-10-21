//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BluetoothService.h"

typedef enum {
    DEVICE_CONNECTING,
    DEVICE_CONNECTED,
    DEVICE_DISCONNECTED,
    NO_DEVICE,
    DEVICE_FOUND,
    DEVICE_ERROR,
    DEVICE_OK
} DEVICE_STATUS;

@interface DeviceStatus : NSObject
    @property DEVICE_STATUS status;
    @property (strong) NSString* statusText;
    @property (strong) CBPeripheral* device;
@end
