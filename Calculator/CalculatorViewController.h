//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Stephen Ogletree on 5/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalculatorViewController : UIViewController {
    CalculatorBrain *brain;
    IBOutlet UILabel * display;
    IBOutlet UILabel * operandDisplay;
    IBOutlet UILabel * waitingOperationDisplay;
    IBOutlet UILabel * waitingOperandDisplay;
    IBOutlet UILabel * memoryDisplay;
    BOOL userIsInTheMiddleOfTypingANumber;
}

- (IBAction) digitPressed:(UIButton *) sender;
- (IBAction) operationPressed:(UIButton *) sender;

@end
