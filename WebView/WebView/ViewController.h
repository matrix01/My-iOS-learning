//
//  ViewController.h
//  WebView
//
//  Created by Milan Mia on 11/9/15.
//  Copyright © 2015 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) NSString *pageUrl;
@property (strong, nonatomic) NSArray *allUrl;
@property NSInteger _index;
@end

