//
//  SecondViewController.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import "AlarmsViewController.h"
#import "Configuration.h"
#import "Storage.h"

@interface AlarmsViewController ()
    @property (nonatomic, strong) IBOutlet UITextField* high;
    @property (nonatomic, strong) IBOutlet UISwitch* highRepeat;
    @property (nonatomic, strong) IBOutlet UITextField* low;
    @property (nonatomic, strong) IBOutlet UISwitch* lowRepeat;
    @property (nonatomic, strong) IBOutlet UITextField* minutes;
    @property (nonatomic, strong) IBOutlet UISwitch* noRepeat;
    @property (nonatomic, strong) IBOutlet UISwitch* mute;
    @property (nonatomic, strong) IBOutlet UISwitch* awake;
@end

@implementation AlarmsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    Configuration* c = [Configuration instance];
    _high.text = [c valueWithoutUnit:[c alarmHighBG]];
    _highRepeat.on = [c alarmHighBGRepeats];
    _low.text = [c valueWithoutUnit:[c alarmLowBG]];
    _lowRepeat.on = [c alarmLowBGRepeats];
    _minutes.text = [NSString stringWithFormat:@"%d",[c alarmNoDataMinutes]];
    _noRepeat.on = [c alarmNoDataRepeats];
    _mute.on = [c overrideMute];
    _awake.on = [c keepRunning];
}

-(void)viewDidAppear:(BOOL)animated {
    [_high becomeFirstResponder];
    [_high selectAll:nil];
}

-(void)viewDidDisappear:(BOOL)animated {
    for(int i = 0; i < 100; i++) {
        [[self.view viewWithTag:i] resignFirstResponder];
    }
}
-(IBAction)swChange:(id)sender {
    if(sender == _highRepeat) {
        [[Configuration instance] setAlarmHighBGRepeats:_highRepeat.isOn];
    } else if(sender == _lowRepeat) {
        [[Configuration instance] setAlarmLowBGRepeats:_lowRepeat.isOn];
    } else if(sender == _noRepeat) {
        [[Configuration instance] setAlarmNoDataRepeats:_noRepeat.isOn];
    } else if(sender == _mute) {
        [[Configuration instance] setOverrideMute:_mute.isOn];
    } else if(sender == _awake) {
        [[Configuration instance] setKeepRunning:_awake.isOn];
    }
}
-(IBAction)next:(id)sender {
    if(sender == _high) {
        double v = [[_high.text stringByReplacingOccurrencesOfString:@"," withString:@"."] doubleValue];
        NSLog(@"got %f as new value for high",v);
        [[Configuration instance] setAlarmHighBG:[[Configuration instance] fromValue:v]];
        _high.text = [NSString stringWithFormat:@"%.1f",v];
    } else if(sender == _low) {
        double v = [[_low.text stringByReplacingOccurrencesOfString:@"," withString:@"."] doubleValue];
        NSLog(@"got %f as new value for low",v);
        [[Configuration instance] setAlarmLowBG:[[Configuration instance] fromValue:v]];
        _low.text = [NSString stringWithFormat:@"%.1f",v];
    } else if(sender == _minutes) {
        double v = [_minutes.text intValue];
        NSLog(@"got %f as new value for minutes",v);
        [[Configuration instance] setAlarmNoDataMinutes:v];
        _minutes.text = [NSString stringWithFormat:@"%.0f",v];
    }
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField selectAll:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField {
    NSInteger nextTag = textField.tag + 1;
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        [nextResponder becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return NO;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    //[textField becomeFirstResponder];
    //[textField selectAll:nil];
    return YES;
}
@end
