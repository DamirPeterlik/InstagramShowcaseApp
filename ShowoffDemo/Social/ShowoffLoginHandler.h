//
//  ShowoffLoginHandler.h
//  ShowoffDemo
//
//  Created by Damir Peterlik on 16/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebViewController.h"

@interface ShowoffLoginHandler : NSObject


@property (nonatomic, strong) NSMutableArray *friendIds;

+ (instancetype)sharedHandler;

- (void)attemptInstagramLogin;
- (void)logoutFromInstagram;
- (BOOL)validateUrl:(NSURL *)url;
- (BOOL)instagramSessionActive;

@end
