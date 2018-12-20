//
//  SignUpViewController.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/13/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "SignUpViewController.h"
#import "UserManager.h"

@import FirebaseAuth;
@import FirebaseDatabase;


@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *retypePasswordTextField;

@property (strong,nonatomic) UserManager* sharedUserManager;
@property (strong, nonatomic) FIRDatabaseReference *ref;


@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _sharedUserManager=[UserManager sharedManager];
    
    //intialize Firebase DataBase and create a reference
    self.ref = [[FIRDatabase database] reference];
    
    
}

//Resign first responder depending on the text field clicked
- (IBAction)firstNameClicked:(UITextField *)sender {
    [sender resignFirstResponder];
}

- (IBAction)lastNameClicked:(UITextField *)sender {
    [sender resignFirstResponder];
}
- (IBAction)emailDidClick:(UITextField *)sender {
    [sender resignFirstResponder];
}

- (IBAction)passwordDidClick:(UITextField *)sender {
    [sender resignFirstResponder];
}

- (IBAction)retypeDidClick:(UITextField *)sender {
    [sender resignFirstResponder];
}

- (IBAction)didClickBackgroundButton:(id)sender {
    
    //resign firstresponders
    for (UIView *view in self.view.subviews){
        
        if ([view isFirstResponder]){
            [view resignFirstResponder];
            
            //Check if the password and email are filled
        }
        
    }
    
}


- (IBAction)didClickNextButton:(id)sender {
    
    NSString* email= _emailTextField.text;
    NSString* password = _passwordTextField.text;
    
    NSString* retypePassword =_retypePasswordTextField.text;
    
    
    //If the fields are all correctly filled create a user
    if (email.length!=0 && password==retypePassword){
    
    
    [[FIRAuth auth] createUserWithEmail:email
                               password:password
                             completion:^(FIRUser *user, NSError *error) {
                                 //Reference to specific user id (Used in Firebase)
                                 NSString* str= user.uid;
                                 
                                 if (user!=nil){
                                     
                                     //Create the new user and send information to the database
                                     NSMutableArray* sports=[[NSMutableArray alloc]init];
                                     
                                     //allocate and initalize new user
                                     User* newUser= [[User alloc]initWithFirstname:_firstNameTextField.text lastName:_lastNameTextField.text image:@"mic_logo" favSports:sports numberOfComments:0];
                            

                                     //reference to method in User to save data
                                     [newUser saveUser:newUser fireBaseUserRef:str];
                                     
                                    
                                     //perform Segue and continue to the image selection collection
                                     [self performSegueWithIdentifier:@"imageSelect" sender:self];
                                     
                                 }
                                 else{
                                     //Do not let the user move on and ask for email
                                     NSLog(@"Error: %@" , error.userInfo);
                                 }
                             }];
        
    }
    
    else {
        //Create alert controller and alert action to be added
        UIAlertController *alertController =[UIAlertController alertControllerWithTitle:@"Invaild input" message:@"Check valid email and passwords match." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction= [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
            NSLog(@"You've tapped ok.");
            
        }];
        
        //add action to the alertController and add animation to the current view contorller
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
}



@end
