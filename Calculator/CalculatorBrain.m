//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Stephen Ogletree on 5/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

- (void) showWarningWithTitle:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] init];
    [alert setTitle:title];
    [alert setMessage:message];
    [alert addButtonWithTitle:@"OK"];
    [alert show];
}

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
        else
            [self showWarningWithTitle:@"Error" andMessage:@"Cannot divide by 0"];
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
        else
            [self showWarningWithTitle:@"Error" andMessage:@"Cannot divide by 0"];
    } else if ([operation isEqual:@"sin"]) {
        if (useDegrees)
            operand = sin(operand*(22.0/7.0/180.0));
        else
            operand = sin(operand);
    } else if ([operation isEqual:@"cos"]) {
        if (useDegrees)
            operand = cos(operand*(22.0/7.0/180.0));
        else
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

- (void) setUseDegrees:(BOOL) shouldUseDegrees
{
    useDegrees = shouldUseDegrees;
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
