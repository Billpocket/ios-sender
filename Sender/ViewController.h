//
//  ViewController.h
//  Sender
//
//  Created by Alejandro Guízar Prado on 01/12/13.
//  Copyright (c) 2013 Alejandro Guízar Prado. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField *text1;
    IBOutlet UITextField *text2;
    IBOutlet UITextField *text3;
    IBOutlet UITextField *text4;
    IBOutlet UITextField *text5;
    IBOutlet UITextField *text6;
    IBOutlet UITextField *text7;
    IBOutlet UITextField *text8;
    IBOutlet UITextField *text9;
    IBOutlet UITextField *text10;
    IBOutlet UITextField *text11;
    IBOutlet UITextField *text12;
    IBOutlet UISwitch *swtPIN;
    IBOutlet UILabel *lblPINToken;
}

-(IBAction)openReceiverApp:(id)sender;
-(IBAction)swtPINChanged:(id)sender;
-(IBAction)clearTextfields:(id)sender;

@property(nonatomic, retain) IBOutlet UITextField *text1;
@property(nonatomic, retain) IBOutlet UITextField *text2;
@property(nonatomic, retain) IBOutlet UITextField *text3;
@property(nonatomic, retain) IBOutlet UITextField *text4;
@property(nonatomic, retain) IBOutlet UITextField *text5;
@property(nonatomic, retain) IBOutlet UITextField *text6;
@property(nonatomic, retain) IBOutlet UITextField *text7;
@property(nonatomic, retain) IBOutlet UITextField *text8;
@property(nonatomic, retain) IBOutlet UITextField *text9;
@property(nonatomic, retain) IBOutlet UITextField *text10;
@property(nonatomic, retain) IBOutlet UITextField *text11;
@property(nonatomic, retain) IBOutlet UITextField *text12;

@end
