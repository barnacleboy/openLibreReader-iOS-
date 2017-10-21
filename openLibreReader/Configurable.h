//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Configurable : NSObject
+(NSString*) configurationName;
+(NSString*) configurationDescription;
+(UIViewController*) configurationViewController;
@end
