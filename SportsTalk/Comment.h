//
//  Comment.h
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/17/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Headline.h"

@interface Comment : NSObject

@property (nonatomic, strong) User* user;
@property (nonatomic, strong) NSString* content;
@property (nonatomic, strong) Headline* reference;



@end
