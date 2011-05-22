//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Stephen Ogletree on 5/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

- (void) setOperand:(double)anOperand
{
    operand = anOperand;
}

- (void) performWaitingOperation
{
    if ([@"+" isEqual:waitingOperation]) {
        operand = waitingOperand + operand;
    } else if ([@"-" isEqual:waitingOperation]) {
        operand = waitingOperand - operand;
    } else if ([@"*" isEqual:waitingOperation]) {
        operand = waitingOperand * operand;
    } else if ([@"/" isEqual:waitingOperation]) {
        if (operand) 
            operand = waitingOperand / operand;
    }
}

- (double) performOperation:(NSString *)operation
{
    if ([operation isEqual:@"C"]) {
        waitingOperation = 0;
        waitingOperand = 0;
        memory = 0;
        operand = 0;
    } else if ([operation isEqual:@"+/-"]) {
        operand = -operand;
    } else if ([operation isEqual:@"sqrt"]) {
        operand = sqrt(operand);
    } else if ([operation isEqual:@"1/x"]) {
        if (operand)
            operand = 1/operand;
    } else if ([operation isEqual:@"sin"]) {
        operand = sin(operand);
    } else if ([operation isEqual:@"cos"]) {
        operand = cos(operand);
    } else if ([operation isEqual:@"store"]) {
        memory = operand;
    } else if ([operation isEqual:@"recall"]) {
        operand = memory;
    } else if ([operation isEqual:@"mem+"]) {
        memory = memory + operand;
    } else {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}

- (double) getOperand 
{
    return operand;
}

- (NSString *) getWaitingOperation
{
    return waitingOperation;
}

- (double) getWaitingOperand
{
    return waitingOperand;
}

- (double) getMemory
{
    return memory;
}

@end
