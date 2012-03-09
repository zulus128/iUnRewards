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
    UIBarButtonItem* bi;
}

- (id)initWithAddress:(NSString*)url del:(BOOL)del mail:(BOOL)mail;
- (void)bck;
- (void)del;
- (void)refrMail;

@property (nonatomic, retain) IBOutlet UIWebView* site;
@property (nonatomic, retain) NSString* surl;

@end
