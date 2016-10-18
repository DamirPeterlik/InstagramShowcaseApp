//
//  HeaderViewCollectionReusableView.h
//  ShowoffDemo
//
//  Created by Damir Peterlik on 18/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowoffInstagramEngine.h"
#import "AvatarImageView.h"

@interface HeaderViewCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UILabel *userProfileName;
@property (weak, nonatomic) IBOutlet UILabel *userProfilePosts;
@property (weak, nonatomic) IBOutlet UILabel *userProfileFollowers;
@property (weak, nonatomic) IBOutlet UILabel *userProfileFollowing;
@property (weak, nonatomic) IBOutlet UILabel *userProfileBio;

@property (weak, nonatomic) IBOutlet AvatarImageView *userProfileImageView;

- (void)setHeaderViewWith:(InstagramUser *)userProfileData;

@end
