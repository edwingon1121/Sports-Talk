//
//  CustomScoresTableViewCell.h
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/13/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomScoresTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreTwoLabel;




@end
