//
//  MediaCollectionViewCell.m
//  ShowoffDemo
//
//  Created by Damir Peterlik on 18/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import "MediaCollectionViewCell.h"

@implementation MediaCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setMediaCollectionCellWith:(InstagramMedia *)media {
    [self.mediaImageView setImageWithURL:media.thumbnailURL];
}

@end
