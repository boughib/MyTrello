//
//  ListTableViewController.m
//  MyTrello
//
//  Created by Belkacem Boughida on 13/07/2016.
//  Copyright © 2016 Belkacem Boughida. All rights reserved.
//

#import "ListTableViewController.h"

@interface ListTableViewController ()

@property (nonatomic)NSMutableArray *staticarray;
@property (nonatomic)NSMutableArray *staticArrayId;

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url1 = @"https://api.trello.com/1/boards/";
    url1 = [url1 stringByAppendingString:self.boardId];
    url1 = [url1 stringByAppendingString:@"/lists?key=7635f29aede44a935fc7eda78d9060c8&token="];
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
             
             [self setStaticarray:[[NSMutableArray alloc] init]];
             [self setStaticArrayId:[[NSMutableArray alloc] init]];
             
             for(int i=0; i < greeting.count; i++)
             {
                 [[self staticArrayId] addObject:[greeting valueForKeyPath:@"id"][i]];
                 [[self staticarray] addObject:[greeting valueForKeyPath:@"name"][i]];
             }
             [self.tableView reloadData];
             
             self.navigationController.navigationBar.topItem.title = self.text;
         }
     }];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [[self staticarray] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"listcell" forIndexPath:indexPath];
    
    NSString *tmp = [[self staticarray] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:tmp];
    cell.tag = [indexPath row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    CardTableViewController *view = [segue destinationViewController];
    
    UITableViewCell *srcCell = sender;
    NSInteger index = [srcCell tag];
    
    NSString *valCell = [srcCell text];
    NSString *id = [[self staticArrayId] objectAtIndex:index];
    
    [view setText:valCell];
    [view setCardId:id];
    [view setToken:self.token];
    
}

- (IBAction)Exit:(id)sender {
    exit(0);
}

@end
