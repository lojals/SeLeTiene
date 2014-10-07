//
//  OfferProViewController.m
//  Se Le Tiene
//
//  Created by Jorge Raul Ovalle Zuleta on 10/6/14.
//  Copyright (c) 2014 Olinguito. All rights reserved.
//

#import "OfferProViewController.h"

@interface OfferProViewController ()

@end

@implementation OfferProViewController
@synthesize btnAddPic,imgProduct,txtDesc,imagePicker,btnSetType;


- (void)viewDidLoad {
    [super viewDidLoad];
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    imagePicker.showsCameraControls = YES;
    
    
    imgProduct.layer.masksToBounds = YES;
     
    btnAddPic.layer.cornerRadius = btnAddPic.bounds.size.height/2;
    btnAddPic.layer.borderColor = [UIColor whiteColor].CGColor;
    btnAddPic.layer.borderWidth = 2.0f;
    btnAddPic.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0];
    
    btnAddPic.titleLabel.numberOfLines = 2;
    btnAddPic.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    btnAddPic.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    btnSetType.layer.cornerRadius = 0;
    btnSetType.layer.borderColor = [UIColor colorWithRed:0.553 green:0.557 blue:0.592 alpha:1].CGColor;
    btnSetType.layer.borderWidth = 0.5f;
    
    txtDesc.layer.cornerRadius = 0;
    txtDesc.layer.borderColor = [UIColor colorWithRed:0.553 green:0.557 blue:0.592 alpha:1].CGColor;
    txtDesc.layer.borderWidth = 0.5f;
    txtDesc.delegate = self;
    //txtDesc.contentInset = UIEdgeInsetsMake(15,58,0,95);
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
    
}

- (IBAction)takePic:(id)sender {
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image1 = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self performSelector:@selector(setPic:) withObject:image1 afterDelay:0.5];
}

-(void) setPic :(UIImage*)image{
    GPUImageTiltShiftFilter *_TSFilter = [GPUImageTiltShiftFilter new];
    UIImage *blurredSnapshotImage = [_TSFilter imageByFilteringImage:image];
    imgProduct.image = blurredSnapshotImage;
    btnAddPic.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.7f];
    [btnAddPic setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
}

// Text METHODS DELEGATE

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtDesc resignFirstResponder];
}

- (void)keyboardWillHide:(NSNotification *)aNotification
{
    NSTimeInterval animationDuration =
    [[[aNotification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
}


- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"Paso por aca");
    int yPos = textView.frame.origin.y;
    CGRect frame = self.view.frame;
    frame.origin.y = -(yPos - ((self.view.frame.size.height - 216) - 60));
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:0.25];
    self.view.frame = frame;
    [UIView commitAnimations];
}

/*- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
- (BOOL)textViewShouldEndEditing:(UITextView *)textView;

- (void)textViewDidBeginEditing:(UITextView *)textView;
- (void)textViewDidEndEditing:(UITextView *)textView;

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)textViewDidChange:(UITextView *)textView;

- (void)textViewDidChangeSelection:(UITextView *)textView;

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0);
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0);

*/
@end
