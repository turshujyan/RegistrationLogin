//
//  AppDelegate.h
//  HTRegistrationLogin
//
//  Created by Hermine on 3/19/16.
//  Copyright © 2016 Hermine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)resetWindowToLoginView;
- (void)setViewController:(UIViewController *)vc;

@end

