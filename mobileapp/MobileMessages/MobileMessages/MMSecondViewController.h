//
//  MMSecondViewController.h
//  MobileMessages
//
//  Created by AJ Jenkins on 11/17/13.
//  Copyright (c) 2013 AJ Jenkins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMSecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextView *content;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UILabel *messageSentLabel;

@end
