//
//  iuViewController.m
//  iu
//
//  Created by вадим on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iuViewController.h"
#import "Common.h"

#define labheight 50

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

- (id)initWithAddress:(NSString*)url  del:(BOOL)del mail:(BOOL)mail clickcash:(BOOL)clickcash {
    
    if (self = [super init]) {
        
        self.surl = url;
        removeable = del;
        pmail = mail;
        pclick = clickcash;
    }
    
	return self;
}

- (void)bck {
    
    NSLog(@"back");
    [self.site goBack];
}

- (void)fwd {
    
    NSLog(@"forward");
    [self.site goForward];
}

- (void)rfr {
    
    NSLog(@"reload");
    [self.site reload];
}

- (void)del {
    
    [[Common instance] removeTab:self];
}

-(CGSize) sizeInOrientation:(UIInterfaceOrientation)orientation
{

//    float tbh = tabViewController.tabBar.frame.size.height;
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIApplication *application = [UIApplication sharedApplication];
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        size = CGSizeMake(size.height, size.width);
    }
    if (application.statusBarHidden == NO)
    {
        size.height -= MIN(application.statusBarFrame.size.width, application.statusBarFrame.size.height);
    }

    return size;
}

//- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {


    
    
//    CGRect frame = [UIScreen mainScreen].applicationFrame;
//    CGSize size = [self sizeInOrientation:self.interfaceOrientation];//frame.size;
//    NSLog(@"%@", [NSString stringWithFormat:@"Rotation: %s [w=%f, h=%f]",  
//                  UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? "Portrait" : "Landscape",
//                  size.width, size.height]);

    CGSize s = [self sizeInOrientation:self.interfaceOrientation];
    
    
    if(!pmail) {
    
        CGRect f = CGRectMake(0, 0, s.width, s.height);
        self.site.frame = f;

    }
    else {

        CGRect f = CGRectMake(0, labheight, s.width, s.height - labheight);
        self.site.frame = f;

        self.lab.frame = CGRectMake(0, 0, s.width, labheight);

//        CGRect f = [[UIScreen mainScreen] bounds];
//        NSLog(@"width = %f", f.size.width);
//        int l = 50;
//        BOOL b = ((fromInterfaceOrientation == UIInterfaceOrientationPortrait) || (fromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown));
        
//        self.lab.frame = CGRectMake(0, 0, !b?f.size.width:f.size.height, l);
      
        
        
    self.lab.text = @"This is your e-mail account you've chosen by default on this device. To change your e-mail account, please go to 'Settings' - 'Apps' - 'UniqueRewards'.";
        
    }
}

- (void)refrMail {
     
    [self didRotateFromInterfaceOrientation:0];

//    [self.site stopLoading];
    
    if(pmail) {
        
        
//        CGRect f = [Common instance].rect;
//        int l = 50;
//        site.frame = CGRectMake(f.origin.x, f.origin.y + l, f.size.width, f.size.height - l);
//        self.lab.frame = CGRectMake(0, 0, f.size.width, l);
        
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

//    if(pclick) {
//
//        [self.site stopLoading];
//        NSURL *url = [NSURL URLWithString:[Common instance].ccurl];
//        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//        [self.site loadRequest:requestObj];
//
//        
//    }
}

- (void)goAddress:(NSString*)str {
    
    firsttime = YES;
    
    NSURL *url = [NSURL URLWithString:@"about:blank"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.site loadRequest:requestObj];

    url = [NSURL URLWithString:str];
    requestObj = [NSURLRequest requestWithURL:url];
    [self.site loadRequest:requestObj];
    return;

}

- (void)viewWillAppear:(BOOL)animated {
    

    [super viewWillAppear:animated];
    
    [self refrMail];

}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    
    
//    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:uibarbuttonInstance1, uibarbuttonInstance2, nil];

//    NSLog(@"==== %f", [[UIScreen mainScreen] bounds].size.height - self.navigationController.view.frame.size.height);
    
    UIToolbar* toolbar = [[UIToolbar alloc]
                          initWithFrame:CGRectMake(0, 0, 200, 35)];
    [toolbar setBarStyle: UIBarStyleDefault];
    if (toolbar.subviews.count > 0)
        [[[toolbar subviews] objectAtIndex:0] removeFromSuperview];
    
    // create an array for the buttons
    NSMutableArray* buttons = [[NSMutableArray alloc] initWithCapacity:5];
    
    // create a standard save button
//    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
//                                   initWithBarButtonSystemItem:UIBarButtonSystemItemSave
//                                   target:self
//                                   action:@selector(deleteAction:)];
//    saveButton.style = UIBarButtonItemStyleBordered;
//    [buttons addObject:saveButton];
//    [saveButton release];
    
    
    
    
    
    UIButton *a1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [a1 setFrame:CGRectMake(0.0f, 0.0f, 30.0f, 26.0f)];
    [a1 addTarget:self action:@selector(bck) forControlEvents:UIControlEventTouchUpInside];
    [a1 setImage:[UIImage imageNamed:@"lef.png"] forState:UIControlStateNormal];
    r1 = [[UIBarButtonItem alloc] initWithCustomView:a1];
    [buttons addObject:r1];
    [r1 release];
    
    UIButton *a2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [a2 setFrame:CGRectMake(0.0f, 0.0f, 30.0f, 26.0f)];
    [a2 addTarget:self action:@selector(fwd) forControlEvents:UIControlEventTouchUpInside];
    [a2 setImage:[UIImage imageNamed:@"right.png"] forState:UIControlStateNormal];
    r2 = [[UIBarButtonItem alloc] initWithCustomView:a2];
    [buttons addObject:r2];
    [r2 release];
    
    UIButton *a3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [a3 setFrame:CGRectMake(0.0f, 0.0f, 33.0f, 26.0f)];
    [a3 addTarget:self action:@selector(rfr) forControlEvents:UIControlEventTouchUpInside];
    [a3 setImage:[UIImage imageNamed:@"refresh.png"] forState:UIControlStateNormal];
    r3 = [[UIBarButtonItem alloc] initWithCustomView:a3];
    [buttons addObject:r3];
    [r3 release];
    
    // create a standard delete button with the trash icon
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
    
    // put the buttons in the toolbar and release them
    [toolbar setItems:buttons animated:YES];
    [buttons release];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:toolbar];
    [toolbar release];
    
    
//    bi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(bck)];
//    self.navigationItem.leftBarButtonItem = bi; 

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
    
//    [bi setEnabled:self.site.canGoBack];
    
    [r1  setEnabled:self.site.canGoBack];
    [r2  setEnabled:self.site.canGoForward];
    
    [super viewDidLoad];
}

- (void)dealloc {
    
//    [bi release];
    [r1 release];
    [r2 release];
    [r3 release];

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
    
    //    [bi setEnabled:self.site.canGoBack];
    
    [r1  setEnabled:self.site.canGoBack];
    [r2  setEnabled:self.site.canGoForward];
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

    if([[request.URL absoluteString] isEqualToString:@"about:blank"])
        return YES;
    
    if(firsttime) {
        
        firsttime = NO;
        return YES;
    }

    NSLog(@"Loading %@", [request.URL absoluteString]);
    
    if ( [[request.URL absoluteString] hasPrefix:TEST_STRING1]
        )    {
        
        [[Common instance] addTab:[request.URL absoluteString]title:CLICK_CASH];
        return NO;
    }
    if ( [[request.URL absoluteString] hasPrefix:TEST_STRING]/*||
            [[request.URL absoluteString] hasPrefix:TEST_STRING1]*/
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
