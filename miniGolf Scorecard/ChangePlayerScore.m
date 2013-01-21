//
//  infoPage.m
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 8/7/12.
//  Copyright (c) 2012 PSOM. All rights reserved.
//

#import "ChangePlayerScore.h"

@implementation ChangePlayerScore

@synthesize playerLabel;
@synthesize playerScore;
@synthesize holeNumber;
@synthesize defaultHoleLabel;

@synthesize try3;


Player * tempPlayer;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void) viewDidAppear:(BOOL)animated{
    
    //playerScore.text = defaultHoleLabel;
    //test try
    playerScore.text = defaultHoleLabel;
    

    
}
    

- (void)changePlayerString:(Player*) newPlayer{
    
    playerString = newPlayer.name;
    
    tempPlayer = newPlayer;
    

}



#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(tempPlayer == nil){
        tempPlayer = [[Player alloc] init];
    }

    
    playerLabel.text= playerString;

    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    

    
    if ([playerScore isFirstResponder]){
        [playerScore resignFirstResponder];
    }
    
    
    
    [super touchesBegan:touches withEvent:event];
}

-(IBAction) textFieldDoneEditing : (id) sender{
    
    [sender resignFirstResponder];
    
}


-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        

        
        int playerScoreInt = [playerScore.text intValue];
        
        
        
        switch(holeNumber)
        {
            case 1:
                [tempPlayer setScoreForHole1: playerScoreInt];
                break;
            case 2:
                [tempPlayer setScoreForHole2: playerScoreInt];
                break;
            case 3:
                [tempPlayer setScoreForHole3: playerScoreInt];
                break;
            case 4:
                [tempPlayer setScoreForHole4: playerScoreInt];
                break;
            case 5:
                [tempPlayer setScoreForHole5: playerScoreInt];
                break;
            case 6:
                [tempPlayer setScoreForHole6: playerScoreInt];
                break;
            case 7:
                [tempPlayer setScoreForHole7: playerScoreInt];
                break;
            case 8:
                [tempPlayer setScoreForHole8: playerScoreInt];
                break;
            case 9:
                [tempPlayer setScoreForHole9: playerScoreInt];
                break;
            case 10:
                [tempPlayer setScoreForHole10: playerScoreInt];
                break;
            case 11:
                [tempPlayer setScoreForHole11: playerScoreInt];
                break;
            case 12:
                [tempPlayer setScoreForHole12: playerScoreInt];
                break;
            case 13:
                [tempPlayer setScoreForHole13: playerScoreInt];
                break;
            case 14:
                [tempPlayer setScoreForHole14: playerScoreInt];
                break;
            case 15:
                [tempPlayer setScoreForHole15: playerScoreInt];
                break;
            case 16:
                [tempPlayer setScoreForHole16: playerScoreInt];
                break;
            case 17:
                [tempPlayer setScoreForHole17: playerScoreInt];
                break;
            case 18:
                [tempPlayer setScoreForHole18: playerScoreInt];
                break;
            default:
                break;
        }
        
    }
    [super viewWillDisappear:animated];
}


- (void)viewDidUnload
{
    
    [self setTry3:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) okButtonPressed:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
