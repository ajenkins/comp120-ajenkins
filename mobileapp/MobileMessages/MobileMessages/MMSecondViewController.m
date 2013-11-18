//
//  MMSecondViewController.m
//  MobileMessages
//
//  Created by AJ Jenkins on 11/17/13.
//  Copyright (c) 2013 AJ Jenkins. All rights reserved.
//

#import "MMSecondViewController.h"
#import "MMFirstViewController.h"

@interface MMSecondViewController ()

@end

@implementation MMSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendButtonPressed:(id)sender {
    NSString *content = [[self content] text];
    NSString *username = [[self username] text];
    [self sendMessageWithUsername:username AndContent:content];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    
    if (![[touch view] isKindOfClass:[UITextField class]]) {
        [self.view endEditing:YES];
    }
    [super touchesBegan:touches withEvent:event];
}

- (void)sendMessageWithUsername:(NSString *)username AndContent:(NSString *)content
{
    NSString *post = [NSString stringWithFormat:@"message[app_id]=1&message[username]=%@&message[content]=%@", username, content];
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding];
    NSString *urlAsString = @"http://messagehub.herokuapp.com/messages.json";
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:30.0f];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *error) {
                               if (error == nil) {
                                   // Give feedback that POST was successfully sent
                                   NSLog(@"POST request sent successfully");
                               }
                               else {
                                   // Something went wrong
                                   NSLog(@"POST request failed");
                               }
                           }];
    [[self messageSentLabel] setAlpha:1.0];
    [self fadeOutMessageSent];
    
}

- (void) fadeOutMessageSent
{
    [UIView animateWithDuration:1.0
                          delay:1.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^ {
                         self.messageSentLabel.alpha = 0.0;
                     }
                     completion:nil];
}

@end
