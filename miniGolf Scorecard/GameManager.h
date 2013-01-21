//
//  GameManager.h
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 8/5/12.
//  Copyright (c) 2012 PSOM. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GameManager : NSObject{
    
}

@property NSInteger playerCount;
@property (strong, nonatomic) NSMutableArray *playerArray;
@property (strong, nonatomic) NSMutableArray *holeArray;



- (bool) isTableViewSetUp;
- (bool) isHoleTableViewSetUp;
- (bool) isAllPlayerScoreSetUp;

- (void) setTableViewSetUpToTrue;
- (void) setTableViewSetUpToFalse;

- (void) setHoleTableViewSetUpToTrue;
- (void) setHoleTableViewSetUpToFalse;

- (void) setAllPlayerScoreSetUpToTrue;
- (void) setAllPlayerScoreSetUpToFalse;

+ (id)sharedGameManager;

- (void) showTabBar:(UITabBarController *) tabbarcontroller;
- (void) hideTabBar:(UITabBarController *) tabbarcontroller;


@end
