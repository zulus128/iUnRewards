//
//  iuViewController.m
//  iu
//
//  Created by вадим on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iuViewController.h"

@implementation iuViewController

@synthesize site;
@synthesize surl;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (id)initWithAddress:(NSString*)url {
    
    if (self = [super init]) {
        
        self.surl = url;
    }
    
	return self;
}

- (void)bck {
    
    [self.site goBack];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    UIBarButtonItem* bi = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(bck)] autorelease];
    self.navigationItem.leftBarButtonItem = bi; 

    
    NSString* urlAdress = self.surl;//@"http://www.uniquerewards.com";
    NSURL *url = [NSURL URLWithString:urlAdress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.site loadRequest:requestObj];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    /*
    //You might need to set up a interceptLinks-Bool since you don't want to intercept the initial loading of the content
    if (self.interceptLinks) {
        NSURL *url = request.URL;
        //This launches your custom ViewController, replace it with your initialization-code
        [BrowserViewController openBrowserWithUrl:url];     
        return NO;
    }
    //No need to intercept the initial request to fill the WebView
    else {
        self.interceptLinks = TRUE;
        return YES;
    }
    */

    NSLog(@"Loading %@", [request.URL absoluteString]);
    
    return YES;
}

@end
