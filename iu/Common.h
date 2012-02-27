//
//  Common.h
//  iUnRewards
//
//  Created by вадим on 11/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iuViewController.h"

#define TEST_STRING @"http://www.uniquerewards.com/cgi-bin/click.cgi?mid="
#define TEST_STRING1 @"http://www.uniquerewards.com/cgi-bin/tsppv.cgi?m="
#define TEST_STRING2 @"http://www.uniquerewards.com/cgi-bin/main.cgi?cmd=confirm&uid="
#define TEST_STRING3 @"http://www.facebook.com/UniqueRewards"
#define TEST_STRING4 @"http://twitter.com"

@interface Common : NSObject

+ (Common*) instance;

- (void)addTab: (NSString*) str;
- (void)removeTab: (iuViewController*) cont;

@property (nonatomic, retain) UITabBarController* tabBar;

@end
