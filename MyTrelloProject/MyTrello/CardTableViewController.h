//
//  CardTableViewController.h
//  MyTrello
//
//  Created by Belkacem Boughida on 14/07/2016.
//  Copyright © 2016 Belkacem Boughida. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "DescViewController.h"

@interface CardTableViewController : UITableViewController

@property (nonatomic)NSString *cardId;
@property (nonatomic)NSString *token;
@property (nonatomic)NSString *text;

- (IBAction)Exit:(id)sender;

@end
