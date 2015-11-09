//
//  ViewController.m
//  WebView
//
//  Created by Milan Mia on 11/9/15.
//  Copyright © 2015 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _allUrl = @[@"http://www.google.com", @"http://www.fftsys.com", @"http://www.bjitgroup.com"];
    __index = 0;
    _pageUrl = [_allUrl objectAtIndex:__index];
    NSURL *url = [NSURL URLWithString:_pageUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    UISwipeGestureRecognizer *rightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipeHandle:)];
    rightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [rightRecognizer setNumberOfTouchesRequired:1];
    
    //add the your gestureRecognizer , where to detect the touch..
    [self.view addGestureRecognizer:rightRecognizer];
    
    UISwipeGestureRecognizer *leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipeHandle:)];
    leftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [leftRecognizer setNumberOfTouchesRequired:1];
    
    [self.view addGestureRecognizer:leftRecognizer];
}
- (void)rightSwipeHandle:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if(__index>0)
        __index--;
    else
        __index = 2;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];
    _pageUrl = [_allUrl objectAtIndex:__index];
    NSURL *url = [NSURL URLWithString:_pageUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:1.0f];
    animation.startProgress = 0.5;
    animation.endProgress   = 1;
    [animation setTimingFunction:UIViewAnimationCurveEaseInOut];
    [animation setType:@"pageCurl"];
    
    //[animation setType:kCATransitionFromRight];
    [animation setSubtype:kCATransitionFromLeft];
    
    [animation setRemovedOnCompletion:NO];
    [animation setFillMode: @"extended"];
    [animation setRemovedOnCompletion: NO];
    [[self.webView layer] addAnimation:animation forKey:@"WebPageCurl"];

}
- (void)leftSwipeHandle:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if(__index<2)
        __index++;
    else
        __index = 0;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];
    _pageUrl = [_allUrl objectAtIndex:__index];
    NSURL *url = [NSURL URLWithString:_pageUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:1.0f];
    animation.startProgress = 0.5;
    animation.endProgress   = 1;
    [animation setTimingFunction:UIViewAnimationCurveEaseInOut];
    [animation setType:@"pageCurl"];
    
    //[animation setType:kCATransitionFromRight];
    [animation setSubtype:kCATransitionFromRight];
    
    [animation setRemovedOnCompletion:NO];
    [animation setFillMode: @"extended"];
    [animation setRemovedOnCompletion: NO];
    [[self.webView layer] addAnimation:animation forKey:@"WebPageCurl"];
}
- (IBAction)nextPage:(id)sender {
    if(__index<2)
        __index++;
    else
        __index = 0;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];
    _pageUrl = [_allUrl objectAtIndex:__index];
    NSURL *url = [NSURL URLWithString:_pageUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:1.0f];
    animation.startProgress = 0.5;
    animation.endProgress   = 1;
    [animation setTimingFunction:UIViewAnimationCurveEaseInOut];
    [animation setType:@"pageCurl"];
    
    //[animation setType:kCATransitionFromRight];
    [animation setSubtype:kCATransitionFromRight];
    
    [animation setRemovedOnCompletion:NO];
    [animation setFillMode: @"extended"];
    [animation setRemovedOnCompletion: NO];
    [[self.webView layer] addAnimation:animation forKey:@"WebPageCurl"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
