//
//  User.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/14/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "User.h"
@import FirebaseAuth;
@import FirebaseDatabase;

@implementation User

//initialize user
-(instancetype) initWithFirstname: (NSString*) fName
                         lastName: (NSString*) lName
                            image: (NSString*) imageName
                        favSports: (NSMutableArray*) sportsArray
                 numberOfComments: (int) numComments{
   
    self=[super init];
    if (self){
        _firstName=[[NSString alloc]initWithString:fName];
        _lastName=[[NSString alloc] initWithString:lName];
        _image=[[NSString alloc]initWithString:imageName];
        _favSports=[[NSMutableArray alloc]initWithArray:sportsArray];
        _numberOfComments= numComments;
    }
    
    return self;
}

//Adding Comment to add to number of comments
-(void) AddComment{
    
    _numberOfComments+=_numberOfComments;
}

//Adding to array of sports
-(void) AddSports:(NSString*) sport{
    
    [self.favSports addObject:sport];
}

//Saves user to Firebase
-(void) saveUser:(User *) inputUser fireBaseUserRef:(NSString*) currentUser {
    
    self.ref =[[FIRDatabase database] reference];
    
    [[[_ref child:@"Users"] child:currentUser] setValue:@{@"First Name": inputUser.firstName }];
    
    [[[[_ref child:@"Users"] child:currentUser] child:@"Last Name"] setValue: inputUser.lastName];
    
    [[[[_ref child:@"Users"] child:currentUser] child:@"image"] setValue: inputUser.image];
    
    //[[[[_ref child:@"Users"] child:currentUser] child:@"Favorite Sports"] setValue: inputUser.sports];
    
    NSString *conversion= [NSString stringWithFormat:@"%i", inputUser.numberOfComments];
    
    [[[[_ref child:@"Users"] child:currentUser] child:@"Number of Comments"] setValue: conversion];
}


//Saing just sports to database
-(void) saveSports:(User *) currentUser userReference:(NSString *) uid{
    
    self.ref= [[FIRDatabase database] reference];
    
    [[[[_ref child:@"Users"] child:uid] child:@"Favorite Sports"] setValue: currentUser.favSports];
    
}
@end
