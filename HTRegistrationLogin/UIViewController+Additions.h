//
//  UIViewController+AlertsAddition.h
//  HTRegistrationLogin
//
//  Created by Hermine on 3/23/16.
//  Copyright © 2016 Hermine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTButton.h"


typedef enum {
    EmptyFieldWarning,
    UsernamePasswordDoNotMatchWarning,
    PasswordsDoNotMatchWarning,
    UsernameInUseWarning,
    IncorrectPassword,
    IncorrectUserNameOrPassword
    
} WarningType;

@interface UIViewController (Additions)

@property (assign, nonatomic) WarningType warnings;

- (void)warningAlertofType:(WarningType) warningType;
- (void)moveViewUp:(CGFloat)keyboardHeight withAnimation:(CGFloat) animationDuration;
- (void)resetViewToInitialPositionWithAnimation:(CGFloat) animationDuration;
- (void)registerForKeyboardNotifications;
- (void)unRegisterFromKeyboardNotifications;

@end
