//
//  HeadlineManager.h
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/14/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Headline.h"
#import "Comment.h"

@interface HeadlineManager : NSObject

//Mediator between Headline objects
@property int numberOfheadlines;

//Array of Array of specific Sportsheadlines
@property NSMutableArray * sportsHeadlines;


//Singleton
+(instancetype) sharedHeadlineManagers;

//Insert of Headlines Collection
-(void) insertWithHeadline: (NSString*) title
                      body: (NSString*) content
                        id: (NSString*) sportsId;

//Removal of specific titles
-(void) removeHeadlines: (NSString*) sportsId;

//Get all Headlines from API
- (NSArray *) allHeadlines;

//Sort and return specific headlines from sports Id
-(NSArray *) allHeadlines: (NSString *)sportId;


//- (Comment *)getComments: (Headline*) headline;

@end
