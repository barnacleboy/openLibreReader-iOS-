//
//  SecondViewController.m
//  openLibreReader
//
//  Copyright © 2017 Sandra Keßler. All rights reserved.
//

#import "AboutViewController.h"
#import "Configuration.h"
#import "Storage.h"

@interface AboutViewController ()
    @property (nonatomic, strong) IBOutlet UIWebView* webView;
@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    [_webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[[NSBundle mainBundle] bundleURL]];
}

-(void)viewDidDisappear:(BOOL)animated {

}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"should load request: %@",request);
    if([[[request URL] absoluteString] hasSuffix:@"I_AGREE"]) {
        if(_hideOnAgree) {
            [[Storage instance] setAgree:YES];
            [super dismissViewControllerAnimated:YES completion:nil];
        }
        return NO;
    }
    return YES;
}
@end
