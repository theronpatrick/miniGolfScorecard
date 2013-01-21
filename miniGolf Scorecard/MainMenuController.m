//
//  MainMenuController.m
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 9/4/12.
//
//

#import "MainMenuController.h"
#import "GameManager.h"

#import <QuartzCore/QuartzCore.h>


@interface MainMenuController ()


@end



@implementation MainMenuController

@synthesize pinkBall;
@synthesize blueBall;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    
    [self delayBeforeAnimation];
    
	
    
    
}

-(void) delayBeforeAnimation{
    //artificial delay, moving off screen
    CGRect newFrame = blueBall.frame;
    newFrame.origin.x = 25;
    newFrame.origin.y = -35;
    
    
    [UIView animateWithDuration:0.2f
                     animations:^{
                         blueBall.frame=newFrame;}
                     completion:^(BOOL finished){
                         
                         [self animateCurve];
                     }
     ];
}



-(void) animateCurve{
    UIBezierPath *customPath = [UIBezierPath bezierPath];
    
    
    
    //make multiple little bounces 
    [customPath moveToPoint:CGPointMake(-60,170)];
    [customPath addQuadCurveToPoint:CGPointMake(30, 170) controlPoint:CGPointMake(-30, -80)];
    [customPath addQuadCurveToPoint:CGPointMake(80, 170) controlPoint:CGPointMake(45, -40)];
    [customPath addQuadCurveToPoint:CGPointMake(130, 170) controlPoint:CGPointMake(105, -10)];
    [customPath addQuadCurveToPoint:CGPointMake(180, 170) controlPoint:CGPointMake(155, 25)];
    [customPath addQuadCurveToPoint:CGPointMake(220, 170) controlPoint:CGPointMake(200, 85)];
    [customPath addQuadCurveToPoint:CGPointMake(260, 170) controlPoint:CGPointMake(240, 105)];
    [customPath addQuadCurveToPoint:CGPointMake(320, 170) controlPoint:CGPointMake(290, 120)];
    
    
    


    
    //hide from screen
    [customPath addLineToPoint:CGPointMake(350, 515)];
    
    
    UIImage *movingImage = [UIImage imageNamed:@"blueBall"];
    CALayer *movingLayer = [CALayer layer];
    movingLayer.contents = (id)movingImage.CGImage;
    movingLayer.anchorPoint = CGPointZero;
    movingLayer.frame = CGRectMake(0.0f, 0.0f, movingImage.size.width, movingImage.size.height);
    [self.view.layer addSublayer:movingLayer];
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.duration = 4.0f;
    pathAnimation.path = customPath.CGPath;
    pathAnimation.calculationMode = kCAAnimationLinear;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    
    
    //pathAnimation.repeatCount = 5;
    [movingLayer addAnimation:pathAnimation forKey:@"movingAnimation"];
    
    
    
}

- (void)viewDidUnload
{
    [self setPinkBall:nil];
    [self setBlueBall:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
