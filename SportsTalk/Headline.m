//
//  Headline.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/14/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "Headline.h"

@implementation Headline

//Creating a headline
-(instancetype) initWithHeadline: (NSString*) header
                            body: (NSString*) content
                         sportId: (NSString*) sport{
    self= [super init];
    if (self){
        _title=[[NSString alloc] initWithString: header];
        _descript=[[NSString alloc] initWithString:content];
        _sportId=[[NSString alloc] initWithString:sport];
    }
    
    return self;
}



@end
