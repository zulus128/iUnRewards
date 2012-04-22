//
//  iuViewController.h
//  iu
//
//  Created by вадим on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iuViewController : UIViewController <UIWebViewDelegate> {
    
    BOOL firsttime;
    BOOL removeable;
    BOOL pmail;
    BOOL pclick;
//    UIBarButtonItem* bi;
    UIBarButtonItem *r1;
    UIBarButtonItem *r2;
    UIBarButtonItem *r3;
}

- (id)initWithAddress:(NSString*)url del:(BOOL)del mail:(BOOL)mail clickcash:(BOOL)clickcash;
- (void)bck;
- (void)fwd;
- (void)rfr;
- (void)del;
- (void)refrMail;
- (void)goAddress:(NSString*)str;

@property (nonatomic, retain) IBOutlet UIWebView* site;
@property (nonatomic, retain) NSString* surl;
@property (nonatomic, retain) IBOutlet UILabel* lab;

@end
