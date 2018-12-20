//
//  CustomFourmTableViewCell.h
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/13/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomFourmTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UIImageView *typeFormImageView;


@end
