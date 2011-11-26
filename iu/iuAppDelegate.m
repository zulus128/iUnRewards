//
//  iuAppDelegate.m
//  iu
//
//  Created by вадим on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iuAppDelegate.h"

#import "iuViewController.h"

@implementation iuAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
     
    
    
    iuViewController* vc1 = [[iuViewController alloc] initWithAddress:@"http://www.uniquerewards.com"];
    UINavigationController* nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
//    nav1.navigationBar.hidden = YES;
    vc1.title = @"Main";

    [vc1 release]; vc1 = nil;
    
    iuViewController* vc2 = [[iuViewController alloc] initWithAddress:@"http://gmail.com"];
    vc2.title = @"Mail";
    UINavigationController* nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
//    nav2.navigationBar.hidden = YES;
    [vc2 release]; vc2 = nil;
    
//    iuViewController* vc3 = [[iuViewController alloc] init];
//    vc3.title = @"Scan";
//    UINavigationController* nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
//    nav3.navigationBar.hidden = YES;
//    [vc3 release]; vc3 = nil;
//    
//    iuViewController* vc4 = [[iuViewController alloc] init];
//    vc4.title = @"Setting";
//    UINavigationController* nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
//    nav4.navigationBar.hidden = YES;
//    [vc4 release]; vc4 = nil;
    
    tabBar = [[UITabBarController alloc] init];
    [tabBar setViewControllers:[NSArray arrayWithObjects:nav1,nav2,/*nav3,nav4,*/nil]];
    
//    [self.navigationController pushViewController:tabBar animated:YES];

    [self.window addSubview:tabBar.view];

    [nav1 release]; nav1 = nil;
    [nav2 release]; nav2 = nil;
//    [nav3 release]; nav3 = nil;
//    [nav4 release]; nav4 = nil;
//    [tabBar release]; tabBar = nil;

    
   // self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [tabBar release];
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
