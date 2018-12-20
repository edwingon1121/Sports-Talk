//
//  ScoresViewController.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/13/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "ScoresViewController.h"
#import "CustomScoresTableViewCell.h"

@interface ScoresViewController ()

@end

@implementation ScoresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationController.navigationBar.backgroundColor= [UIColor grayColor];
    self.navigationItem.title=@"Scores";
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//Depends on the number of teams playing
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomScoresTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    //Set the name of teams, scores and time of the game
    
    cell.teamOneLabel.text= @"USC";
    cell.teamTwoLabel.text=@"UCLA";
    cell.scoreOneLabel.text=@"50";
    cell.scoreTwoLabel.text=@"0";
    cell.timeLabel.text=@"3rd 6:34";
    
    return cell;
    
}

@end
