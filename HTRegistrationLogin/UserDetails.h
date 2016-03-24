//
//  UserDetails.h
//  HTRegistrationLogin
//
//  Created by Hermine on 3/19/16.
//  Copyright © 2016 Hermine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDetails : NSObject <NSCoding>

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;


- (id)initWithFirstName:(NSString *)fName lastName:(NSString *)lName username:(NSString *)username password:(NSString *)password;

@end
