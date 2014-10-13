//
//  AccountViewController.h
//  Se Le Tiene
//
//  Created by Jorge Raul Ovalle Zuleta on 10/11/14.
//  Copyright (c) 2014 Olinguito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"


@interface AccountViewController : UIViewController <MenuViewDelegate>{
    CATransition *transition;
}
@property (weak, nonatomic) IBOutlet UILabel *lblNameUser;
@property (weak, nonatomic) IBOutlet UIView *contactView;
@property (weak, nonatomic) IBOutlet UILabel *lblPhoneUser;
@property (weak, nonatomic) IBOutlet UILabel *lblCellPhoneUser;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet UIButton *btnLogout;
@property (weak, nonatomic) IBOutlet UIButton *btnFavorites;
@property (weak, nonatomic) IBOutlet UIButton *btnLastOpened;
@property (weak, nonatomic) IBOutlet MenuView *menuView;

@end