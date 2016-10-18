//
//  UserProfileViewController.h
//  ShowoffDemo
//
//  Created by Damir Peterlik on 18/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ShowoffInstagramEngine.h"

@interface UserProfileViewController : BaseViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *logoutBarbuttonItem;
@property (nonatomic, strong) InstagramUser *instagramUserProfileData;
@property (nonatomic, strong) NSArray *mediaCountArray;

- (IBAction)logoutTouchedBarButtonItem:(id)sender;

@end
