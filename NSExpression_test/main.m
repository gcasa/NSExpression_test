//
//  main.m
//  NSExpression_test
//
//  Created by Gregory John Casamento on 5/27/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSExpression *expression = [NSExpression expressionWithFormat: @"%d*%f",3,3.5];
        NSLog(@"%@",[expression expressionValueWithObject:nil context:nil]);
        
        NSExpression *expression2 = [NSExpression expressionWithFormat: @"%f*%f" argumentArray:@[@3.4,@3.1]];
        NSLog(@"%@",[expression2 expressionValueWithObject:nil context:nil]);
    }
    return 0;
}
