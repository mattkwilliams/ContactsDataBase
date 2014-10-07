//
//  ViewController.m
//  ContactsDataBase
//
//  Created by Matt Williams on 10/6/14.
//  Copyright (c) 2014 Matt Williams. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSave:(id)sender {
    
    AppDelegate *appDelegate = [ [UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSManagedObject *newContact;
    
    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];
    
    [newContact setValue: self.txtFullName.text forKey:@"fullname"];
    [newContact setValue: self.txtEmail.text forKey:@"email"];
    [newContact setValue: self.txtPhone.text forKey:@"phone"];
    
    self.txtFullName.text = @"";
    self.txtEmail.text = @"";
    self.txtPhone.text = @"";
    
    NSError *error;
    
    [context save:&error];
    self.lblStatus.text = @"Contact saved.";
    
}

- (IBAction)btnFind:(id)sender {
    
    AppDelegate *appDelegate = [ [UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(fullname CONTAINS[cd] %@)", self.txtFullName.text];
    
    [request setPredicate:pred];
    
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if ([objects count] == 0) {
        self.lblStatus.text = @"No Matches";
    } else {
        matches = objects[0];
        self.txtFullName.text = [matches valueForKey:@"fullname"];
        self.txtEmail.text = [matches valueForKey:@"email"];
        self.txtPhone.text = [matches valueForKey:@"phone"];
        self.lblStatus.text = [NSString stringWithFormat:@"%lu matches found", (unsigned long)[objects count]];
        
    }
    
}
@end




