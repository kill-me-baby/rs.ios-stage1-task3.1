#import "ViewController.h"

@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self InitializeViews];
    
    [self activateAccessebilityIdentifiers];
}

- (void)InitializeViews {
    
    //MARK:- Views and Labels
    
    self.labelResultColor = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 90, 30)];
    self.labelResultColor.text = @"Color";
    [self.view addSubview:self.labelResultColor];
    
    self.viewResultColor = [[UIView alloc]initWithFrame:CGRectMake(self.labelResultColor.bounds.size.width + 40,
                                                                   self.labelResultColor.frame.origin.y,
                                                                   self.view.bounds.size.width - self.labelResultColor.bounds.size.width - 60, 30)];
    self.viewResultColor.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:self.viewResultColor];
    
    self.labelRed = [[UILabel alloc] initWithFrame:CGRectMake(20, self.labelResultColor.frame.origin.y + 60,
                                                              70, 30)];
    self.labelRed.text = @"RED";
    [self.view addSubview:self.labelRed];
    
    self.labelGreen = [[UILabel alloc] initWithFrame:CGRectMake(20, self.labelRed.frame.origin.y + 60, 70, 30)];
    self.labelGreen.text = @"GREEN";
    [self.view addSubview:self.labelGreen];
    
    self.labelBlue = [[UILabel alloc] initWithFrame:CGRectMake(20, self.labelGreen.frame.origin.y + 60, 70, 30)];
    self.labelBlue.text = @"BLUE";
    [self.view addSubview:self.labelBlue];
    
    //MARK:- TextFields
    
    self.textFieldRed = [[UITextField alloc] initWithFrame:CGRectMake(self.labelRed.bounds.size.width + 40,
                                                                      self.labelRed.frame.origin.y,
                                                                      self.viewResultColor.bounds.size.width + 20, 30)];
    self.textFieldRed.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldRed.placeholder = @"0..255";
    self.textFieldRed.delegate = self;
    [self.view addSubview:self.textFieldRed];
    
    self.textFieldGreen = [[UITextField alloc] initWithFrame:CGRectMake(self.labelGreen.bounds.size.width + 40,
                                                                        self.labelGreen.frame.origin.y,
                                                                        self.textFieldRed.bounds.size.width, 30)];
    self.textFieldGreen.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldGreen.placeholder = @"0..255";
    self.textFieldGreen.delegate = self;
    [self.view addSubview:self.textFieldGreen];
    
    self.textFieldBlue = [[UITextField alloc] initWithFrame:CGRectMake(self.labelBlue.bounds.size.width + 40,
                                                                       self.labelBlue.frame.origin.y,
                                                                       self.textFieldGreen.bounds.size.width, 30)];
    self.textFieldBlue.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldBlue.placeholder = @"0..255";
    self.textFieldBlue.delegate = self;
    [self.view addSubview:self.textFieldBlue];
    
    //MARK: - Buttons -
    
    self.buttonProcess = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2 - 40,
                                                                    self.textFieldBlue.frame.origin.y + 80,
                                                                    80, 40)];
    [self.buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [self.buttonProcess setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [self.buttonProcess addTarget:self action:@selector(processButton)
                 forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonProcess];
}

- (void)activateAccessebilityIdentifiers {
    
    self.view.accessibilityIdentifier = @"mainView";
    
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    
    self.buttonProcess.accessibilityIdentifier = @"buttonProcess";
    
    self.labelRed.accessibilityIdentifier = @"labelRed";
    
    self.labelGreen.accessibilityIdentifier = @"labelGreen";
    
    self.labelBlue.accessibilityIdentifier = @"labelBlue";
    
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
}

//MARK:- Actions

- (void)processButton {
    
    [self.textFieldRed resignFirstResponder];
    
    [self.textFieldGreen resignFirstResponder];
    
    [self.textFieldBlue resignFirstResponder];
    
    
    if ([self checkSymbols]) {
        
        if ([self checkConditionForRed] && [self checkConditionForGreen] && [self checkConditionForBlue]) {
            
            CGFloat cgfRed = self.textFieldRed.text.floatValue;
            
            CGFloat cgfGreen = self.textFieldGreen.text.floatValue;
            
            CGFloat cgfBlue = self.textFieldBlue.text.floatValue;
            
            UIColor* resultColor = [UIColor colorWithRed:cgfRed/255 green:cgfGreen/255 blue:cgfBlue/255 alpha:1];
            
            self.viewResultColor.backgroundColor = resultColor;
            
            self.labelResultColor.text = [self hexStringForColor:resultColor];
        } else {
            
            self.labelResultColor.text = @"Error";
        }
    } else {
        
        self.labelResultColor.text = @"Error";
    }
    
    self.textFieldRed.text = @"";
    
    self.textFieldGreen.text = @"";
    
    self.textFieldBlue.text = @"";
}

//MARK:- Check conditions

- (BOOL)checkConditionForRed {
    
    NSIndexSet* condition = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 256)];
    
    NSInteger redValue = self.textFieldRed.text.integerValue;
    
    NSInteger redLength = self.textFieldRed.text.length;
    
    return ([condition containsIndex:redValue] && redLength != 0);
}

- (BOOL)checkConditionForGreen {
    
    NSIndexSet* condition = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 256)];
    
    NSInteger greenValue = self.textFieldGreen.text.integerValue;
    
    NSInteger greenLength = self.textFieldGreen.text.length;
    
    return ([condition containsIndex:greenValue] && greenLength != 0);
}

- (BOOL)checkConditionForBlue {
    
    NSIndexSet* condition = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 256)];
    
    NSInteger blueValue = self.textFieldBlue.text.integerValue;
    
    NSInteger blueLength = self.textFieldBlue.text.length;
    
    return ([condition containsIndex:blueValue] && blueLength != 0);
}

- (BOOL)checkSymbols {
    
    NSCharacterSet* notNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    
    if (self.textFieldBlue.text.length && self.textFieldRed.text.length && self.textFieldGreen.text.length &&
        [self.textFieldRed.text rangeOfCharacterFromSet:notNumbers].location == NSNotFound &&
        [self.textFieldGreen.text rangeOfCharacterFromSet:notNumbers].location == NSNotFound &&
        [self.textFieldBlue.text rangeOfCharacterFromSet:notNumbers].location == NSNotFound) {
        
        return true;
    }
    
    return false;
}

//MARK:- Methods

- (NSString*)hexStringForColor:(UIColor*)color {
    
    const CGFloat* components = CGColorGetComponents(color.CGColor);
    
    CGFloat red = components[0];
    
    CGFloat green = components[1];
    
    CGFloat blue = components[2];
    
    NSString* hexString=[NSString stringWithFormat:@"0x%02X%02X%02X", (int)(red * 255), (int)(green * 255),
                         (int)(blue * 255)];
    
    return hexString;
}

//MARK:- Methods delegates

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    self.labelResultColor.text = @"Color";
    
    [self becomeFirstResponder];
}

@end
