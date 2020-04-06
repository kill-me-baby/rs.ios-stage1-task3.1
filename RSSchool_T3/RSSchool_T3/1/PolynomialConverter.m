#import "PolynomialConverter.h"

@implementation PolynomialConverter

- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    
    NSArray* myArray = [NSArray arrayWithArray:numbers];
    
    if (myArray.count == 0) {
        
        return nil;
    }
    
    NSArray* filteredArray = [self checkArray:myArray];
    
    NSString* result = [self convertFromFilteredArrayToString:filteredArray];
    
    return result;
}

- (NSArray*)checkArray:(NSArray*)array {
    
    NSMutableArray* filteredArray = [[NSMutableArray alloc] init];
    
    NSInteger index = array.count - 1;
    
    for (NSInteger i = 0; i < array.count; i++) {
        
        if ([array[i] isEqual:@(0)]) {
            
            index -= 1;
            
            continue;
        }
        
        if (array[i] != nil) {
            
            switch ([array[i] integerValue]) {
                case 1:
                    [filteredArray addObject:@"x"];
                    index -= 1;
                    continue;
                case -1:
                    [filteredArray addObject:@"-x"];
                    index -= 1;
                    continue;
                default:
                    break;
            }
            
            if (index == 1) {
                
                [filteredArray addObject:[NSMutableString stringWithFormat:@"%@x", array[i]]];
                
                index -= 1;
                
                continue;
            } else if (index == 0) {
                
                [filteredArray addObject:array[i]];
                
                break;
            }
            
            [filteredArray addObject:[NSMutableString stringWithFormat:@"%@x^%ld", array[i], index]];
            
            index -= 1;
        } else {
            
            index -= 1;
        }
    }
    
    return filteredArray;
}

- (NSString*)convertFromFilteredArrayToString:(NSArray*)array {
    
    NSMutableString* result = [NSMutableString stringWithFormat:@""];
    
    for (NSInteger index = 0; index < array.count ; index++) {
        
        if ([result isEqualToString:@""]) {
            
            [result appendFormat:@"%@", array[index]];
            
            continue;
        }
        
        NSString* strElement = [[NSString alloc] init];
        
        if ([array[index] isKindOfClass:[NSNumber class]]) {
            
            strElement = [array[index] stringValue];
        } else {
            
            strElement = array[index];
        }
        
        if ([strElement hasPrefix:@"-"]) {
            
            NSMutableString* elementOfArray = [NSMutableString stringWithFormat:@"%@", array[index]];
            
            [elementOfArray deleteCharactersInRange:NSMakeRange(0, 1)];
            
            [result appendFormat:@" - %@", elementOfArray];
        } else {
            
            [result appendFormat:@" + %@", array[index]];
        }
    }
    
    return result;
}

@end
