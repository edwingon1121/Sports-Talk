//
//  FourmViewController.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/13/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "FourmViewController.h"
#import "CustomFourmTableViewCell.h"

@interface FourmViewController ()

@end

@implementation FourmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.navigationController.navigationBarHidden=YES;
//    self.tabBarController.navigationItem.hidesBackButton=YES;
    
     self.navigationController.navigationBar.backgroundColor= [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomFourmTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.titleLabel.text= @"This is the title.";
    cell.descriptLabel.text= @"This would be the description of fourm.";
    cell.authorLabel.text=@"Jim Bob";
    
    
    return cell;
}



@end
