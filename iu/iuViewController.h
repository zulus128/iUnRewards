//
//  iuViewController.h
//  iu
//
//  Created by вадим on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iuViewController : UIViewController <UIWebViewDelegate> {
    
}

- (id)initWithAddress:(NSString*)url;
- (void)bck;

@property (nonatomic, retain) IBOutlet UIWebView* site;
@property (nonatomic, retain) NSString* surl;

@end
