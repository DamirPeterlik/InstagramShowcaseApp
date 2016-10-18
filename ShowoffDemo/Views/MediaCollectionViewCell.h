//
//  MediaCollectionViewCell.h
//  ShowoffDemo
//
//  Created by Damir Peterlik on 18/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowoffInstagramEngine.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface MediaCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mediaImageView;

- (void)setMediaCollectionCellWith:(InstagramMedia *)media;

@end
