//
//  BluetoothService.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <UserNotifications/Usernotifications.h>
#import <AVFoundation/AVFoundation.h>

typedef enum {
    kAlarmRunning,
    kAlarmEnabled,
    kAlarmDisabled,
} AlarmState;

AlarmState alarmGetState(void);
void alarmsCancelDelivered(void);
void alarmsDisable(NSTimeInterval interval);

@interface Alarms : NSObject<UNUserNotificationCenterDelegate, AVAudioPlayerDelegate>

@end

