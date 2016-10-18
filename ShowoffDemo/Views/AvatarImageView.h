//
//  AvatarImageView.h
//  ShowoffDemo
//
//  Created by Damir Peterlik on 18/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
IB_DESIGNABLE

@interface AvatarImageView : UIImageView

@property (nonnull, strong) IBInspectable UIColor* imageColor;
@property (nonatomic) IBInspectable CGFloat cornerRadius;

@end
