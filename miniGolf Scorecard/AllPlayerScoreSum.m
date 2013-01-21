//
//  MyTableViewController.m
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 8/5/12.
//  Copyright (c) 2012 PSOM. All rights reserved.
//

#import "HoleTableViewController.h"
#import "GameManager.h"
#import "Player.h"
#import "infoPage.h"
#import "HoleScore.h"
#import "AllPlayerScoreSum.h"
#import "IndividualPlayerScoreSum.h"



@implementation AllPlayerScoreSum

Player *holdPlayer;



BOOL allPlayerScoreIsSetUp = FALSE;
int holeInt;

@synthesize listOfItems;
@synthesize sortedListOfItems;

- (void) viewDidAppear:(BOOL) animated{
    
        
    // Order list
    sortedListOfItems = [self sortItemList: listOfItems];
    
    
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
    
  
    
    if(allPlayerScoreIsSetUp){
        GameManager *myManager = [GameManager sharedGameManager];
        sortedListOfItems = [myManager holeArray];
        //NSLog(@"Else loop test in allPlayerScoreSum");
    }
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set background image
    UIImageView* tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_notext"]];
    [tempImageView setFrame:self.tableView.frame];
    
    self.tableView.backgroundView = tempImageView;
    
    listOfItems = [[NSMutableArray alloc] init];
    
    GameManager *myManager = [GameManager sharedGameManager];
   
        listOfItems = myManager.playerArray;
     

    
}

- (NSMutableArray*) sortItemList:(NSMutableArray*) listOfItemsToSort{
    
    
    NSArray *sortedArray;
    sortedArray = [listOfItemsToSort sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        
        int first = [self getTotalScoreForPlayer: (Player *) a];
        
        int second = [self getTotalScoreForPlayer: (Player *) b];
        
        NSNumber *firstNSInt = [NSNumber numberWithInt:first];
        NSNumber *secondNSInt = [NSNumber numberWithInt:second];
        
        return [firstNSInt compare:secondNSInt];
    }];
    
    NSMutableArray *sortedMutableArray = [sortedArray mutableCopy];
    return sortedMutableArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [sortedListOfItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
       UILabel *scoreLabelOriginal = [[UILabel alloc] initWithFrame:CGRectMake(250,10, 62, 23)];
        scoreLabelOriginal.tag = 1;
        
        [cell addSubview : scoreLabelOriginal];
        
    }
    
    // Set up the cell...
    Player *cellValue = [sortedListOfItems objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue.name;
    
    
    cell.textLabel.textColor = cellValue.ballColor;
    
    
    //TODO: get score label working
    // idea: put score and accessory thingy in one view then use that as
    // accessory view
    
    UILabel *scoreLabel = (UILabel*)[cell viewWithTag:1];
    
    
    //scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(250,10, 62, 23)];
    //[scoreLabel setText:@"test"];
    [scoreLabel setBackgroundColor:[UIColor clearColor]];
    
    
    
    //[cell addSubview:scoreLabel];
    
   
    
    
    [cell setAccessoryType : UITableViewCellAccessoryDisclosureIndicator];
    
    //[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    //test again
    
    //NSLog(@"tableView method called");
    
    //test coding
    //[cellValue setScoreForHole3: 5];
    
    //call right method
    int scoreToDisplay = [self getTotalScoreForPlayer:cellValue];
    NSString *scoreToDisplayString = [NSString stringWithFormat:@"%d", scoreToDisplay];
    [scoreLabel setText:scoreToDisplayString];
    scoreLabel.font = [UIFont boldSystemFontOfSize:18.0];
    
    

    
    
    return cell;
}

- (int) getTotalScoreForPlayer: (Player *) p{
    
    int totalScore = p.scoreForHole1 +
    p.scoreForHole2 +
    p.scoreForHole3 +
    p.scoreForHole4 +
    p.scoreForHole5 +
    p.scoreForHole6 +
    p.scoreForHole7 +
    p.scoreForHole8 +
    p.scoreForHole9 +
    p.scoreForHole10 +
    p.scoreForHole11 +
    p.scoreForHole12 +
    p.scoreForHole13 +
    p.scoreForHole14 +
    p.scoreForHole15 +
    p.scoreForHole16 +
    p.scoreForHole17 +
    p.scoreForHole18;

    
    return totalScore;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"individualScores"])
    {
        // Get reference to the destination view controller
        IndividualPlayerScoreSum *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        
        
        [vc setPlayerForHoleScores:holdPlayer];
        
        

    }
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    
    
    [tableView deselectRowAtIndexPath: indexPath animated:YES];
    
    Player *tempPlayer = [sortedListOfItems objectAtIndex:indexPath.row];
    
    holdPlayer = tempPlayer;
    

    
    [self performSegueWithIdentifier:@"individualScores" sender:self];
    
    
    
}



//dealloc method declared in RootViewController.m
- (void)dealloc {
    
}


@end
