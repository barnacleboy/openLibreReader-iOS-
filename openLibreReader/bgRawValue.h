//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface bgRawValue : NSObject
    @property (readonly) double rawValue;
    @property (strong,readonly) NSData* rawData;
    @property (strong,readonly) NSString* rawSource;

-(instancetype) initWith:(double)rawValue withData:(NSData*)data from:(NSString*)source;
@end

