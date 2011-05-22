//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Stephen Ogletree on 5/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
    double operand;
    NSString * waitingOperation;
    double waitingOperand;
    double memory;
}

- (void) setOperand:(double) anOperand;
- (double) performOperation:(NSString *) operation;

- (double) getOperand;
- (NSString *) getWaitingOperation;
- (double) getWaitingOperand;
- (double) getMemory;

@end
