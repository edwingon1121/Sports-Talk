//
//  Headline.h
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/14/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Headline : NSObject

@property (readonly) NSString *title;
@property (readonly) NSString *descript;
@property (readonly) NSString *image;
@property (readonly) NSString *sportId;


//Creating a headline
-(instancetype) initWithHeadline: (NSString*) header
                            body: (NSString*) content
                         sportId: (NSString*) sport;



@end
