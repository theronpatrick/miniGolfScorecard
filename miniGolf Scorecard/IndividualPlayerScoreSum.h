//
//  IndividualPlayerScoreSum.h
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 8/25/12.
//
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface IndividualPlayerScoreSum : UIViewController{
    
}

@property (strong, nonatomic) IBOutlet UILabel *testScoreLabel;

@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;



- (void)setPlayerForHoleScores:(Player*) p;

@end
