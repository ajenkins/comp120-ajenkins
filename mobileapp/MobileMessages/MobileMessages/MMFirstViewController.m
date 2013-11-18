//
//  MMFirstViewController.m
//  MobileMessages
//
//  Created by AJ Jenkins on 11/17/13.
//  Copyright (c) 2013 AJ Jenkins. All rights reserved.
//

#import "MMFirstViewController.h"

@interface MMFirstViewController (){
    NSMutableArray *_objects;
}

@end

@implementation MMFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.messageTableView.dataSource = self;
    [self loadMessages];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshButton:(id)sender {
    [self loadMessages];
}

- (void) loadMessages
{
    NSURL *myURL = [[NSURL alloc]initWithString:@"http://messagehub.herokuapp.com/messages.json"];
    
    NSData *myData = [[NSData alloc]initWithContentsOfURL:myURL];
    
    id myJSON = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *tempMessages = (NSArray *)myJSON;
    NSPredicate *p = [NSPredicate predicateWithFormat:@"active == 1"];
    tempMessages = [tempMessages filteredArrayUsingPredicate:p];
    self.messageArray = [[tempMessages reverseObjectEnumerator] allObjects];
    [self.messageTableView reloadData];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.messageArray count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MessageCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSDictionary *message = [self.messageArray objectAtIndex:indexPath.row];

    [cell.textLabel setText:[message valueForKey:@"content"]];
    [cell.detailTextLabel setText:[message valueForKey:@"username"]];
    return cell;
}

@end
