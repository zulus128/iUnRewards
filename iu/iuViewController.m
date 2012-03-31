//
//  iuViewController.m
//  iu
//
//  Created by вадим on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iuViewController.h"
#import "Common.h"

@implementation iuViewController

@synthesize site;
@synthesize surl;
@synthesize lab;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (id)initWithAddress:(NSString*)url  del:(BOOL)del mail:(BOOL)mail{
    
    if (self = [super init]) {
        
        self.surl = url;
        removeable = del;
        pmail = mail;
    }
    
	return self;
}

- (void)bck {
    
    [self.site goBack];
}

- (void)del {
    
    [[Common instance] removeTab:self];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {

    if(pmail) {
        
        CGRect f = [[UIScreen mainScreen] bounds];
        NSLog(@"width = %f", f.size.width);
        int l = 50;
        BOOL b = ((fromInterfaceOrientation == UIInterfaceOrientationPortrait) || (fromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown));
        
//        site.frame = CGRectMake(f.origin.x, f.origin.y + l, f.size.width, f.size.height - l);
        self.lab.frame = CGRectMake(0, 0, !b?f.size.width:f.size.height, l);
      
//        self.lab.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.lab.text = @"This is your e-mail account you've chosen by default on this device. To change your e-mail account, please go to 'Settings' - 'Apps' - 'UniqueRewards'.";
        
//        [self.lab performSelectorOnMainThread : @selector(setText:) withObject:@"This is your e-mail account you've chosen by default on this device. To change your e-mail account, please go to 'Settings' - 'Apps' - 'UniqueRewards'." waitUntilDone:YES];
    }
}

- (void)refrMail {
     
    if(pmail) {
        
        CGRect f = [Common instance].rect;
        int l = 50;
        site.frame = CGRectMake(f.origin.x, f.origin.y + l, f.size.width, f.size.height - l);
        self.lab.frame = CGRectMake(0, 0, f.size.width, l);
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [Common instance].pemail = [prefs stringForKey:@"email"];
        if(([Common instance].pemail == nil) || ([[Common instance].pemail isEqualToString:@""]))
            [Common instance].pemail = @"http://gmail.com";
        
        [prefs setObject:[Common instance].pemail forKey:@"email"];
        [prefs synchronize];
        
        NSLog(@"pemail = %@", [Common instance].pemail);
        
        NSURL *url = [NSURL URLWithString:[Common instance].pemail];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [self.site loadRequest:requestObj];
    }
    else {
        
        if([Common instance].entered)
            site.frame = [Common instance].rect;
        else {
            [Common instance].rect = site.frame;
            [Common instance].entered = YES;
        }
        
    }
}

- (void)viewWillAppear:(BOOL)animated {
    

    [super viewWillAppear:animated];
    
    [self refrMail];

}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    
    
//    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:uibarbuttonInstance1, uibarbuttonInstance2, nil];

//    UIToolbar* toolbar = [[UIToolbar alloc]
//                          initWithFrame:CGRectMake(0, 0, 320, 45)];
//    [toolbar setBarStyle: UIBarStyleBlackOpaque];
//    
//    // create an array for the buttons
//    NSMutableArray* buttons = [[NSMutableArray alloc] initWithCapacity:5];
//    
//    // create a standard save button
//    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
//                                   initWithBarButtonSystemItem:UIBarButtonSystemItemSave
//                                   target:self
//                                   action:@selector(deleteAction:)];
//    saveButton.style = UIBarButtonItemStyleBordered;
//    [buttons addObject:saveButton];
//    [saveButton release];
//    
//    // create a standard delete button with the trash icon
//    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc]
//                                     initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
//                                     target:self
//                                     action:@selector(deleteAction:)];
//    deleteButton.style = UIBarButtonItemStyleBordered;
//    [buttons addObject:deleteButton];
//    [deleteButton release];
//    
//    UIBarButtonItem *addbutton = [[UIBarButtonItem alloc]
//                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
//                                  target:self
//                                  action:@selector(deleteAction:)];
//    addbutton.style = UIBarButtonItemStyleBordered;
//    [buttons addObject:addbutton];
//    [addbutton release];
//    
//    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
//                                   initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
//                                   target:self
//                                   action:@selector(deleteAction:)];
//    editButton.style = UIBarButtonItemStyleBordered;
//    [buttons addObject:editButton];
//    [editButton release];
//    
//    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
//                                   initWithBarButtonSystemItem:UIBarButtonSystemItemDone
//                                   target:self
//                                   action:@selector(deleteAction:)];
//    doneButton.style = UIBarButtonItemStyleBordered;
//    [buttons addObject:doneButton];
//    [doneButton release];
//    
//    // put the buttons in the toolbar and release them
//    [toolbar setItems:buttons animated:NO];
//    [buttons release];
    
    
    
    bi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(bck)];
    self.navigationItem.leftBarButtonItem = bi; 

    if (removeable) {
        
        UIBarButtonItem* bi1 = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(del)] autorelease];
        self.navigationItem.rightBarButtonItem = bi1; 
    }

    firsttime = YES;
    
    if(!pmail) {
    NSString* urlAdress = self.surl;//@"http://www.uniquerewards.com";
    NSURL *url = [NSURL URLWithString:urlAdress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.site loadRequest:requestObj];
    }
    
    [bi setEnabled:self.site.canGoBack];
    
    [super viewDidLoad];
}

- (void)dealloc {
    
    [bi release];

    [super dealloc];
    
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
    return YES;
//    return ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft)||(interfaceOrientation == UIInterfaceOrientationLandscapeRight));
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSLog(@"finishLoad");
    
    [bi setEnabled:self.site.canGoBack];
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

    if(firsttime) {
        
        firsttime = NO;
        return YES;
    }

    NSLog(@"Loading %@", [request.URL absoluteString]);
    
    if ( [[request.URL absoluteString] hasPrefix:TEST_STRING]||
            [[request.URL absoluteString] hasPrefix:TEST_STRING1]
        )    {
        
        [[Common instance] addTab:[request.URL absoluteString]title:@"Offer"];
        return NO;
    }
    if ( [[request.URL absoluteString] hasPrefix:TEST_STRING2]
        )    {
        
        [[Common instance] addTab:[request.URL absoluteString]title:@"Main 2"];
        return NO;
    }
    if ( [[request.URL absoluteString] hasPrefix:TEST_STRING3]||
        [[request.URL absoluteString] hasPrefix:TEST_STRING5]||
        [[request.URL absoluteString] hasPrefix:TEST_STRING6]
        )    {
        
        [[Common instance] addTab:[request.URL absoluteString]title:@"Facebook"];
        return NO;
    }
    if ( [[request.URL absoluteString] hasPrefix:TEST_STRING4]
        )    {
        
        [[Common instance] addTab:[request.URL absoluteString]title:@"Twitter"];
        return NO;
    }

    return YES;
}

@end
