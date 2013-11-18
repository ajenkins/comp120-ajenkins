//
//  MMFirstViewController.h
//  MobileMessages
//
//  Created by AJ Jenkins on 11/17/13.
//  Copyright (c) 2013 AJ Jenkins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMFirstViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *messageTableView;
@property (strong, nonatomic) NSArray *messageArray;

@end
