//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import "batteryValue.h"

@implementation batteryValue

-(instancetype) initWith:(int)volts raw:(int)raw from:(NSString*)source class:(Class)device at:(NSTimeInterval)timestamp {
    self = [super init];
    if (self) {
        _volts= volts;
        _raw=raw;
        _source = source;
        _timestamp = timestamp;
        _sourceDevice = device;
    }
    return self;
}

@end
