//
//  HomeViewController.m
//  HTRegistrationLogin
//
//  Created by Hermine on 3/19/16.
//  Copyright © 2016 Hermine. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *greeting;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.userInfo.username) {
        self.username.text = self.userInfo.username;
    }
    if(self.greetingText ) {
        self.greeting.text = self.greetingText;
    }
}

- (IBAction)logout:(id)sender {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:nil forKey:@"loggedInUser"];
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
    
    AppDelegate *appDelegateTemp = [[UIApplication sharedApplication]delegate];
    [appDelegateTemp resetWindowToLoginView];

}



@end
