//
//  DescViewController.m
//  MyTrello
//
//  Created by Belkacem Boughida on 15/07/2016.
//  Copyright © 2016 Belkacem Boughida. All rights reserved.
//

#import "DescViewController.h"

@interface DescViewController ()

@property (nonatomic)NSMutableArray *staticArraymembers;

@end

@implementation DescViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url1 = @"https://api.trello.com/1/cards/";
    url1 = [url1 stringByAppendingString:self.descId];
    url1 = [url1 stringByAppendingString:@"?fields=name,idList&members=true&member_fields,username=fullName&key=7635f29aede44a935fc7eda78d9060c8&token="];
    url1 = [url1 stringByAppendingString:self.token];
    NSURL *url = [NSURL URLWithString: url1];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             
             [self setStaticArraymembers:[[NSMutableArray alloc] init]];
             
             for(int i=0; i < [[[greeting valueForKeyPath:@"members"] valueForKeyPath:@"fullName"]   count]; i++)
             {
                 [[self staticArraymembers] addObject:[[greeting valueForKeyPath:@"members"] valueForKeyPath:@"fullName"][i]];
             }
             
             self.Pasmembers = @"Il n'y a pas de membres assignés à cette tache";
             if ([[self.staticArraymembers componentsJoinedByString:@"\n"] length] == 0 )
             {
                 [self.allmembers setText:self.Pasmembers];
             }
             else
             {
                 [self.allmembers setText:[self.staticArraymembers componentsJoinedByString:@"\n"]];
             }
             self.navigationController.navigationBar.topItem.title = self.text;
         }
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Exit:(id)sender {
    exit(0);
}
@end
