//
//  FeaturedViewController.m
//  HTRegistrationLogin
//
//  Created by Hermine on 3/19/16.
//  Copyright © 2016 Hermine. All rights reserved.
//

#import "FeaturedViewController.h"
#import "UIViewController+Additions.h"

@interface FeaturedViewController ()
/*- (void)moveViewUp:(CGFloat)keyboardHeight withAnimation:(CGFloat) animationDuration; //implementation is in subclasses
- (void)resetViewToInitialPositionWithAnimation:(CGFloat) animationDuration; //implementation is in subclasses*/
@end

@implementation FeaturedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   /* [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];*/
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/*
- (void)warningAlertofType:(WarningType) warningType {
    NSString *message = @"";
    if (warningType == EmptyFieldWarning) {
        message = @"Please fill in all required fields.";
    } else if (warningType == PasswordsDoNotMatchWarning) {
        message = @"Passwords do not match";
    } else if (warningType == UsernameInUseWarning) {
        message = @"Username is already in use";
    } else if (warningType == IncorrectUserNameOrPassword) {
        message = @"Incorrect username or password";
    } else if (warningType == IncorrectPassword) {
        message = @"Incorrect password";

    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}*/
/*
- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *keyboardInfo = [notification userInfo];
    NSNumber *duration = [keyboardInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    CGRect keyboardFrameRect = [[keyboardInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    [self moveViewUp:keyboardFrameRect.size.height withAnimation:[duration floatValue]];
}

- (void)keyboardWillHide:(NSNotification *)notification {
   NSDictionary *keyboardInfo = [notification userInfo];
    NSNumber *duration = [keyboardInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    [self resetViewToInitialPositionWithAnimation:[duration doubleValue]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)moveViewUp:(CGFloat)keyboardHeight withAnimation:(CGFloat)animationDuration {

}

- (void)resetViewToInitialPositionWithAnimation:(CGFloat) animationDuration {

}
*/
@end
