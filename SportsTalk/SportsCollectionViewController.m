//
//  SportsCollectionViewController.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/13/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "SportsCollectionViewController.h"
#import "CustomSportsCollectionViewCell.h"
#import "UserManager.h"

@interface SportsCollectionViewController ()

@property (strong,nonatomic) UserManager* sharedUserManager;
@property int num;
@property NSArray *arrayOfSports;


@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation SportsCollectionViewController


static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.backgroundColor= [UIColor grayColor];
    
   
    //Set the dimensions for size of cells and spacing between them
   //CGFloat heightAndWidth= (self.view.frame.size.width)/2 -(32);
    
    _flowLayout.minimumInteritemSpacing=12.0;
    _flowLayout.minimumLineSpacing=24.0;
    
    //_flowLayout.itemSize= CGSizeMake(heightAndWidth, heightAndWidth);
    
    //reference back to the Singleton
    _sharedUserManager=[UserManager sharedManager];
        
    [[self myCollectionView]setDelegate:self];
    [[self myCollectionView]setDataSource:self];
    
    _arrayOfSports =[[NSArray alloc] initWithObjects:@"Sport1",@"Sport2",@"Sport3",@"Sport4",@"Sport5",@"Sport6",nil];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    //Changes depending on the number of sports they wish to see
    
    return sizeof(_sharedUserManager.currentUser.favSports);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomSportsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    cell.layer.borderWidth=3.0f;
   
    
    [[cell imageSport] setImage:[UIImage imageNamed:@"mic_logo"]];
    
    
    //[[cell labelSport] setText:[_arrayOfSports objectAtIndex:indexPath.item]];
    
    [[cell labelSport] setText:[_sharedUserManager.currentUser.favSports objectAtIndex:indexPath.item]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
