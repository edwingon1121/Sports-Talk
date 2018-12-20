//
//  UserManager.h
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/14/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@import FirebaseDatabase;

@interface UserManager : NSObject

@property (strong,nonatomic) User *currentUser;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong,nonatomic) FIRDatabaseReference *refHandle;


//Creating Singleton
+(instancetype) sharedManager;

//Accessing User
-(User* ) currentUser: (NSString *) userId;


@end
