//
//  SportsSelectionViewController.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/16/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "SportsSelectionViewController.h"
#import "UserManager.h"


@interface SportsSelectionViewController ()

@property (strong, nonatomic) UserManager* sharedUserManager;
@property NSArray *sports;
@property NSMutableArray* choosen;


@end

@implementation SportsSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //Allocate and initalize array with sports
    _sports= [[NSArray alloc] initWithObjects:@"NFL",@"NHL",@"MLS Soccer", @"Rugby",@"NCCA Football",@"La Liga",@"NCCA Basketball",@"Table Tennis",nil];
    
    //reference back to the Singleton
    _sharedUserManager=[UserManager sharedManager];
    
    //intialize array to stores sports selected by the user
    _choosen = [[NSMutableArray alloc] initWithArray: _sharedUserManager.currentUser.favSports];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //populate the cell with a specific sports
    cell.textLabel.text=_sports[indexPath.item];

    return cell;
}

//Marking selected cells for sports
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //reference to the cell selected
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    
    //Marking the cells to note which are being favored
    if (cell.accessoryType==UITableViewCellAccessoryNone){
    //setting a checkmark to the right of the row to indiate selected
        cell.accessoryType= UITableViewCellAccessoryCheckmark;
        
        //add sport to user array of sports
        [_choosen addObject:cell.textLabel.text];
    }
    
    //Removing checkmark if already clicked
    else{
        cell.accessoryType=UITableViewCellAccessoryNone;
        
        //remove the sport if deselected
        for (int i=0; i<sizeof(_sports); i++) {
            if (cell.textLabel.text== _choosen[i]){
                [_choosen removeObjectAtIndex:i];
                i=sizeof(_sports);
            }
        }
        
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}

- (IBAction)didTouchFinishButton:(id)sender {
    //Add all the headlines to the database and manage
    
    if (sizeof(_choosen)!=0){
       
       //set the favorite sports equal to the sports choosen
        [self.sharedUserManager.currentUser setFavSports: self.choosen];
        
        //reference to https://sportstalk-c945b.firebaseio.com/

       NSString* user= [FIRAuth auth].currentUser.uid;
        

        //Call function to save sports
        [self.sharedUserManager.currentUser saveSports: self.sharedUserManager.currentUser userReference:user];
        
        //Go back to the login page
        [self performSegueWithIdentifier:@"BackToLogin" sender:self];
        
    }
    
    else{
        UIAlertController *alertController =[UIAlertController alertControllerWithTitle:@"Choose Sports" message:@"Please select sports you wish to be displayed." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction= [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
            NSLog(@"You've tapped ok.");
            
        }];
        
        //add action to the alertController and add animation to the current view contorller
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];

    }
    
    
}



@end
