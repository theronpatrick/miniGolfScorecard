//
//  MyTableViewController.h
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 8/5/12.
//  Copyright (c) 2012 PSOM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllPlayerScoreSum : UITableViewController{
    
    
    NSMutableArray *listOfItems;
}

@property (strong, nonatomic) NSMutableArray *listOfItems;

@property (strong, nonatomic) NSMutableArray *sortedListOfItems;

@end
