//
//  ViewController.m
//  MyTrello
//
//  Created by Belkacem Boughida on 13/07/2016.
//  Copyright © 2016 Belkacem Boughida. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *fullURL = @"https://trello.com/1/authorize?expiration=never&name=My%20Trello&key=7635f29aede44a935fc7eda78d9060c8&response_type=token&scope=read,write";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
    self.webView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    if([self.webView.request.mainDocumentURL isEqual: [NSURL URLWithString:@"https://trello.com/1/token/approve"]]){
        //NSLog(@"Get token");
        self.token = [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('pre')[0].innerText.replace(/\\s/g,'')"];

        [self.webView removeFromSuperview];
        self.webView = nil;
     
        NSString *url1 = @"https://api.trello.com/1/tokens/";
        url1 = [url1 stringByAppendingString:self.token];
        url1 = [url1 stringByAppendingString:@"?key=7635f29aede44a935fc7eda78d9060c8"];
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
                 self.idMember = [greeting objectForKey:@"idMember"];
                 [self performSegueWithIdentifier:@"segue" sender:self];
                 
             }
         }];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    MyTableViewController *myView = [segue destinationViewController];
    [myView setToken:self.token];
    [myView setIdMember:self.idMember];
    
}

@end
