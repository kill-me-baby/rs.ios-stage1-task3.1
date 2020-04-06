#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) UILabel* labelResultColor;

@property (weak, nonatomic) UILabel* labelRed;

@property (weak, nonatomic) UILabel* labelGreen;

@property (weak, nonatomic) UILabel* labelBlue;

@property (weak, nonatomic) UIView* viewResultColor;

@property (weak, nonatomic) UITextField* textFieldRed;

@property (weak, nonatomic) UITextField* textFieldGreen;

@property (weak, nonatomic) UITextField* textFieldBlue;

@property (weak, nonatomic) UIButton* buttonProcess;

@property (weak, nonatomic) UIButton* leftButton;

@property (weak, nonatomic) UIButton* rightButton;

@property (weak, nonatomic) UITextField* textfield;

@end
