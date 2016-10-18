//
//  UserProfileViewController.m
//  ShowoffDemo
//
//  Created by Damir Peterlik on 18/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import "UserProfileViewController.h"
#import "ShowoffLoginHandler.h"
#import "LoginViewController.h"
#import "HeaderViewCollectionReusableView.h"
#import "MediaCollectionViewCell.h"

@interface UserProfileViewController () {
    CGFloat cellHeightWidth;
    CGSize cellSize;
}

@end

@implementation UserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    cellHeightWidth = self.view.frame.size.width /3.025;
    cellSize = CGSizeMake(cellHeightWidth, cellHeightWidth);
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithImage:nil style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationItem setLeftBarButtonItem:backButtonItem];
    
    [self.collectionView reloadData];
}

- (IBAction)logoutTouchedBarButtonItem:(id)sender {
    [[ShowoffLoginHandler sharedHandler] logoutFromInstagram];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return self.mediaCountArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MediaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mediaCollectionViewCell" forIndexPath:indexPath];
    
    [cell setMediaCollectionCellWith:[self.mediaCountArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return cellSize;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderViewCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        [headerView setHeaderViewWith:self.instagramUserProfileData];
        reusableview = headerView;
    }
    
    return reusableview;
}

@end
