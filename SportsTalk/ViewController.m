//
//  ViewController.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 11/25/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "ViewController.h"
#import "UserManager.h"
@import FirebaseDatabase;



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webViewBG;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (strong, nonatomic) UserManager* sharedUserManager;
@property(strong,nonatomic) FIRDatabaseReference *ref;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Reference to the files within the mainBundle
    NSString *filePath= [[NSBundle mainBundle] pathForResource:@"basketball2" ofType:@"gif"];
    
    //Allocate and initialize the filepath(NString) to be convert into NSData to pass into webView
    NSData *gif=[[NSData alloc] initWithContentsOfFile:filePath];
    
 
    //Load the gif into webView container
    [self.webViewBG loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    
    //No user interaction is permitted to the UIWebView
    self.webViewBG.userInteractionEnabled=NO;
    
     _sharedUserManager=[UserManager sharedManager];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)touchedEmailTextField:(UITextField *)sender {
    //resign email text field if done is hit
    [sender resignFirstResponder];
}

- (IBAction)touchedPasswordField:(UITextField *)sender {
    
    [sender resignFirstResponder];
}

- (IBAction)didTouchLogin:(id)sender {
}

//When sign up button clicked then launch sign up page
- (IBAction)didTapSignUp:(id)sender {
    
}

- (IBAction)didTapBackgroundButton:(id)sender {
    
    //Loop through view and resign first responder when background button clicked
    for (UIView *view in self.view.subviews){
        
        if ([view isFirstResponder]){
            [view resignFirstResponder];
        }
    }

        
}
- (IBAction)didTapLoginButton:(id)sender {

    [[FIRAuth auth] signInWithEmail:_emailField.text
                           password:_passwordField.text
                         completion:^(FIRUser *user, NSError *error) {
                             
                             if (user!=nil){
                                 
                                 //Load current User
                                 [self.sharedUserManager currentUser:user.uid];
                                 
                                 //perform the segue to present the users collection
                                 [self performSegueWithIdentifier:@"SportsCollection" sender:self];
                                 
                             }
                             
                             else{
                                 //Display error and ask user to fix email or password
                                 //Create alert controller and alert action to be added
                                 UIAlertController *alertController =[UIAlertController alertControllerWithTitle:@"Invaild User" message:@"Check user and password." preferredStyle:UIAlertControllerStyleAlert];
                                 
                                 UIAlertAction *okAction= [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
                                     NSLog(@"You've tapped ok.");
                                 }];
                                 
                                 //adding action to alertController and present to current viewController
                                 [alertController addAction:okAction];
                                 [self presentViewController:alertController animated:YES completion:nil];

                             }
                         }];
}

@end
