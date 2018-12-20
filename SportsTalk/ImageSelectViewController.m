//
//  ImageSelectViewController.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/13/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "ImageSelectViewController.h"

@interface ImageSelectViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageView.layer.cornerRadius= self.imageView.frame.size.width/2;
    self.imageView.clipsToBounds=YES;
    
    
}
- (IBAction)chooseImagePressed:(UIButton *)sender {
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    
    picker.delegate=self;
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *orignalImage=info[UIImagePickerControllerOriginalImage];
    //UIImage *editedImage=info[UIImagePickerControllerEditedImage];
    
    self.imageView.image=orignalImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)didTouchNextButton:(id)sender {
    
    //Save the image from the image view if user selects image
    if (_imageView !=nil){
        [self saveImage:_imageView.image];
        
    }
    //Set the user profile to the mic logo
    else{
        [self saveImage: [UIImage imageNamed:@"mic_logo"]];
    }
}

//Save image selected in Document directory to later be referenced
- (void)saveImage: (UIImage*)image
{
    if (image != nil)
    {
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
//                                                             NSUserDomainMask, YES);
//        //Reference to our documents directory first element
//        NSString *documentsDirectory = [paths objectAtIndex:0];
//        NSString* path = [documentsDirectory stringByAppendingPathComponent:
//                          @"test.png"];
//        NSData* data = UIImagePNGRepresentation(image);
//        [data writeToFile:path atomically:YES];
    }
}






@end
