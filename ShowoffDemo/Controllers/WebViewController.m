//
//  WebViewController.m
//  ShowoffDemo
//
//  Created by Damir Peterlik on 16/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import "WebViewController.h"
#import "ShowoffLoginHandler.h"
#import "ShowoffInstagramEngine.h"
#import "UserProfileViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)loadRequestWithURL:(NSURL *)url {
    [self view];//make sure view is loaded
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (IBAction)closeButtonTouched:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];
}

#pragma mark - UIActionSheetDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *token = [self queryStringParametersFromString:request.URL.fragment][@"access_token"];
    if (token) {
        [[ShowoffLoginHandler sharedHandler] validateUrl:request.URL];
    }
    
    return YES;
}

- (NSDictionary *)queryStringParametersFromString:(NSString*)string {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [[string componentsSeparatedByString:@"&"] enumerateObjectsUsingBlock:^(NSString * param, NSUInteger idx, BOOL *stop) {
        NSArray *pairs = [param componentsSeparatedByString:@"="];
        if ([pairs count] != 2) return;
        
        NSString *key = [pairs[0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *value = [pairs[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [dict setObject:value forKey:key];
    }];
    return dict;
}

@end
