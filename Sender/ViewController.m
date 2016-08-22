//
//  ViewController.m
//  Sender
//
//  Created by Alejandro Guízar Prado on 01/12/13.
//  Copyright (c) 2013 Alejandro Guízar Prado. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize text1;
@synthesize text2;
@synthesize text3;
@synthesize text4;
@synthesize text5;
@synthesize text6;
@synthesize text7;
@synthesize text8;
@synthesize text9;
@synthesize text10;
@synthesize text11;
@synthesize text12;

- (void)viewDidLoad {
    [text1 setDelegate:self];
    [text2 setDelegate:self];
    [text3 setDelegate:self];
    [text4 setDelegate:self];
    [text5 setDelegate:self];
    [text6 setDelegate:self];
    [text7 setDelegate:self];
    [text8 setDelegate:self];
    [text9 setDelegate:self];
    [text10 setDelegate:self];
    [text11 setDelegate:self];
    [text12 setDelegate:self];
    [super viewDidLoad];
    
    
    UITapGestureRecognizer *taptap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:taptap];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)openReceiverApp:(id)sender {
    UIApplication *ourApplication = [UIApplication sharedApplication];
//    NSString *application = @"receiver";
    NSString *application = [[text11.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]  stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    NSString *transaction = [[text1.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]  stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    
    NSString *pinToken = [[text2.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    
    
    
    NSString *transactionid = [[text3.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    NSString *amount = [[text4.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    NSString *tip = [[text5.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    NSString *payments = [[text6.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    NSString *reference = [[text7.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    NSString *email = [[text8.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    NSString *phone = [[text9.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    NSString *identifier = [[text10.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    NSString *urlscheme = [[text12.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"&" withString:@"%26"]
    ;
    
    NSString *format = (!swtPIN.isOn) ? @"%@://transaction=%@&pin=%@&transactionid=%@&amount=%@&tip=%@&payments=%@&reference=%@&email=%@&phone=%@&identifier=%@&urlScheme=%@" : @"%@://transaction=%@&usertoken=%@&transactionid=%@&amount=%@&tip=%@&payments=%@&reference=%@&email=%@&phone=%@&identifier=%@&urlScheme=%@";
    
    NSString *ourPath = [NSString stringWithFormat:format, application, transaction, pinToken, transactionid, amount, tip, payments, reference, email, phone, identifier, urlscheme];
    NSURL *ourURL = [NSURL URLWithString:ourPath];
    NSLog(@"request URL: %@",ourURL);
    if ([ourApplication canOpenURL:ourURL]) {
        //UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Successful request" message:ourPath delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //[alertView show];
        [ourApplication openURL:ourURL];
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@ not found", application] message:ourPath delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

-(void)dismissKeyboard{
    [text1 resignFirstResponder];
    [text2 resignFirstResponder];
    [text3 resignFirstResponder];
    [text4 resignFirstResponder];
    [text5 resignFirstResponder];
    [text6 resignFirstResponder];
    [text7 resignFirstResponder];
    [text8 resignFirstResponder];
    [text9 resignFirstResponder];
    [text10 resignFirstResponder];
    [text11 resignFirstResponder];
    [text12 resignFirstResponder];
}

-(IBAction)clearTextfields:(id)sender {
    text1.text = @"";
    text2.text = @"";
    text3.text = @"";
    text4.text = @"";
    text5.text = @"";
    text6.text = @"";
    text7.text = @"";
    text8.text = @"";
    text9.text = @"";
    text10.text = @"";
    text11.text = @"";
    text12.text = @"";
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    CGPoint offset = CGPointMake(0, textField.frame.origin.y);
    [scroll setContentOffset:offset animated:true];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [scroll setContentOffset:CGPointMake(0, 0) animated:true];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    NSInteger nextTag = textField.tag + 1;
    UIResponder *nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        [nextResponder becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return NO;
}

-(IBAction)swtPINChanged:(id)sender{
    [lblPINToken setText:swtPIN.isOn ? @"Token" : @"PIN"];
}

@end
