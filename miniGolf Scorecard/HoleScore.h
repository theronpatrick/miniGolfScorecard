//
//  MyTableViewController.h
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 8/5/12.
//  Copyright (c) 2012 PSOM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HoleScore : UITableViewController <UITextFieldDelegate, UITextViewDelegate, UIGestureRecognizerDelegate>{
    
    
    NSMutableArray *listOfItems;
}

@property (strong, nonatomic) NSMutableArray *listOfItems;
@property (nonatomic) int holeNumber;

@property (nonatomic) int playerScoreForHole;
//@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) NSMutableArray *labelArray;

@property (strong, nonatomic) NSMutableArray *listOfTextBoxes;

@property (strong, nonatomic) IBOutlet UIButton *nextHoleButton;

@property (strong, nonatomic) IBOutlet UIToolbar *keyboardToolbar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *keyboardDoneButton;

@end
