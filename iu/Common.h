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
//#define TEST_STRING1 @"http://www.uniquerewards.com/cgi-bin/tsppv.cgi?m="
#define TEST_STRING1 @"http://www.uniquerewards.com/cgi-bin/tsppv.cgi?"
#define TEST_STRING2 @"http://www.uniquerewards.com/cgi-bin/main.cgi?cmd=confirm&uid="
//#define TEST_STRING3 @"http://www.facebook.com/UniqueRewards"
#define TEST_STRING3 @"https://www.facebook.com/dialog"
//#define TEST_STRING4 @"http://twitter.com"
#define TEST_STRING4 @"http://twitter.com/uniquerewards"
#define TEST_STRING5 @"http://www.facebook.com/uniquerewards"
#define TEST_STRING6 @"https://www.facebook.com/connect"
#define TEST_STRING7 @"http://www.uniquerewards.com/cgi-bin/main.cgi?cmd=rp_click"

#define CLICK_CASH @"Click Cash Offers"

@interface Common : NSObject {
    
    iuViewController* vc2;
}

+ (Common*) instance;

- (void)addTab: (NSString*) str title:(NSString*) title;
- (void)removeTab: (iuViewController*) cont;
- (void)refrMail;

@property (nonatomic, retain) UITabBarController* tabBar;
@property (nonatomic, retain) NSString* pemail;
//@property (readwrite, assign) BOOL entered;
@property (readwrite, assign) CGRect rect;

@property (nonatomic, retain) NSString* ccurl;

@end
