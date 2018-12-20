//
//  SpecificHeadlineViewController.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/14/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "SpecificHeadlineViewController.h"
#import "CommentsCollectionViewCell.h"

@interface SpecificHeadlineViewController ()

@end

@implementation SpecificHeadlineViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //change depending on the number of comments for that specific article.
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CommentsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.authorLabel.text=@"author";
    cell.commentBody.text=@"commentBody";
    
    //Set the image view to the user image
    [[cell userImage] setImage:[UIImage imageNamed:@"mic_logo"]];
    
    //Make the image circular
    cell.userImage.layer.cornerRadius=cell.userImage.frame.size.width/2;
    cell.userImage.clipsToBounds=YES;
    
    
    // Configure the cell
    
//    cell.layer.borderWidth=3.0f;
//    [[cell imageSport] setImage:[UIImage imageNamed:@"mic_logo"]];
//    
//    [[cell labelSport] setText:[arrayOfSports objectAtIndex:indexPath.item]];
    
    return cell;
}

@end
