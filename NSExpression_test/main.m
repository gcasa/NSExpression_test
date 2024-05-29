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
        id v = [expression expressionValueWithObject:nil context:nil];
        NSLog(@"%@, %@", v, [v className]);
        
        NSExpression *expression2 = [NSExpression expressionWithFormat: @"%f*%f" argumentArray:@[@3.4,@3.1]];
        NSLog(@"%@",[expression2 expressionValueWithObject:nil context:nil]);
        
        NSExpression *expression3 = [NSExpression expressionForAggregate:[NSArray arrayWithObjects: expression, expression2, nil]];
        id v2 = [expression3 expressionValueWithObject:nil context:nil];
        NSLog(@"%@, %@", v2, [v2 className]);
        
        NSExpression *set1 = [NSExpression expressionForAggregate: [NSArray arrayWithObjects:
                                                                    [NSExpression expressionForConstantValue: @"A"],
                                                                    [NSExpression expressionForConstantValue: @"B"],
                                                                    [NSExpression expressionForConstantValue: @"C"], nil]];
        NSExpression *set2 = [NSExpression expressionForAggregate: [NSArray arrayWithObjects:
                                                                    [NSExpression expressionForConstantValue: @"C"],
                                                                    [NSExpression expressionForConstantValue: @"D"],
                                                                    [NSExpression expressionForConstantValue: @"E"], nil]];
        NSExpression *expression4 = [NSExpression expressionForIntersectSet:set1 with:set2];
        id v4 = [expression4 expressionValueWithObject:nil context:nil];
        NSLog(@"%@, %@", v4, [v4 className]);
        
        NSExpression *expression5 = [NSExpression expressionForUnionSet:set1 with:set2];
        id v5 = [expression5 expressionValueWithObject:nil context:nil];
        NSLog(@"%@, %@, %ld", v5, [[v5 allObjects] objectAtIndex: 0], (unsigned long)[v5 count]);
        
        NSExpression *expression6 = [NSExpression expressionForMinusSet:set1 with:set2];
        NSLog(@"%@",[expression6 expressionValueWithObject:nil context:nil]);
        
        // This should error out...
        NS_DURING
        {
            NSExpression *expression7 = [NSExpression expressionForMinusSet:set1 with:expression2];
            NSLog(@"%@",[expression7 expressionValueWithObject:nil context:nil]);
        }
        NS_HANDLER
        {
            NSLog(@"exception = %@", localException);
        }
        NS_ENDHANDLER;
    }
    return 0;
}
