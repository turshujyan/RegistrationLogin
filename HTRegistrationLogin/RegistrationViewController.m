//
//  RegistrationViewController.m
//  HTRegistrationLogin
//
//  Created by Hermine on 3/19/16.
//  Copyright © 2016 Hermine. All rights reserved.
//

#import "RegistrationViewController.h"
#import "HomeViewController.h"
#import "UIViewController+Additions.h"


@interface RegistrationViewController () <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordConfirmationTextField;
@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTextFields];
    self.contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.contentTableView addGestureRecognizer:tap];
}

- (IBAction)cancel:(id)sender {
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registration:(id)sender {
    
    if([self.usernameTextField.text isEqualToString:@""] || [self.passwordTextField.text isEqualToString:@""] || [self.passwordConfirmationTextField.text isEqualToString:@""]) {
        [self warningAlertofType:EmptyFieldWarning];
    } else if (![self.passwordTextField.text  isEqualToString:self.passwordConfirmationTextField.text]) {
        [self warningAlertofType:PasswordsDoNotMatchWarning];
    } else {
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

        if ([userDefaults stringForKey:self.usernameTextField.text] != nil ) {
            [super warningAlertofType:UsernameInUseWarning];
        } else {
            UserDetails *userInfo = [[UserDetails alloc] initWithFirstName:self.firstNameTextField.text
                                                                  lastName:self.lastNameTextField.text
                                                                  username:self.usernameTextField.text
                                                                  password:self.passwordTextField.text];
            NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:userInfo];
            [userDefaults setObject:encodedObject forKey:self.usernameTextField.text];
            [userDefaults setObject:self.usernameTextField.text forKey:@"loggedInUser"];
            
            HomeViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"homeVC"];
            vc.userInfo = userInfo;
            vc.greetingText = @"You have successfully registered!";
            [self presentViewController:vc animated:YES completion:^{
            }];
        }
    }
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.firstNameTextField) {
        [self.lastNameTextField becomeFirstResponder];
    } else if (textField == self.lastNameTextField) {
        [self.usernameTextField becomeFirstResponder];
    } else if (textField == self.usernameTextField) {
        [self.passwordTextField becomeFirstResponder];
    } else if (textField == self.passwordTextField) {
        [self.passwordConfirmationTextField becomeFirstResponder];
    } else if (textField == self.passwordConfirmationTextField) {
        [self registration:self];
    }
    return true;
}

- (void)setupTextFields {
    self.firstNameTextField.delegate = self;
    self.lastNameTextField.delegate = self;
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.passwordConfirmationTextField.delegate = self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    id selectedCell = [[textField superview] superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
    [self.contentTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1
                                        inSection:indexPath.section]
                                 atScrollPosition:UITableViewScrollPositionTop
                                         animated:NO];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer {
    [self.contentTableView endEditing:YES];
    [self.contentTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0
                                                                     inSection:0]
                                 atScrollPosition:UITableViewScrollPositionTop
                                         animated:NO];
}

@end
