//
//  MyTableViewController.m
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 8/5/12.
//  Copyright (c) 2012 PSOM. All rights reserved.
//

#import "HoleScore.h"
#import "GameManager.h"
#import "Player.h"
#import "infoPage.h"
#import "ChangePlayerScore.h"



@implementation HoleScore


Player *playerToSave;
UITextField *holdTextField;
int scoreLabelTag;

BOOL HoleScoreIsSetUp = TRUE;

NSString* scoreToDisplayString;

// probably not needed
int indexTouched;

@synthesize labelArray;

@synthesize listOfItems;
@synthesize holeNumber;
@synthesize playerScoreForHole;
//@synthesize scoreLabel;
@synthesize listOfTextBoxes;
@synthesize nextHoleButton;
@synthesize keyboardToolbar;
@synthesize keyboardDoneButton;

- (void) viewDidAppear:(BOOL) animated{
    
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
    
 
    if(HoleScoreIsSetUp){
        GameManager *myManager = [GameManager sharedGameManager];
        listOfItems = myManager.playerArray;
        //NSLog(@"Else loop test in viewDidAppear");
    }
    
    
    //change next hole button on last hole
    if (holeNumber == 18){
        
        [nextHoleButton setTitle:@"Score Totals" forState:UIControlStateNormal];
        
        
        [nextHoleButton removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
        
        [nextHoleButton addTarget:self action:@selector(goToScoreSum) forControlEvents: UIControlEventTouchUpInside];
        
    }
    
    
    [self.tableView reloadData];
}

- (void) goToScoreSum{
    UITabBarController* myTabBar = [self tabBarController];
    [myTabBar setSelectedIndex:1];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set background image
    UIImageView* tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_notext"]];
    [tempImageView setFrame:self.tableView.frame];
    
    self.tableView.backgroundView = tempImageView;
    
    
    
    scoreLabelTag = 0;
    holdTextField = [[UITextField alloc] init];
    indexTouched = -1;
    
    
    
    NSString *titleString = @"Hole ";
    titleString = [titleString stringByAppendingString:([NSString stringWithFormat:@"%i", holeNumber])];
    
    self.navigationItem.title = titleString;
    
           
            
    
    GameManager *myManager = [GameManager sharedGameManager];
    
    int max = myManager.playerCount;
   
    playerToSave =[[Player alloc] init];
    
    BOOL holeScoreSetupBoolean = FALSE;
    
    if (!holeScoreSetupBoolean){
        listOfItems = [[NSMutableArray alloc] init];
        listOfTextBoxes = [[NSMutableArray alloc] init];
        
       
        // still need to fix to put players in game manager
        scoreLabelTag = 1;
        
        for (int i = 0; i < max; i++){
            
            //Build the text view buttons in each cell
            //UITextField *scoreLabel = [[UITextField alloc] initWithFrame:CGRectMake(2,2, 62, 23)];
            
            UITextField *scoreLabel = [[UITextField alloc] initWithFrame:CGRectMake(2, 2, 40, 20)];
            scoreLabel.borderStyle = UITextBorderStyleRoundedRect;
            scoreLabel.font = [UIFont systemFontOfSize:15];
            scoreLabel.placeholder = @"Score";
            scoreLabel.autocorrectionType = UITextAutocorrectionTypeNo;
            scoreLabel.keyboardType = UIKeyboardTypeNumberPad;
            scoreLabel.returnKeyType = UIReturnKeyDone;
            //scoreLabel.clearButtonMode = UITextFieldViewModeWhileEditing;
            scoreLabel.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            scoreLabel.delegate = self;
            //[self.view addSubview:scoreLabel];
            //[scoreLabel release];
            scoreLabel.tag = scoreLabelTag;
            scoreLabelTag++;
            scoreLabel.userInteractionEnabled = TRUE;
            
            scoreLabel.inputAccessoryView = keyboardToolbar;
            
            [listOfTextBoxes addObject:scoreLabel];
            
            listOfItems = myManager.playerArray;
            
        }
        
        //holeScoreSetupBoolean = TRUE;
        
        
    }
    else{
        listOfItems = myManager.playerArray;
        //NSLog(@"Else loop test in viewDidLoad in HoleScore");
    }
    
    
    // for navigation, should take out back button to player number
    // select and instead rely on having nav at bottom to go to main menu
    
    
    
    
    //set up gesture to dismiss keyboard
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    gestureRecognizer.delegate = self;
    gestureRecognizer.cancelsTouchesInView = FALSE;
    [self.tableView addGestureRecognizer:gestureRecognizer];
    
    
    //set right button on navigation bar
    int nextHoleInt = holeNumber + 1;
    NSString* nextHoleNumber = [NSString stringWithFormat:@"%d", nextHoleInt];
    NSMutableString* barTitle = [NSMutableString stringWithString: @"Hole "];
    [barTitle appendString: nextHoleNumber];
    
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:barTitle style:UIBarButtonItemStylePlain target:self action: @selector(goToNextHoleWithSender)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
    //last hole
    
    if (holeNumber == 18){
        
        [anotherButton setTitle:@"Score Totals"];
        
        [anotherButton setAction: @selector(goToScoreSum)];
        
    }
    
    //show tab bar
    [myManager showTabBar:self.tabBarController];
    
}



- (void) goToNextHoleWithSender{
    
    if(holdTextField.isFirstResponder){
        [holdTextField resignFirstResponder];
        //NSLog(@"Resign first responder test");
    }
    
    [self performSegueWithIdentifier:@"goToNextHoleFromHoleScore" sender:(id) nil];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listOfItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set up the cell...
    Player *cellValue = [listOfItems objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue.name;
    
    
    cell.textLabel.textColor = cellValue.ballColor;
    
    
    UITextField *myTextField = [listOfTextBoxes objectAtIndex:indexPath.row];
    //[scoreLabel setText:@"test"];
    
    
    int scoreToShowInTextField = [self getHoleScoreForPlayer:cellValue];
    NSString* stringToShowInTextField = [NSString stringWithFormat:@"%d", scoreToShowInTextField];
        
    myTextField.text = stringToShowInTextField;
    
  
    
    [cell setAccessoryView:myTextField];
    
    
    return cell;
}

- (void) hideKeyboard {
    
    if ([holdTextField isFirstResponder]){
        [holdTextField resignFirstResponder];
    }

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    
    //for button to next hole
    if ([[segue identifier] isEqualToString:@"goToNextHoleFromHoleScore"])
    {
        HoleScore *vc = [segue destinationViewController];
        [vc setHoleNumber:holeNumber + 1];
    }
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    
    playerToSave = [listOfItems objectAtIndex:indexPath.row];
    
    
    [tableView deselectRowAtIndexPath: indexPath animated:YES];
    holdTextField = [listOfTextBoxes objectAtIndex:indexPath.row];
    
    if(indexTouched != indexPath.row){
        indexTouched = indexPath.row;
    
        [holdTextField becomeFirstResponder];
    }
    else{
        [holdTextField resignFirstResponder];
        
        //TODO: verify this hack doesn't break code
        indexTouched = -1;
    }

}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    // set reference to new text field
    holdTextField = textField;



    indexTouched = holdTextField.tag - 1;
    
    textField.text = @"";
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
 
    
    playerToSave = [listOfItems objectAtIndex:indexTouched];
    
    [self saveScoreForPlayer:playerToSave];
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //UITouch *touch = [[event allTouches] anyObject];
    
    if ([holdTextField isFirstResponder]){
        [holdTextField resignFirstResponder];
    }
   
    [super touchesBegan:touches withEvent:event];
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}



//dealloc method declared in RootViewController.m
- (void)dealloc {
    
}

- (int) getHoleScoreForPlayer: (Player *) p{
    
 
    
    switch(holeNumber)
    {
        case 1:
            return [p scoreForHole1];
            break;
        case 2:
            return [p scoreForHole2];
            break;
        case 3:
            return [p scoreForHole3];
            break;
        case 4:
            return [p scoreForHole4];
            break;
        case 5:
            return [p scoreForHole5];
            break;
        case 6:
           return [p scoreForHole6];
            break;
        case 7:
            return [p scoreForHole7];
            break;
        case 8:
            return [p scoreForHole8];
            break;
        case 9:
            return [p scoreForHole9];
            break;
        case 10:
            return [p scoreForHole10];
            break;
        case 11:
            return [p scoreForHole11];
            break;
        case 12:
            return [p scoreForHole12];
            break;
        case 13:
            return [p scoreForHole13];
            break;
        case 14:
            return [p scoreForHole14];
            break;
        case 15:
            return [p scoreForHole15];
            break;
        case 16:
            return [p scoreForHole16];
            break;
        case 17:
            return [p scoreForHole17];
            break;
        case 18:
            return [p scoreForHole18];
            break;
        default:
            break;
    }

 
    return 0;
    
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        
        
        [self saveScoreForPlayer: playerToSave];
    }
    
      
    [super viewWillDisappear:animated];
}

- (void) saveScoreForPlayer: (Player*) p{
    
    int playerScoreInt = [holdTextField.text intValue];
    
   
    
    switch(holeNumber)
    {
        case 1:
            [p setScoreForHole1: playerScoreInt];
            break;
        case 2:
            [p setScoreForHole2: playerScoreInt];
            break;
        case 3:
            [p setScoreForHole3: playerScoreInt];
            break;
        case 4:
            [p setScoreForHole4: playerScoreInt];
            break;
        case 5:
            [p setScoreForHole5: playerScoreInt];
            break;
        case 6:
            [p setScoreForHole6: playerScoreInt];
            break;
        case 7:
            [p setScoreForHole7: playerScoreInt];
            break;
        case 8:
            [p setScoreForHole8: playerScoreInt];
            break;
        case 9:
            [p setScoreForHole9: playerScoreInt];
            break;
        case 10:
            [p setScoreForHole10: playerScoreInt];
            break;
        case 11:
            [p setScoreForHole11: playerScoreInt];
            break;
        case 12:
            [p setScoreForHole12: playerScoreInt];
            break;
        case 13:
            [p setScoreForHole13: playerScoreInt];
            break;
        case 14:
            [p setScoreForHole14: playerScoreInt];
            break;
        case 15:
            [p setScoreForHole15: playerScoreInt];
            break;
        case 16:
            [p setScoreForHole16: playerScoreInt];
            break;
        case 17:
            [p setScoreForHole17: playerScoreInt];
            break;
        case 18:
            [p setScoreForHole18: playerScoreInt];
            break;
        default:
            break;
    }

}

//only allow 2 digit inputs

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    
    
    
    int limit = 2;
    
     
    return ([textField.text length] < limit || [string isEqualToString:@""]);
    
}


- (IBAction)keyboardDoneButtonHit:(id)sender {
    
    
    [holdTextField resignFirstResponder];
    
    
    indexTouched = -1;
}

- (void)viewDidUnload {
  
    [self setNextHoleButton:nil];
    [self setKeyboardToolbar:nil];
    [self setKeyboardDoneButton:nil];
    [super viewDidUnload];
}
@end
