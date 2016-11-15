//
//  DescViewController.h
//  MyTrello
//
//  Created by Belkacem Boughida on 15/07/2016.
//  Copyright © 2016 Belkacem Boughida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DescViewController : UIViewController

@property (nonatomic)NSString *descId;
@property (nonatomic)NSString *token;
@property (nonatomic)NSString *text;
@property (nonatomic)NSString *Pasmembers;
@property (weak, nonatomic) IBOutlet UITextView *allmembers;

- (IBAction)Exit:(id)sender;

@end
