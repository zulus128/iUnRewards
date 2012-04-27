//
//  Common.m
//  iUnRewards
//
//  Created by вадим on 11/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Common.h"

//#import "iuViewController.h"

@implementation Common

@synthesize tabBar;
@synthesize pemail;
//@synthesize entered;
@synthesize rect;
@synthesize ccurl;

+ (Common*) instance  {
	
	static Common* instance;
	
	@synchronized(self) {
		
		if(!instance) {
			
			instance = [[Common alloc] init];
		}
	}
	return instance;
}

- (void)refrMail {
    
    [vc2 refrMail];
}

- (id) init{	
	
	self = [super init];
	if(self !=nil) {
        
        
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3", @"UserAgent", nil];
        [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
        
        iuViewController* vc1 = [[iuViewController alloc] initWithAddress:@"http://www.uniquerewards.com" del:NO mail:NO clickcash:NO];
//        iuViewController* vc1 = [[iuViewController alloc] initWithAddress:@"http://www.twitter.com" del:NO];
        UINavigationController* nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
        //    nav1.navigationBar.hidden = YES;
        vc1.title = @"UniqueRewards";
        nav1.tabBarItem.image = [UIImage imageNamed:@"home.png"]; 
        [vc1 release]; vc1 = nil;
        
        vc2 = [[iuViewController alloc] initWithAddress:@"http://gmail.com" del:NO mail:YES clickcash:NO];
        vc2.title = @"Mail";
        UINavigationController* nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
        nav2.tabBarItem.image = [UIImage imageNamed:@"mail.png"]; 
        
        self.tabBar = [[UITabBarController alloc] init];
        [self.tabBar setViewControllers:[NSArray arrayWithObjects:nav1,nav2,/*nav3,nav4,*/nil]];

        [nav1 release]; nav1 = nil;
        [nav2 release]; nav2 = nil;
        //    [nav3 release]; nav3 = nil;
        //    [nav4 release]; nav4 = nil;
        //    [tabBar release]; tabBar = nil;

	}
	return self;	
}

- (void)removeTab: (iuViewController*) cont {

    NSMutableArray* listOfViewControllers = [[NSMutableArray alloc] init];
    [listOfViewControllers addObjectsFromArray: self.tabBar.viewControllers];    
    
    for (UINavigationController* i in listOfViewControllers)
        if ([i topViewController] == cont) {
            
            NSLog(@"found for delete");
            [listOfViewControllers removeObject:i];
            break;
        }
    
    [self.tabBar setViewControllers:listOfViewControllers animated:YES];
}

- (void)addTab: (NSString*) str title:(NSString*) title {

    NSMutableArray* listOfViewControllers = [[NSMutableArray alloc] init];
    [listOfViewControllers addObjectsFromArray: self.tabBar.viewControllers];
    
    
    int g = 0;
    BOOL found = NO;
    iuViewController* cc = nil;

    if([title isEqualToString:CLICK_CASH]) {

        self.ccurl = str;
        found = YES;

        for (UINavigationController* i in listOfViewControllers) {
        
        
            if (i.title == CLICK_CASH) {
                
                NSLog(@"found click cash");
                cc = (iuViewController*) [i topViewController];
                break;
            }
            g++;
        }
        
    }
    
    if (cc != nil) {
        
        [cc goAddress:str];
        
//        NSURL *url = [NSURL URLWithString:str];
//        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//        [self.site loadRequest:requestObj];
        
        self.tabBar.selectedIndex = g;
        return;
    }
    
    iuViewController* vc3 = [[iuViewController alloc] initWithAddress:str del:YES mail:NO clickcash:found];
    vc3.title = title;//@"Offer";
    UINavigationController* nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    nav3.navigationBar.hidden = NO;
    nav3.tabBarItem.image = [UIImage imageNamed:@"172-pricetag.png"]; 

    [listOfViewControllers addObject:nav3];

    [vc3 release];
//    vc3 = nil;
    
    [self.tabBar setViewControllers:listOfViewControllers animated:YES];
    
    [nav3 release];
//    nav3 = nil;
    
    self.tabBar.selectedIndex = listOfViewControllers.count - 1;

}

- (void)dealloc {

    self.tabBar = nil;
    self.pemail = nil;
    
    [vc2 release]; vc2 = nil;
    
    [super dealloc];
}

@end
