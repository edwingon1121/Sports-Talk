//
//  SpecificScoreViewController.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/14/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "SpecificScoreViewController.h"
#import "CommentsCollectionViewCell.h"

@interface SpecificScoreViewController ()

@end

@implementation SpecificScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.navigationItem.backBarButtonItem.title=@"Scores";
    // Do any additional setup after loading the view.
    
    
    
    //load the time, teams and scores
    _timeLabel.text=@"Final";
    _teamOne.text=@"USC";
    _teamTwo.text=@"UCLA";
    _oneScore.text=@"50";
    _twoScore.text=@"0";
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //change depending on number of comments on specific score
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CommentsCollectionViewCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier: @"Cell" forIndexPath:indexPath];
    
    // set each cell's author, comment body and image of the user
    [[cell userImage] setImage:[UIImage imageNamed:@"mic_logo"]];
    
    cell.authorLabel.text=@"author";
    cell.commentBody.text=@"This is amazing.";
    
    
    return cell;
}

@end
