//
//  IndividualPlayerScoreSum.m
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 8/25/12.
//
//

#import "IndividualPlayerScoreSum.h"

@interface IndividualPlayerScoreSum ()

@end

@implementation IndividualPlayerScoreSum
@synthesize testScoreLabel;
@synthesize myScrollView;


Player* holdPlayer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setPlayerForHoleScores:(Player *)p{
    
    holdPlayer = p;
}

- (void) setScoreLabels{
    
    int playerScore = [holdPlayer scoreForHole1];
    NSString* playerScoreString = [NSString stringWithFormat:@"%d", playerScore];
    testScoreLabel.text = playerScoreString;
    
    //right now if player has no score then the default value is w/e the last player was
}

- (void) populateScrollView{
    
    
    CGPoint pt = CGPointMake(200,52);
    
    float maxHeight = 0;
    NSString* descString = @"      Hole ";
    
    for(int i = 1; i<19; i++){
        
        //set score label
        UILabel *myLabel = [[UILabel alloc] init];
        
        // careful about using i and i + 1
        int scoreForHole = [self getHoleScoreForPlayer:holdPlayer forHole:i];
        
        NSString *intString = [NSString stringWithFormat:@"%d", scoreForHole];
        
        myLabel.text = intString;
        
        myLabel.font = [UIFont boldSystemFontOfSize:18.0];
        myLabel.textColor = [UIColor whiteColor];
        
        myLabel.backgroundColor = [UIColor clearColor];
        
        // x number modified here for view
        [myLabel setFrame:CGRectMake(pt.x + 60 ,pt.y,40,22)];
        [myScrollView addSubview:myLabel];
        
        //set descriptor for score label
        
        UILabel *descLabel = [[UILabel alloc] init];
        
        NSString *holeNumberString = [NSString stringWithFormat:@"%d", i];
        NSString *descWithHoleNumber = [descString stringByAppendingString:holeNumberString];
        
        //length stuff
        if(i<10){
        descWithHoleNumber = [descWithHoleNumber stringByAppendingString:@" - - - - - - - - - - - - "];
        }
        else{
            descWithHoleNumber = [descWithHoleNumber stringByAppendingString:@" - - - - - - - - - - - "];
        }
        
        descLabel.text = descWithHoleNumber;
        descLabel.textColor = [UIColor whiteColor];
        
        descLabel.font = [UIFont boldSystemFontOfSize:18.0];
        descLabel.backgroundColor = [UIColor clearColor];
        
        [descLabel setFrame:CGRectMake(pt.x - 180,pt.y,280,22)];
        [myScrollView addSubview:descLabel];
        
        pt.y = pt.y + 22;
        
        maxHeight = pt.y + 10;
    }
    
    //Total score added at end
    UILabel *myLabel = [[UILabel alloc] init];
    
    //add extra row
    pt.y = pt.y + 22;
    
    // careful about using i and i + 1
    int scoreForHole = [self getTotalScoreForPlayer:holdPlayer];
    
    NSString *intString = [NSString stringWithFormat:@"%d", scoreForHole];
    
    myLabel.text = intString;
    
    myLabel.font = [UIFont boldSystemFontOfSize:20.0];
    myLabel.textColor = [UIColor whiteColor];
    
    myLabel.backgroundColor = [UIColor clearColor];
    
    // x number modified here for view
    [myLabel setFrame:CGRectMake(pt.x + 60 ,pt.y,40,22)];
    [myScrollView addSubview:myLabel];
    
    maxHeight = maxHeight + 44;
    
    
    
    [myScrollView setContentSize:CGSizeMake([myScrollView bounds].size.width, maxHeight)];
    
    
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



- (int) getHoleScoreForPlayer: (Player *) p forHole: (int) h{
    
    //LOL bad coding
    
    switch(h)
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




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //change title
    NSString *titleString = @"Scores for ";
    titleString = [titleString stringByAppendingString:holdPlayer.name];
    
    self.navigationItem.title = titleString;
    
    //set background image
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_notext"]];
    
    
    
    [self setScoreLabels];
    [self populateScrollView];
}

- (void)viewDidUnload
{
    [self setTestScoreLabel:nil];
    [self setMyScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}





@end
