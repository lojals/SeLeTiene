//
//  ProductDetailViewController.h
//  Se Le Tiene
//
//  Created by Jorge Raul Ovalle Zuleta on 10/5/14.
//  Copyright (c) 2014 Olinguito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailViewController : UIViewController


@property (weak,nonatomic) IBOutlet UIImageView * imgProduct;
@property (weak,nonatomic) IBOutlet UILabel     * lblTitleProduct;
@property (weak,nonatomic) IBOutlet UILabel     * lblUserProduct;
@property (weak,nonatomic) IBOutlet UILabel     * DescProduct;
@property (weak,nonatomic) IBOutlet UIButton    * btnContact;

@property (weak,nonatomic)   IBOutlet UIView      *viewMenu;
@property (strong,nonatomic) IBOutlet UIButton    *btnMen1;
@property (strong,nonatomic) IBOutlet UIButton    *btnMen2;
@property (strong,nonatomic) IBOutlet UIButton    *btnMen3;

@end