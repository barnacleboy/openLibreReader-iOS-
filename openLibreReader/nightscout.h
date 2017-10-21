//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BluetoothDevice.h"

@interface nightscout : Device

- (instancetype)init;

@end

@interface nightscoutUploader : NSObject
-(void) reload;
@end
