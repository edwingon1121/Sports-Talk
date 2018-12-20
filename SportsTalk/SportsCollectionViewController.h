//
//  SportsCollectionViewController.h
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/13/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SportsCollectionViewController : UICollectionViewController <UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;



@end
