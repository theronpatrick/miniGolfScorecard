//
//  infoPage.m
//  miniGolf Scorecard
//
//  Created by Theron Patrick on 8/7/12.
//  Copyright (c) 2012 PSOM. All rights reserved.
//

#import "infoPage.h"

@implementation infoPage

@synthesize playerLabel;
@synthesize playerString;
@synthesize ballColorPicker;
@synthesize ballColorArray;

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

// Picker methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return ballColorArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    return [ballColorArray objectAtIndex:row];
}

- (void)changePlayerString:(Player*) newPlayer{
    
    playerString = newPlayer.name;
    
    tempPlayer = newPlayer;

}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set background image
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_notext"]];
    
    if(tempPlayer == nil){
        tempPlayer = [[Player alloc] init];
    }

    
    playerLabel.text= playerString;
    
    
    ballColorArray = [[NSArray alloc] initWithObjects:@"Black", @"Blue", @"Brown", @"Cyan", @"Green", @"Magenta", @"Orange", @"Purple", @"Red", @"Yellow", @"White", nil];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] init];
    
    label.text = [ballColorArray objectAtIndex:row];
    
    [label setFont:[UIFont boldSystemFontOfSize:20]];
    
    label.backgroundColor = [UIColor clearColor];
    
    
    //set font color based on string
    
    NSString *colorString = [ballColorArray objectAtIndex:row];
    
    //I hate long else-ifs but I guess it has to be done
    
    if([colorString isEqualToString:@"Black"]){
        label.textColor = [UIColor blackColor];
    }
    else if([colorString isEqualToString:@"Blue"]){
        label.textColor = [UIColor blueColor];
    }
    else if([colorString isEqualToString:@"Brown"]){
        label.textColor = [UIColor brownColor];
    }
    else if([colorString isEqualToString:@"Cyan"]){
        label.textColor = [UIColor cyanColor];
    }
    else if([colorString isEqualToString:@"Green"]){
        label.textColor = [UIColor greenColor];
    }
    else if([colorString isEqualToString:@"Magenta"]){
        label.textColor = [UIColor magentaColor];
    }
    else if([colorString isEqualToString:@"Orange"]){
        label.textColor = [UIColor orangeColor];
    }
    else if([colorString isEqualToString:@"Purple"]){
        label.textColor = [UIColor purpleColor];
    }
    else if([colorString isEqualToString:@"Red"]){
        label.textColor = [UIColor redColor];
    }
    else if([colorString isEqualToString:@"Yellow"]){
        label.textColor = [UIColor yellowColor];
    }
    else if([colorString isEqualToString:@"White"]){
        
        // currently the "white" option makes the text gray.  Should investigate
        // different way to implement this
        
        label.textColor = [UIColor grayColor];
        //label.backgroundColor = [UIColor grayColor];
    }
    else{
        label.textColor = [UIColor blackColor];
    }


    
    return label;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    

    
    if ([playerLabel isFirstResponder]){
        [playerLabel resignFirstResponder];
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
        
        tempPlayer.name = playerLabel.text;
        
     
        
        // LOL I suck at coding but here's where color is set
        int row = [ballColorPicker selectedRowInComponent:0];
        
        switch(row)
        {
            case 0:
                tempPlayer.ballColor = [UIColor blackColor];
                break;
            case 1:
                tempPlayer.ballColor = [UIColor blueColor];
                break;
            case 2:
                tempPlayer.ballColor = [UIColor brownColor];
                break;
            case 3:
                tempPlayer.ballColor = [UIColor cyanColor];
                break;
            case 4:
                tempPlayer.ballColor = [UIColor greenColor];
                break;
            case 5:
                tempPlayer.ballColor = [UIColor magentaColor];
                break;
            case 6:
                tempPlayer.ballColor = [UIColor orangeColor];
                break;
            case 7:
                tempPlayer.ballColor = [UIColor purpleColor];
                break;
            case 8:
                tempPlayer.ballColor = [UIColor redColor];
                break;
            case 9:
                tempPlayer.ballColor = [UIColor yellowColor];
                break;
            case 10:
                tempPlayer.ballColor = [UIColor grayColor];
                break;
            default:
                break;
        }
        
        
    }
    [super viewWillDisappear:animated];
}

-(void) okButtonPressed:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)myPlayerLabel {
    myPlayerLabel.text = @"";
}

- (void)viewDidUnload
{
    [self setBallColorPicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
