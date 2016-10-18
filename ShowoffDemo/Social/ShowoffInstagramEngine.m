//
//  ShowoffInstagramEngine.m
//  ShowoffDemo
//
//  Created by Damir Peterlik on 17/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import "ShowoffInstagramEngine.h"
#import "InstagramKit.h"

@implementation ShowoffInstagramEngine

+ (instancetype)sharedEngine {
    static ShowoffInstagramEngine *_sharedEngine = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedEngine = [[ShowoffInstagramEngine alloc] init];
    });
    return _sharedEngine;
}


@end
