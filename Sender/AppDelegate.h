//
//  AppDelegate.h
//  Sender
//
//  Created by Alejandro Guízar Prado on 01/12/13.
//  Copyright (c) 2013 Alejandro Guízar Prado. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSString *authorization;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *authorization;
/*@property (nonatomic, retain) NSString *transaction;
@property (nonatomic, retain) NSString *pin;
@property (nonatomic, retain) NSString *amount;
@property (nonatomic, retain) NSString *tip;
@property (nonatomic, retain) NSString *payments;
@property (nonatomic, retain) NSString *reference;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *identifier;*/

@end
