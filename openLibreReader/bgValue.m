//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import "bgValue.h"

@implementation bgValue

-(instancetype) initWith:(int)value from:(NSString*)source at:(NSTimeInterval)timestamp delta:(double)delta raw:(bgRawValue*)raw {
    self = [super init];
    if (self) {
        _value = value;
        _source = source;
        _timestamp = timestamp;
        _raw = raw;
        _deltaPerMinute = delta;
    }
    return self;
}
@end
