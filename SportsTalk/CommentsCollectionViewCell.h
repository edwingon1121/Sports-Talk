//
//  CommentsCollectionViewCell.h
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/14/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentBody;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;

@end
