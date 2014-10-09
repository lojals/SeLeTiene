//
//  RegisterViewController.m
//  Se Le Tiene
//
//  Created by Jorge Raul Ovalle Zuleta on 10/7/14.
//  Copyright (c) 2014 Olinguito. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize txtConfPass,txtEmail,txtName,txtPass,txtPhone,btnSignUp;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    
    sH = [[UIScreen mainScreen] bounds].size.height;
    
    txtName.layer.borderColor = [UIColor lightGrayColor].CGColor;
    txtName.layer.cornerRadius = 5.0f;
    txtName.layer.borderWidth = 2.0f;
    txtName.leftView = paddingView;
    txtName.leftViewMode = UITextFieldViewModeAlways;
    txtName.layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    txtEmail.layer.borderColor = [UIColor lightGrayColor].CGColor;
    txtEmail.layer.cornerRadius = 5.0f;
    txtEmail.layer.borderWidth = 2.0f;
    txtEmail.leftView = paddingView;
    txtEmail.leftViewMode = UITextFieldViewModeAlways;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    txtEmail.layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    
    txtPhone.layer.borderColor = [UIColor lightGrayColor].CGColor;
    txtPhone.layer.cornerRadius = 5.0f;
    txtPhone.layer.borderWidth = 2.0f;
    txtPhone.leftView = paddingView;
    txtPhone.leftViewMode = UITextFieldViewModeAlways;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    txtPhone.layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    txtPass.layer.borderColor = [UIColor lightGrayColor].CGColor;
    txtPass.layer.cornerRadius = 5.0f;
    txtPass.layer.borderWidth = 2.0f;
    txtPass.leftView = paddingView;
    txtPass.leftViewMode = UITextFieldViewModeAlways;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    txtPass.layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    txtConfPass.layer.borderColor = [UIColor lightGrayColor].CGColor;
    txtConfPass.layer.cornerRadius = 5.0f;
    txtConfPass.layer.borderWidth = 2.0f;
    txtConfPass.leftView = paddingView;
    txtConfPass.leftViewMode = UITextFieldViewModeAlways;
    txtConfPass.layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    btnSignUp.layer.cornerRadius = 5.0f;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
}



// Text METHODS DELEGATE

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtConfPass resignFirstResponder];
    [txtEmail resignFirstResponder];
    [txtName resignFirstResponder];
    [txtPass resignFirstResponder];
    [txtPhone resignFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
}


- (void)keyboardWillHide:(NSNotification *)aNotification
{
    NSTimeInterval animationDuration =
    [[[aNotification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect frame = self.view.frame;
    frame.origin.y = 64;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    textField.layer.borderColor = [UIColor colorWithRed:0.039 green:0.337 blue:0.643 alpha:1].CGColor;
    yPos = textField.frame.origin.y;
    CGRect frame = self.view.frame;
    if(dev ==1 && yPos >= (sH - 328) - 50){
        frame.origin.y = 160;
    }else{
        if (dev ==2 && yPos >= (sH - 280) - 40 ) {
            frame.origin.y = -(yPos - ((sH - 216) - 60));
        }
    }
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:0.25];
    self.view.frame = frame;
    [UIView commitAnimations];
}

@end