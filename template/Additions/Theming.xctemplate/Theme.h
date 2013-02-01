#import <Foundation/Foundation.h>

typedef enum
{
	___VARIABLE_classPrefix:identifier___TextStyleUndetermined = -1,
	___VARIABLE_classPrefix:identifier___TextStylePlain
} ___VARIABLE_classPrefix:identifier___TextStyle;

typedef enum
{
	___VARIABLE_classPrefix:identifier___ButtonStyleUndetermined = -1,
	___VARIABLE_classPrefix:identifier___ButtonStylePlain
} ___VARIABLE_classPrefix:identifier___ButtonStyle;

@protocol ___VARIABLE_classPrefix:identifier___Theme <NSObject>

- (void)applyTextStyle:(___VARIABLE_classPrefix:identifier___TextStyle)style toLabel:(UILabel *)label;

- (void)applyTextStyle:(___VARIABLE_classPrefix:identifier___TextStyle)style toLabel:(UILabel *)label forControlState:(UIControlState)controlState;

- (void)applyTextStyle:(___VARIABLE_classPrefix:identifier___TextStyle)style toTextField:(UITextField *)textField;

- (void)applyButtonStyle:(___VARIABLE_classPrefix:identifier___ButtonStyle)style toButton:(UIButton *)button;

@end

@interface ___VARIABLE_classPrefix:identifier___Theme : NSObject

+ (id <___VARIABLE_classPrefix:identifier___Theme>)currentTheme;

+ (void)setCurrentTheme:(id <___VARIABLE_classPrefix:identifier___Theme>)theme;

- (CGSize)UIOffsetValueToCGSize:(NSValue *)offsetValue;

@end

@interface NSDictionary (___VARIABLE_classPrefix:identifier___Theme)

- (void)forAttribute:(id)attribute performBlock:(void (^)(id value))block;

@end