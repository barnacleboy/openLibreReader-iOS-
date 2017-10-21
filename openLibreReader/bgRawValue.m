//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import "bgRawValue.h"

@implementation bgRawValue

-(instancetype) initWith:(double)rawValue withData:(NSData*)data from:(NSString*)source; {
    self = [super init];
    if (self) {
        _rawValue = rawValue;
        _rawData = data;
        _rawSource = source;
    }
    return self;
}

@end
