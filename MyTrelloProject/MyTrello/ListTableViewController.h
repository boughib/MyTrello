//
//  ListTableViewController.h
//  MyTrello
//
//  Created by Belkacem Boughida on 13/07/2016.
//  Copyright © 2016 Belkacem Boughida. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "CardTableViewController.h"

@interface ListTableViewController : UITableViewController

@property (nonatomic)NSString *boardId;
@property (nonatomic)NSString *token;
@property (nonatomic)NSString *text;

- (IBAction)Exit:(id)sender;

@end
