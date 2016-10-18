//
//  LoginViewController.m
//  ShowoffDemo
//
//  Created by Damir Peterlik on 17/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import "LoginViewController.h"
#import "ShowoffLoginHandler.h"
#import "ShowoffInstagramEngine.h"
#import "UserProfileViewController.h"

@interface LoginViewController () {
    InstagramUser *instagramUser;
    NSArray *mediaArray;
    BOOL didAtemptToLogin;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)instagramButtonTouched:(id)sender {
    if (![[ShowoffLoginHandler sharedHandler] instagramSessionActive]) {
        [[ShowoffLoginHandler sharedHandler] attemptInstagramLogin];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([[ShowoffInstagramEngine sharedEngine] accessToken]) {
        [self setUserData];
    }
}

- (void)setUserData {
    UINavigationController *recNav = [self.storyboard instantiateViewControllerWithIdentifier:@"userProfileNavigationViewController"];
    UserProfileViewController *userProfileViewController = (UserProfileViewController *)[recNav.childViewControllers objectAtIndex:0];
    
    [[ShowoffInstagramEngine sharedEngine] getSelfUserDetailsWithSuccess:^(InstagramUser * _Nonnull user) {
        userProfileViewController.instagramUserProfileData = user;
        userProfileViewController.navigationItem.title = user.username;
    } failure:^(NSError * _Nonnull error, NSInteger serverStatusCode) {
        NSLog(@"%@", error);
    }];
    
    [[ShowoffInstagramEngine sharedEngine] getSelfRecentMediaWithCount:9 maxId:nil success:^(NSArray<InstagramMedia *> * _Nonnull media, InstagramPaginationInfo * _Nonnull paginationInfo) {
        mediaArray = media;
        userProfileViewController.mediaCountArray = mediaArray;
        
        [self presentViewController:recNav animated:YES completion:nil];
    } failure:^(NSError * _Nonnull error, NSInteger serverStatusCode) {
        NSLog(@"%@", error);
    }];
}

@end
