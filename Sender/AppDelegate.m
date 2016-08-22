//
//  AppDelegate.m
//  Sender
//
//  Created by Alejandro Guízar Prado on 01/12/13.
//  Copyright (c) 2013 Alejandro Guízar Prado. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize authorization;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.rootViewController = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"req"];
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)receivedurl {
    NSString *urlHost = [NSString stringWithFormat:@"%@",receivedurl];
    urlHost = [urlHost stringByReplacingOccurrencesOfString:@"sender://" withString:@""];
    urlHost = [urlHost stringByReplacingOccurrencesOfString:@"Sender://" withString:@""];
    NSString *transactionResult = [urlHost stringByReplacingOccurrencesOfString:@"&" withString:@"\n"];
    NSLog(@"after erasing &:\n%@",transactionResult);
    transactionResult = [transactionResult stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"after decoded:\n%@",transactionResult);
    NSArray *content = [urlHost componentsSeparatedByString:@"&"];
    NSMutableArray *names = [NSMutableArray array];
    NSMutableArray *values = [NSMutableArray array];
    for (int index = 0; index < [content count]; index++) {
        NSArray *temp = [[content objectAtIndex:index] componentsSeparatedByString:@"="];
        [names addObject:[[temp objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [values addObject:[[temp objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    NSLog(@"after dividing strings:\n%@",names);
    NSLog(@"after dividing strings:\n%@",values);
    
    NSUInteger indexOfTheObject = [names indexOfObject:@"result"];
    NSString *result = [values objectAtIndex:indexOfTheObject];
    //Obtener valor de statusinfo
    indexOfTheObject = [names indexOfObject:@"statusinfo"];
    NSString *statusinfo = @"";
    if (indexOfTheObject != NSNotFound) {
        statusinfo = [values objectAtIndex:indexOfTheObject];
    }
    if (NSNotFound != indexOfTheObject) {
        NSString *statusinfo = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de amount
    indexOfTheObject = [names indexOfObject:@"amount"];
    if (NSNotFound != indexOfTheObject) {
        NSString *amount = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de tip
    indexOfTheObject = [names indexOfObject:@"tip"];
    if (NSNotFound != indexOfTheObject) {
        NSString *tip = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de payments
    indexOfTheObject = [names indexOfObject:@"payments"];
    if (NSNotFound != indexOfTheObject) {
        NSString *payments = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de reference
    indexOfTheObject = [names indexOfObject:@"reference"];
    if (NSNotFound != indexOfTheObject) {
        NSString *reference = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de transactionid
    indexOfTheObject = [names indexOfObject:@"transactionid"];
    if (NSNotFound != indexOfTheObject) {
        NSString *transactionid = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de authorization
    indexOfTheObject = [names indexOfObject:@"authorization"];
    if (NSNotFound != indexOfTheObject) {
        NSString *authorization = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de creditcard
    indexOfTheObject = [names indexOfObject:@"creditcard"];
    if (NSNotFound != indexOfTheObject) {
        NSString *creditcard = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de cardtype
    indexOfTheObject = [names indexOfObject:@"cardtype"];
    if (NSNotFound != indexOfTheObject) {
        NSString *cardtype = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de email
    indexOfTheObject = [names indexOfObject:@"email"];
    if (NSNotFound != indexOfTheObject) {
        NSString *email = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de phone
    indexOfTheObject = [names indexOfObject:@"phone"];
    if (NSNotFound != indexOfTheObject) {
        NSString *phone = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de arqc
    indexOfTheObject = [names indexOfObject:@"arqc"];
    if (NSNotFound != indexOfTheObject) {
        NSString *arqc = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de aid
    indexOfTheObject = [names indexOfObject:@"aid"];
    if (NSNotFound != indexOfTheObject) {
        NSString *aid = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de applabel
    indexOfTheObject = [names indexOfObject:@"applabel"];
    if (NSNotFound != indexOfTheObject) {
        NSString *applabel = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de url
    indexOfTheObject = [names indexOfObject:@"url"];
    if (NSNotFound != indexOfTheObject) {
        NSString *url = [values objectAtIndex:indexOfTheObject];
    }
    //Obtener valor de identifier
    indexOfTheObject = [names indexOfObject:@"identifier"];
    NSString *identifier = [values objectAtIndex:indexOfTheObject];
    
    if ([result  isEqual:@"aprobada"]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:result message:transactionResult delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    } else if ([result isEqual:@"error"]){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:result message:statusinfo delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    } else if ([result isEqual:@"rechazada"]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:result message:statusinfo delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Request" bundle:[NSBundle mainBundle]];
    UIViewController *vc =[storyboard instantiateViewControllerWithIdentifier:@"req"];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end