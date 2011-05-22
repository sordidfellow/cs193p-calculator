//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Stephen Ogletree on 5/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

- (CalculatorBrain *) brain
{
    if (!brain)
        brain = [[CalculatorBrain alloc] init];
    return brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [[sender titleLabel] text];
    NSString *curStr = [display text];
    if (!userIsInTheMiddleOfTypingANumber)
        curStr = @"";
    userIsInTheMiddleOfTypingANumber = YES;

    // validate the digit - we don't allow multiple dots
    if ([digit isEqual:@"."]) {
        NSRange range = [curStr rangeOfString:@"."];
        if (range.location == NSNotFound)
            [display setText:[curStr stringByAppendingString:digit]];
    } else if ([digit isEqual:@"pi"]) {
        NSString *piStr = [NSString stringWithFormat:@"%g", (22.0/7.0)];
        [display setText:piStr];
    } else {
        [display setText:[curStr stringByAppendingString:digit]];
    }

    [operandDisplay setText:[NSString stringWithFormat:@"%g", [[self brain] getOperand]]];
    [waitingOperationDisplay setText:[[self brain] getWaitingOperation]];
    [waitingOperandDisplay setText:[NSString stringWithFormat:@"%g", [[self brain] getWaitingOperand]]];
    [memoryDisplay setText:[NSString stringWithFormat:@"%g", [[self brain] getMemory]]];
}

- (IBAction)operationPressed:(UIButton *)sender
{
    NSString *operation = [[sender titleLabel] text];

    if ([operation isEqual:@"BS"]) {
        NSString *curStr = [display text];
        if (![curStr isEqual:@""])
            [display setText:[curStr substringToIndex:([curStr length]-1)]];
        return;
    }
        
    if (userIsInTheMiddleOfTypingANumber) {
        [[self brain] setOperand:[[display text] doubleValue]];
        userIsInTheMiddleOfTypingANumber = NO;
    }
    
    double result = [[self brain] performOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g", result]];
    
    [operandDisplay setText:[NSString stringWithFormat:@"%g", [[self brain] getOperand]]];
    [waitingOperationDisplay setText:[[self brain] getWaitingOperation]];
    [waitingOperandDisplay setText:[NSString stringWithFormat:@"%g", [[self brain] getWaitingOperand]]];
    [memoryDisplay setText:[NSString stringWithFormat:@"%g", [[self brain] getMemory]]];
}


- (IBAction) degRadToggle:(UISegmentedControl *) sender;
{
    if ([sender selectedSegmentIndex] == 1)
        [[self brain] setUseDegrees:YES];
    else
        [[self brain] setUseDegrees:NO];    
}









- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
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
