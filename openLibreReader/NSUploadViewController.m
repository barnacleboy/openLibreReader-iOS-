//
//  SecondViewController.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import "NSUploadViewController.h"
#import "Configuration.h"
#import "Storage.h"
#import "nightscout.h"
#import <CommonCrypto/CommonDigest.h>

@interface NSUploadViewController ()
    @property (nonatomic, strong) IBOutlet UISwitch* enabled;
    @property (nonatomic, strong) IBOutlet UITextField* url;
    @property (nonatomic, strong) IBOutlet UITextField* password;
    @property (nonatomic, strong) IBOutlet UIButton* check;
@end

@implementation NSUploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    Configuration* c = [Configuration instance];
    if([[[Storage instance] getSelectedDeviceClass] isEqual:NSStringFromClass([nightscout class])]) {
        _enabled.enabled = NO;
        _enabled.on = NO;
        _url.enabled = NO;
        _password.enabled = NO;
        _check.enabled = NO;
    } else {
        _enabled.enabled = YES;
        _enabled.on = [c nsUpload];
        _url.text = [c nightscoutUploadURL];
        _password.text = [c nightscoutUploadHash];
    }
}

-(void)viewDidDisappear:(BOOL)animated {
    for(int i = 0; i < 100; i++) {
        [[self.view viewWithTag:i] resignFirstResponder];
    }

    [[Configuration instance] reloadNSUploadService];
}
-(IBAction)swChange:(id)sender {
    if(sender == _enabled) {
        _enabled.on = [[Configuration instance] setNsUpload:_enabled.isOn];
    }
}
+ (NSString *)sha1:(NSString*)input
{
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];

    CC_SHA1(data.bytes, (unsigned int)data.length, digest);

    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}
-(IBAction)next:(id)sender {
    if(sender == _url) {
        NSLog(@"got %@ as new value for url",_url.text);
        NSURL* url = [NSURL URLWithString:_url.text];
        NSString* u = nil;
        if([[url port] intValue]!=0) {
            u = [NSString stringWithFormat:@"%@://%@:%d",[url scheme],[url host],[[url port] intValue]];
        } else {
            u = [NSString stringWithFormat:@"%@://%@",[url scheme],[url host]];
        }
        [[Configuration instance] setNightscoutUploadURL:u];
    } else if(sender == _password) {
        NSLog(@"got new value for password");
        NSString* l = [NSUploadViewController sha1:_password.text];
        if([_password.text length]>=12) {
            [[Configuration instance] setNightscoutUploadHash:l];
            _check.enabled = YES;
        } else {
            _check.enabled = NO;
        }
    }
}
-(IBAction)check:(id)sender {
    [_password resignFirstResponder];
    [_url resignFirstResponder];

    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:NO block:^(NSTimer * _Nonnull timer) {

        if(_check.enabled) {
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setHTTPMethod:@"GET"];
            [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            [request addValue:[[Configuration instance] nightscoutUploadHash] forHTTPHeaderField:@"api-secret"];
            [request setURL:[NSURL URLWithString:[[[Configuration instance] nightscoutUploadURL] stringByAppendingString:@"/api/v1/verifyauth"]]];
            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration
                                                        defaultSessionConfiguration];
            NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
            NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request
                                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                                  {
                                                      UIAlertController* alert = nil;
                                                      if (!error && [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] rangeOfString:@"UNAUTHORIZED"].length==0) {
                                                          alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Connection Successful!",@"nsUpload.titleSuccess") message:nil preferredStyle:UIAlertControllerStyleActionSheet];
                                                      } else {
                                                          alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Connection not Successful!",@"nsUpload.titleNoSuccess") message:NSLocalizedString(@"Please check URL and Password, please enter only the URL you would use in a Webbrowser.",@"nsUpload.failMessage") preferredStyle:UIAlertControllerStyleActionSheet];
                                                      }
                                                      UIAlertAction* cancel = [UIAlertAction actionWithTitle:NSLocalizedString(@"close",@"nsUpload.close") style:UIAlertActionStyleDefault handler:nil];
                                                      [alert addAction:cancel];
                                                      [self presentViewController:alert animated:YES completion:nil];
                                                  }];
            [postDataTask resume];
        }
    }];
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
