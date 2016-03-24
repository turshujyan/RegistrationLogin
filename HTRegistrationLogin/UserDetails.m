//
//  UserDetails.m
//  HTRegistrationLogin
//
//  Created by Hermine on 3/19/16.
//  Copyright © 2016 Hermine. All rights reserved.
//

#import "UserDetails.h"

@implementation UserDetails


- (id)initWithFirstName:(NSString *)fName lastName:(NSString *)lName username:(NSString *)username password:(NSString *)password {
    
    self = [super init];
    if (self) {
        self.firstName = fName;
        self.lastName = lName;
        self.username = username;
        self.password = password;
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)decoder {    
    self = [super init];
    if(self) {
        self.firstName = [decoder decodeObjectForKey:@"firstName"];
        self.lastName = [decoder decodeObjectForKey:@"lastName"];
        self.username = [decoder decodeObjectForKey:@"username"];
        self.password = [decoder decodeObjectForKey:@"password"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
   [encoder encodeObject:self.firstName forKey:@"firstName"];
    [encoder encodeObject:self.lastName forKey:@"lastName"];
    [encoder encodeObject:self.username forKey:@"username"];
    [encoder encodeObject:self.password forKey:@"password"];
}
@end
