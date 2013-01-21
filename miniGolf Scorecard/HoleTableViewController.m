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



@implementation HoleTableViewController

BOOL holeIsSetUp = FALSE;
int holeInt;

@synthesize listOfItems;

- (void) viewDidAppear:(BOOL) animated{
    
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];

    
    if(holeIsSetUp){
        GameManager *myManager = [GameManager sharedGameManager];
        listOfItems = [myManager holeArray];
        //NSLog(@"Else loop test in holeTableViewController");
    }
    

    if(holeInt == -1){
        
        holeInt = 1;
        sleep(.3);
        [self performSegueWithIdentifier:@"holeInfoSegue" sender:nil];
    }
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set background image
    // commented out to retain white table view
//    UIImageView* tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_notext"]];
//    [tempImageView setFrame:self.tableView.frame];
//    
//    self.tableView.backgroundView = tempImageView;
//    
    //fix tab bar from landscape
    
    UIInterfaceOrientation interfaceOrientation = self.interfaceOrientation;
    if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
       interfaceOrientation == UIInterfaceOrientationLandscapeRight){
        
        
        for(UIView *view in self.view.subviews)
        {
            if([view isKindOfClass:[UITabBar class]])
            {
                view.hidden = YES;
                
                break;
            }
        }
    }
    
    
    GameManager *myManager = [GameManager sharedGameManager];
    
    //initially hide tab bar
    [myManager hideTabBar:self.tabBarController];
    
    
    //GameManager *myManager = [GameManager sharedGameManager];
    
    int max = 18;
    
    
    // logic is backwards?
    holeIsSetUp = [myManager isHoleTableViewSetUp];
    
    if (!holeIsSetUp){
        listOfItems = [[NSMutableArray alloc] init];
        
        //holdPlayer =[[Player alloc] init];
        
        // still need to fix to put players in game manager
        
        for (int i = 0; i < max; i++){
            
           
            
            NSString *holeName = @"Hole ";
            
            
            holeName = [holeName stringByAppendingString:([NSString stringWithFormat:@"%i ",i + 1])];
            
           
            
            [listOfItems addObject:holeName];
            
            
            
        }
        myManager.holeArray = listOfItems;
        
        
        [myManager setHoleTableViewSetUpToTrue];
        
        
    }
    else{
        listOfItems = myManager.holeArray;
       // NSLog(@"Else loop test");
    }
    

    
    //hack to make viewDidAppear work for first time
    holeInt = -1;
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listOfItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set up the cell...
    NSString *cellValue = [listOfItems objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"holeInfoSegue"])
    {
        // Get reference to the destination view controller
        HoleScore *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
       
        
        [vc setHoleNumber:holeInt];
        
    }
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    
    
    [tableView deselectRowAtIndexPath: indexPath animated:YES];
    
    holeInt = [indexPath row] + 1;
    
    [self performSegueWithIdentifier:@"holeInfoSegue" sender:self];
    
    
}


//dealloc method declared in RootViewController.m
- (void)dealloc {
    
}


@end
