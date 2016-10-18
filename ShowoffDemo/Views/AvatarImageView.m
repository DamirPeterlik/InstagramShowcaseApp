//
//  AvatarImageView.m
//  ShowoffDemo
//
//  Created by Damir Peterlik on 18/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import "AvatarImageView.h"

@implementation AvatarImageView

#pragma mark -  Style setup

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    [self setupStyle];
}

- (void)setupStyle {
    self.layer.cornerRadius = self.cornerRadius;
    self.layer.backgroundColor = self.imageColor.CGColor;
    [self.layer setBorderColor: [[UIColor colorWithRed:194.0f/255.0f green:194.0f/255.0f blue:194.0f/255.0f alpha:1.0] CGColor]];
    [self.layer setBorderWidth: 0.4];
}

@end
