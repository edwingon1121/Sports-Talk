//
//  HeadlineManager.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/14/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "HeadlineManager.h"

@implementation HeadlineManager

//Singleton
+(instancetype) sharedHeadlineManagers{
    static HeadlineManager *sharedHeadlineManager =nil;
    
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        sharedHeadlineManager=[[self alloc] init];
        
    });
    
    return sharedHeadlineManager;

}

//Insert of Headlines Collection
-(void) insertWithHeadline: (NSString*) header
                      body: (NSString*) content
                        id: (NSString*) sportsId{
    
    Headline *article= [[Headline alloc] initWithHeadline:header body:content sportId:sportsId];
    
    //add article to total headline array 
    [self.sportsHeadlines addObject:article];
    //Add article to appropriate array for sport
    
}

//Removal of specific titles
-(void) removeHeadlines: (NSString*) sportsId{
    //if the array matches the sportsId remove from the collection and update database
}

//Get all Headlines from API
- (NSArray *) allHeadlines{
    
    //Get all the headlines
    NSArray* headlines= [[NSArray alloc] initWithArray:_sportsHeadlines];
    
    //increment to get new number of headlines
    
    return headlines;
}


//CHANGE LATER TO GET ONLY SPECIFIC HEADLINES

//Sort and return specific headlines from sports Id
-(NSArray *) allHeadlines: (NSString *)sportId{
    //Specific sport loads headlines and returns array
    NSArray* headlines= [[NSArray alloc] initWithArray:_sportsHeadlines];
    
    return headlines;

}

//- (Comment *)getComments: (Headline*) headline;



@end
