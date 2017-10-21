//
//  DeviceViewController.h
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BluetoothDevice.h"

#define DEVICEVIEW_CHOOSEN  @"DEVICEVIEW_CHOOSEN"

@interface DeviceViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
    @property (weak) Class deviceFilter;
@end
