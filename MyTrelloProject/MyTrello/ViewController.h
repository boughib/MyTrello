//
//  ViewController.h
//  MyTrello
//
//  Created by Belkacem Boughida on 13/07/2016.
//  Copyright © 2016 Belkacem Boughida. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "MyTableViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic) NSString *token;
@property (nonatomic) NSString *idMember;

@end

