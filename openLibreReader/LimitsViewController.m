//
//  SecondViewController.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import "LimitsViewController.h"
#import "Configuration.h"

@interface LimitsViewController ()
    @property (nonatomic, strong) IBOutlet UITextField* high;
    @property (nonatomic, strong) IBOutlet UITextField* above;
    @property (nonatomic, strong) IBOutlet UITextField* below;
    @property (nonatomic, strong) IBOutlet UITextField* low;
@end

@implementation LimitsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    Configuration* c = [Configuration instance];
    _high.text = [c valueWithoutUnit:[c highBGLimit]];
    _above.text = [c valueWithoutUnit:[c upperBGLimit]];
    _below.text = [c valueWithoutUnit:[c lowerBGLimit]];
    _low.text = [c valueWithoutUnit:[c lowBGLimit]];
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

-(IBAction)next:(id)sender {
    if(sender == _high) {
        double v = [[_high.text stringByReplacingOccurrencesOfString:@"," withString:@"."] doubleValue];
        NSLog(@"got %f as new value for high",v);
        [[Configuration instance] setHighBGLimit:[[Configuration instance] fromValue:v]];
        _high.text = [NSString stringWithFormat:@"%.1f",v];
    } else if(sender == _above) {
        double v = [[_above.text stringByReplacingOccurrencesOfString:@"," withString:@"."] doubleValue];
        NSLog(@"got %f as new value for above",v);
        [[Configuration instance] setUpperBGLimit:[[Configuration instance] fromValue:v]];
        _above.text = [NSString stringWithFormat:@"%.1f",v];
    } else if(sender == _below) {
        double v = [[_below.text stringByReplacingOccurrencesOfString:@"," withString:@"."] doubleValue];
        NSLog(@"got %f as new value for below",v);
        [[Configuration instance] setLowerBGLimit:[[Configuration instance] fromValue:v]];
        _below.text = [NSString stringWithFormat:@"%.1f",v];
    } else if(sender == _low) {
        double v = [[_low.text stringByReplacingOccurrencesOfString:@"," withString:@"."] doubleValue];
        NSLog(@"got %f as new value for low",v);
        [[Configuration instance] setLowBGLimit:[[Configuration instance] fromValue:v]];
        _low.text = [NSString stringWithFormat:@"%.1f",v];
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
