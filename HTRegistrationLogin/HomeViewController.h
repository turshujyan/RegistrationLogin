//
//  HomeViewController.h
//  HTRegistrationLogin
//
//  Created by Hermine on 3/19/16.
//  Copyright © 2016 Hermine. All rights reserved.
//

#import "UserDetails.h"
#import <UIKit/UIKit.h>


@interface HomeViewController : UIViewController

@property (nonatomic, strong) UserDetails *userInfo;
@property (nonatomic, strong) NSString *greetingText;

@end
