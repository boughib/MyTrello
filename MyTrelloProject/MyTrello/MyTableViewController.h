//
//  MyTableViewController.h
//  MyTrello
//
//  Created by Belkacem Boughida on 13/07/2016.
//  Copyright © 2016 Belkacem Boughida. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ListTableViewController.h"

@interface MyTableViewController : UITableViewController

@property (nonatomic) NSString *token;
@property (nonatomic) NSString *idMember;

- (IBAction)Exit:(id)sender;

@end
