//
//  ViewController.h
//  ContactsDataBase
//
//  Created by Matt Williams on 10/6/14.
//  Copyright (c) 2014 Matt Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtFullName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

- (IBAction)btnSave:(id)sender;
- (IBAction)btnFind:(id)sender;


@end

