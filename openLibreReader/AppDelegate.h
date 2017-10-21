//
//  AppDelegate.h
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kAppWillSuspend @"AppWillSuspendNotification"
#define kAppDidActivate @"AppDidActivateNotification"
#define kAppRecievedNotification @"AppRecievedNotification"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
    @property (strong, nonatomic) UIWindow *window;
@end

