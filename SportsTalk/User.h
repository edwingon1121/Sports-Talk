//
//  User.h
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/14/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
@import FirebaseDatabase;
@import FirebaseAuth;

@interface User : NSObject

@property (strong,nonatomic) NSString *firstName;
@property (strong,nonatomic) NSString *lastName;
@property (strong,nonatomic) NSString *image;
@property (strong,nonatomic) NSMutableArray *favSports;
@property int numberOfComments;

@property (strong, nonatomic) FIRDatabaseReference *ref;



//initialize user and set contents if user exists in database
-(instancetype) initWithFirstname: (NSString*) fName
                            lastName: (NSString*) lName
                         image: (NSString*) imageName
                        favSports: (NSMutableArray*) sportsArray
                 numberOfComments: (int) numComments;

//Adding Comment to add to number of comments
-(void) AddComment;

//Adding to array of sports
-(void) AddSports:(NSString*) sport;

//Saves user to Firebase
-(void) saveUser:(User *) inputUser fireBaseUserRef:(NSString*) currentUser;

//Saing just sports to database
-(void) saveSports:(User *) currentUser userReference:(NSString *) uid;

@end
