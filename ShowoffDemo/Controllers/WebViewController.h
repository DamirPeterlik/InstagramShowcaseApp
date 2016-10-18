//
//  WebViewController.h
//  ShowoffDemo
//
//  Created by Damir Peterlik on 16/10/2016.
//  Copyright © 2016 Damir Peterlik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface WebViewController : BaseViewController <UIWebViewDelegate, UIActionSheetDelegate>

@property (nonatomic, weak) IBOutlet UIWebView *webView;

- (void)loadRequestWithURL:(NSURL *)url;
- (IBAction)closeButtonTouched:(id)sender;

@end
