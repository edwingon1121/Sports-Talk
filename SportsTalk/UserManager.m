//
//  UserManager.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/14/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "UserManager.h"
@import FirebaseAuth;

@implementation UserManager

//Mediator between Users


//Creating Singleton
+(instancetype) sharedManager{
    static UserManager *sharedUserManager =nil;
    
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        sharedUserManager=[[self alloc] init];
        
    });
    
    return sharedUserManager;
    
}

//Accessing User
-(User* ) currentUser: (NSString *) userId{
    
//    //Get reference to authorized userID
//   NSString* userID =[FIRAuth auth].currentUser.uid;
    
    //Setting reference to the database    
    self.ref = [[FIRDatabase database] reference];

    //Reference to specfic user node and ask to take snapshot
     [[[_ref child:@"Users"] child:userId] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSDictionary *postDict = snapshot.value;
             NSLog(@"%@",postDict);
         
          NSString * num= [postDict valueForKey:@"Number of Comments"];
         
         User * user = [[User alloc] initWithFirstname: [postDict objectForKey:@"First Name"]
                                              lastName:[postDict valueForKey:@"Last Name"]
                                                 image:[postDict valueForKey:@"image"]
                                             favSports:[postDict valueForKey:@"Favorite Sports"]
                                      numberOfComments: num.intValue];
         
         self.currentUser=user;

         
    }];
    
    return _currentUser;
}

@end
