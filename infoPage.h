//
//  infoPage.h
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 8/7/12.
//  Copyright (c) 2012 PSOM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface infoPage : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>{
    
    IBOutlet UITextField *playerLabel;
    
    NSString *playerString;
    
//    IBOutlet UIPickerView *ballColorPicker;
//    
//    IBOutlet UIButton *okButton;
}

@property (strong, nonatomic) IBOutlet UITextField *playerLabel;
@property (strong, nonatomic) NSString *playerString;
@property (strong, nonatomic) IBOutlet UIPickerView *ballColorPicker;
@property (strong, nonatomic) NSArray *ballColorArray;
@property (strong, nonatomic) IBOutlet UIButton *okButton;


- (void)changePlayerString:(Player*) newName;

- (IBAction) textFieldDoneEditing : (id) sender;

- (IBAction) okButtonPressed : (id) sender;


@end
