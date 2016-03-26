//
//  HTLoginViewController.m
//  HTRegistrationLogin
//
//  Created by Hermine on 3/19/16.
//  Copyright © 2016 Hermine. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistrationViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UISwitch *rememberUser;
@property (weak, nonatomic) IBOutlet HTButton *loginButton;
@property (weak, nonatomic) IBOutlet HTButton *registerButton;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleConstraint;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   if (self.usernameValue && self.passwordValue) {
        self.username.text = self.usernameValue;
        self.password.text = self.passwordValue;
    }
}

- (IBAction)login:(id)sender {
    
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    
    if([username isEqualToString:@""] || [password isEqualToString:@""]) {
        [self warningAlertofType:EmptyFieldWarning];
    } else {
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSData *encodedObject = [userDefaults objectForKey:username];

        if(encodedObject) {
            UserDetails *userInfo = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
            if ([userInfo.password isEqualToString:password]) {
                if([self.rememberUser isOn]) {
                    [userDefaults setObject:self.username.text forKey:@"rememberUser"];
                } else {
                    [userDefaults setObject:nil forKey:@"rememberUser"];
                };
                [userDefaults setObject:self.username.text forKey:@"loggedInUser"];
                HomeViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"homeVC"];
                [vc setUserInfo:userInfo];
                vc.greetingText = @"Welcome back!";

                [self presentViewController:vc animated:YES completion:^{ }];
                
                AppDelegate *appDelegateTemp = [[UIApplication sharedApplication]delegate];
                [appDelegateTemp setViewController:vc];
            } else {
                [self warningAlertofType:IncorrectPassword];
            }
        } else {
            [self warningAlertofType:IncorrectUserNameOrPassword];
        }
    }
    
}

- (void)moveViewUp:(CGFloat)keyboardHeight withAnimation:(CGFloat) animationDuration {
    CGFloat windowHeight = [[UIScreen mainScreen] bounds].size.height;
    self.middleConstraint.active = NO;
    self.topConstraint.active = YES;
    CGFloat contentViewHeight = self.contentView.frame.size.height;
    if ((windowHeight - keyboardHeight) > contentViewHeight) {
        self.topConstraint.constant = ((windowHeight - keyboardHeight) - contentViewHeight)/2;
    } else {
        self.topConstraint.constant =  - (contentViewHeight - (windowHeight - keyboardHeight));

    }
    [UIView animateWithDuration:animationDuration
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
}

- (void)resetViewToInitialPositionWithAnimation:(CGFloat) animationDuration {
    self.topConstraint.active = NO;
    self.middleConstraint.active = YES;
    [UIView animateWithDuration:animationDuration
                     animations:^{
                         [self.view layoutIfNeeded];
    }];
}

@end
