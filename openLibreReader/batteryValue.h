//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface batteryValue : NSObject
    @property (readonly) int volts;
    @property (readonly) int raw;
    @property (readonly) NSTimeInterval timestamp;
    @property (strong,readonly) NSString* source;
    @property (strong) Class sourceDevice;

-(instancetype) initWith:(int)volts raw:(int)raw from:(NSString*)source class:(Class)device at:(NSTimeInterval)timestamp;
@end
