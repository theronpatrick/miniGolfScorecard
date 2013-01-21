//
//  AppDelegate.h
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 8/4/12.
//  Copyright (c) 2012 PSOM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>{
    
    UITabBarController *tabBarController;
}

@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic) IBOutlet UITabBarController *tabBarController;

@end
