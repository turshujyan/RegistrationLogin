//
//  RegistrationViewController.m
//  HTRegistrationLogin
//
//  Created by Hermine on 3/19/16.
//  Copyright © 2016 Hermine. All rights reserved.
//

#import "RegistrationViewController.h"
#import "HomeViewController.h"
#import "RegistrationFormCell.h"

static NSString *TableViewCellIdentifier = @"formCell";

@interface RegistrationViewController () <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewBottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewMiddleConstraint;
@property (nonatomic, strong) NSArray *placeholders;

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.placeholders = @[@"first name", @"last name", @"username *", @"password *", @"re-type password *"];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.tableView addGestureRecognizer:tap];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}

- (IBAction)cancel:(id)sender {
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registration:(id)sender {
    
    NSMutableDictionary *filledForm = [[NSMutableDictionary alloc] init];
    NSArray *keys = @[@"firstName", @"lastName", @"username", @"password", @"passwordConfirmation"];
    
    for ( NSInteger i = 0; i < [self.placeholders count]; i++ ) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        RegistrationFormCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        NSString *textFieldValue = cell.textField.text;
        [filledForm setValue:textFieldValue forKey:keys[i]];
    }
    
    if([[filledForm objectForKey:@"username"] isEqualToString:@""] ||
       [[filledForm objectForKey:@"password"] isEqualToString:@""] ||
       [[filledForm objectForKey:@"passwordConfirmation"] isEqualToString:@""]) {
        [self warningAlertofType:EmptyFieldWarning];
    } else if (![[filledForm objectForKey:@"password"]  isEqualToString:[filledForm objectForKey:@"passwordConfirmation"]]) {
        [self warningAlertofType:PasswordsDoNotMatchWarning];
    } else {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

        if ([userDefaults stringForKey:[filledForm objectForKey:@"username"]] != nil ) {
            [super warningAlertofType:UsernameInUseWarning];
        } else {
            UserDetails *userInfo = [[UserDetails alloc] initWithFirstName:[filledForm objectForKey:@"firstName"]
                                                                  lastName:[filledForm objectForKey:@"lastName"]
                                                                  username:[filledForm objectForKey:@"username"]
                                                                  password:[filledForm objectForKey:@"password"]];
            NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:userInfo];
            [userDefaults setObject:encodedObject forKey:[filledForm objectForKey:@"username"]];
            [userDefaults setObject:[filledForm objectForKey:@"username"] forKey:@"loggedInUser"];
            
            HomeViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"homeVC"];
            vc.userInfo = userInfo;
            vc.greetingText = @"You have successfully registered!";
            [self presentViewController:vc animated:YES completion:^{
            }];
        }
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    id selectedCell = [[textField superview] superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1
                                        inSection:indexPath.section]
                                 atScrollPosition:UITableViewScrollPositionTop
                                         animated:NO];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer {
    [self.tableView endEditing:YES];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0
                                                                     inSection:0]
                                 atScrollPosition:UITableViewScrollPositionTop
                                         animated:NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.placeholders count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RegistrationFormCell *cell = [self.tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier
                                                                      forIndexPath:indexPath];
    
    cell.textField.placeholder = self.placeholders[indexPath.row];
    if (indexPath.row == 3 || indexPath.row == 4) {
        cell.textField.secureTextEntry = YES;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
}
- (void)moveViewUp:(CGFloat)keyboardHeight withAnimation:(CGFloat)animationDuration {
    CGFloat windowHeight = [[UIScreen mainScreen] bounds].size.height;
    self.contentViewMiddleConstraint.active = NO;
    self.contentViewBottomConstraint.active = YES;
    CGFloat contentViewHeight = self.tableView.superview.frame.size.height;
    if ((windowHeight - keyboardHeight) > contentViewHeight) {
        self.contentViewBottomConstraint.constant = keyboardHeight + ((windowHeight - keyboardHeight) - contentViewHeight)/2;
    } else {
        self.contentViewBottomConstraint.constant =  keyboardHeight;
        
    }
    [UIView animateWithDuration:animationDuration
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
}

- (void)resetViewToInitialPositionWithAnimation:(CGFloat) animationDuration {
    self.contentViewBottomConstraint.active = NO;
    self.contentViewMiddleConstraint.active = YES;
    [UIView animateWithDuration:animationDuration
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
}


@end
