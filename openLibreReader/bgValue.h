//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "bgRawValue.h"

@interface bgValue : NSObject
    @property (readonly) int value;
    @property (readonly) NSTimeInterval timestamp;
    @property (strong,readonly) NSString* source;
    @property (strong) bgRawValue* raw;
@property double deltaPerMinute;

-(instancetype) initWith:(int)value from:(NSString*)source at:(NSTimeInterval)timestamp delta:(double)delta raw:(bgRawValue*)raw;
@end

