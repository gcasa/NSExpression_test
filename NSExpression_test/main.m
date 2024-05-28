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
        
        NSExpression *expression3 = [NSExpression expressionForAggregate:[NSArray arrayWithObjects: expression, expression2, nil]];
        NSLog(@"%@",[expression3 expressionValueWithObject:nil context:nil]);
        
        NSExpression *set1 = [NSExpression expressionForAggregate: [NSArray arrayWithObjects:
                                                                    [NSExpression expressionForConstantValue: @"A"],
                                                                    [NSExpression expressionForConstantValue: @"B"],
                                                                    [NSExpression expressionForConstantValue: @"C"], nil]];
        NSExpression *set2 = [NSExpression expressionForAggregate: [NSArray arrayWithObjects:
                                                                    [NSExpression expressionForConstantValue: @"C"],
                                                                    [NSExpression expressionForConstantValue: @"D"],
                                                                    [NSExpression expressionForConstantValue: @"E"], nil]];
        NSExpression *expression4 = [NSExpression expressionForIntersectSet:set1 with:set2];
        NSLog(@"%@",[expression4 expressionValueWithObject:nil context:nil]);
        
        NSExpression *expression5 = [NSExpression expressionForUnionSet:set1 with:set2];
        NSLog(@"%@",[expression5 expressionValueWithObject:nil context:nil]);
        
        NSExpression *expression6 = [NSExpression expressionForMinusSet:set1 with:set2];
        NSLog(@"%@",[expression6 expressionValueWithObject:nil context:nil]);
    }
    return 0;
}
