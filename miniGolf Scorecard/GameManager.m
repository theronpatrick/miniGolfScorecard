//
//  GameManager.m
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 8/5/12.
//  Copyright (c) 2012 PSOM. All rights reserved.
//

#import "GameManager.h"

static GameManager *sharedGameManager = nil;
static bool tableViewIsSetUp;
static bool holeTableViewIsSetUp;
static bool allPlayerScoreIsSetUp;

@implementation GameManager


@synthesize playerCount;
@synthesize playerArray;
@synthesize holeArray;



+ (id)sharedGameManager {
    @synchronized(self) {
        if (sharedGameManager == nil)
            
            //allocate space for objects
            sharedGameManager = [[self alloc] init];
        
            //playerArray = [[NSMutableArray alloc] init ];
        
        tableViewIsSetUp = false;
        
       holeTableViewIsSetUp = false;
        
        allPlayerScoreIsSetUp = false;
        
        
        
    }
    return sharedGameManager;
}

-(bool) isTableViewSetUp{
    return tableViewIsSetUp;
}

- (void) setTableViewSetUpToTrue{
    tableViewIsSetUp = true;
}
- (void) setTableViewSetUpToFalse{
    tableViewIsSetUp = false;
}

-(bool) isHoleTableViewSetUp{
    return holeTableViewIsSetUp;
}

- (void) setHoleTableViewSetUpToTrue{
    holeTableViewIsSetUp = true;
}
- (void) setHoleTableViewSetUpToFalse{
    holeTableViewIsSetUp = false;
}

-(bool) isAllPlayerScoreSetUp{
    return allPlayerScoreIsSetUp;
}

- (void) setAllPlayerScoreSetUpToTrue{
    allPlayerScoreIsSetUp = true;
}
- (void) setAllPlayerScoreSetUpToFalse{
    allPlayerScoreIsSetUp = false;
}



- (void) hideTabBar:(UITabBarController *) tabbarcontroller
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
  
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, screenRect.size.height, view.frame.size.width, view.frame.size.height)];
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, screenRect.size.height)];
            view.backgroundColor = [UIColor blackColor];
        }
        
    }
    
    [UIView commitAnimations];
}

- (void) showTabBar:(UITabBarController *) tabbarcontroller
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];

    float fHeight = screenRect.size.height - 49.0;

    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView *view in tabbarcontroller.view.subviews)
    {
  
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, fHeight, view.frame.size.width, view.frame.size.height)];
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, fHeight)];
        }
    }
    [UIView commitAnimations];
}



@end
