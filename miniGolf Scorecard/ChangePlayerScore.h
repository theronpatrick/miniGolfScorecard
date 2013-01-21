//
//  infoPage.h
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 8/7/12.
//  Copyright (c) 2012 PSOM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface ChangePlayerScore : UIViewController{
    
    IBOutlet UITextField *playerScore;
    
    NSString *playerString;
    
    
    
    IBOutlet UILabel *playerLabel;
    
}

@property (strong, nonatomic) IBOutlet UITextField *playerScore;
@property (strong, nonatomic) IBOutlet UILabel *playerLabel;
@property (nonatomic) int holeNumber;
@property (strong, nonatomic) NSString *defaultHoleLabel;

@property (strong, nonatomic) IBOutlet UITextField *derpField;

@property (strong, nonatomic) IBOutlet UITextField *try3;

@property (strong, nonatomic) IBOutlet UIButton *okButton;


- (void)changePlayerString:(Player*) newName;

- (IBAction) textFieldDoneEditing : (id) sender;
- (IBAction) okButtonPressed: (id) sender;


@end
