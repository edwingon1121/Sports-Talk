//
//  SpecificScoreViewController.h
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/14/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecificScoreViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamOne;
@property (weak, nonatomic) IBOutlet UILabel *teamTwo;
@property (weak, nonatomic) IBOutlet UILabel *oneScore;
@property (weak, nonatomic) IBOutlet UILabel *twoScore;

@end
