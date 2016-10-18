//
//  ShowoffLoginHandler.m
//  ShowoffDemo
//
//  Created by Damir Peterlik on 16/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import "ShowoffLoginHandler.h"
#import "InstagramKit.h"
#import "ShowoffInstagramEngine.h"

@import SafariServices;

@interface ShowoffLoginHandler () {
    UIViewController *rootViewController;
    SFSafariViewController *safariViewController;
    WebViewController *webViewController;
}

@end

@implementation ShowoffLoginHandler

+ (instancetype)sharedHandler {
    static ShowoffLoginHandler *sharedHandler = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHandler = [[ShowoffLoginHandler alloc] init];
    });
    
    return sharedHandler;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        rootViewController = [[[UIApplication sharedApplication] delegate] window].rootViewController;
        
        UIApplication *application = [UIApplication sharedApplication];
        UIWindow *backWindow = application.windows[0];
        UIStoryboard *mainStoryboard = backWindow.rootViewController.storyboard;
        
        webViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"WebViewController"];
        _friendIds = [NSMutableArray array];

    }
    return self;
}

- (UIViewController *)topViewController {
    UIViewController *test = rootViewController;
    if (rootViewController.presentedViewController) {
        test = rootViewController.presentedViewController;
    }
    return test;
}

- (BOOL)instagramSessionActive {
    return [[ShowoffInstagramEngine sharedEngine] isSessionValid];
}

- (void)logoutFromInstagram {
    [[ShowoffInstagramEngine sharedEngine] logout];
}

- (void)attemptInstagramLogin {
    NSURL *authURL = [[ShowoffInstagramEngine sharedEngine] authorizationURL];
    safariViewController = [[SFSafariViewController alloc] initWithURL:authURL];
    
//    if (safariViewController) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [[self topViewController] presentViewController:safariViewController animated:YES completion:nil];
//        });
//    } else {
        [webViewController loadRequestWithURL:authURL];
        [[self topViewController] presentViewController:webViewController animated:YES completion:nil];
//    }
}

- (BOOL)validateUrl:(NSURL *)url {
    NSError *error;
    
    BOOL valid = NO;

    if ([[ShowoffInstagramEngine sharedEngine] receivedValidAccessTokenFromURL:url error:&error]) {
        NSLog(@"Instagram login success");
        valid = YES;
    } else {
        NSLog(@"Instagram login error: %@",[error localizedDescription]);
    }
    
    [[self topViewController] dismissViewControllerAnimated:YES completion:nil];
    return valid;
}

@end
