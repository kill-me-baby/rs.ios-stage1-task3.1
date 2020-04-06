#import "Combinator.h"

@implementation Combinator

- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    
    NSInteger counter = 0;
    
    NSInteger firstElement = [array.firstObject integerValue];
    
    NSInteger lastElement = [array.lastObject integerValue];
    
    NSInteger(^factorial)(NSInteger inputNum);
    
    factorial = ^(NSInteger inputNum) {
        
        NSInteger number = 1;
        
        if (inputNum > 0) {
            
            for (NSInteger i = 1; i <= inputNum; i++) {
                
                number = i * number;
            }
            
            return number;
        } else {
            
            NSInteger oneAsLongInt = 1;
            
            return oneAsLongInt;
        }
    };
    
    while (counter < lastElement) {
        
        counter += 1;
        
        NSInteger result = factorial(lastElement) / (factorial(counter) * factorial(lastElement - counter));
        
        if (result >= firstElement) {
            
            return [NSNumber numberWithInteger:counter];
        }
    }
    
    return nil;
}

@end
