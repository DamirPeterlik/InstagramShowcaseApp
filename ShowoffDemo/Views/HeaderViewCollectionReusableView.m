//
//  HeaderViewCollectionReusableView.m
//  ShowoffDemo
//
//  Created by Damir Peterlik on 18/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import "HeaderViewCollectionReusableView.h"
#import <AFNetworking.h>


@implementation HeaderViewCollectionReusableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setHeaderViewWith:(InstagramUser *)userProfileData {
    self.userProfileName.text = userProfileData.fullName;
    self.userProfilePosts.text = [NSString stringWithFormat:@"%ld", (long)userProfileData.mediaCount];
    self.userProfileFollowers.text = [NSString stringWithFormat:@"%ld", (long)userProfileData.followedByCount];
    self.userProfileFollowing.text = [NSString stringWithFormat:@"%ld", (long)userProfileData.followsCount];
    [self.userProfileImageView setImageWithURL:userProfileData.profilePictureURL];
}

@end
