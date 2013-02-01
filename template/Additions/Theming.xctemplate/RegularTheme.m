#import "TTLog.h"
#import "___VARIABLE_classPrefix:identifier___RegularTheme.h"

#define ___VARIABLE_classPrefix:identifier___AttributeTextAlignment @"___VARIABLE_classPrefix:identifier___AttributeTextAlignment"
#define ___VARIABLE_classPrefix:identifier___AttributeLineBreakMode @"___VARIABLE_classPrefix:identifier___AttributeLineBreakMode"
#define ___VARIABLE_classPrefix:identifier___AttributeBackgroundColor @"___VARIABLE_classPrefix:identifier___AttributeBackgroundColor"
#define ___VARIABLE_classPrefix:identifier___AttributeTextStyle @"___VARIABLE_classPrefix:identifier___AttributeTextStyle"
#define ___VARIABLE_classPrefix:identifier___AttributeBackgroundImage @"___VARIABLE_classPrefix:identifier___AttributeBackgroundImage"
#define ___VARIABLE_classPrefix:identifier___AttributeTitleEdgeInsets @"___VARIABLE_classPrefix:identifier___AttributeTitleEdgeInsets"
#define ___VARIABLE_classPrefix:identifier___AttributeContentHorizontalAlignment @"___VARIABLE_classPrefix:identifier___AttributeContentHorizontalAlignment"
#define ___VARIABLE_classPrefix:identifier___AttributeTitleColor @"___VARIABLE_classPrefix:identifier___AttributeTitleColor"
#define ___VARIABLE_classPrefix:identifier___AttributeNumberOfLines @"___VARIABLE_classPrefix:identifier___AttributeNumberOfLines"

@implementation UIFont (___VARIABLE_classPrefix:identifier___RegularTheme)

+ (UIFont *)safeFontWithName:(NSString *)fontName fontSize:(CGFloat)fontSize
{
	UIFont *font = [self fontWithName:fontName size:fontSize];
	if (font == nil)
	{
		ELog(@"FontName `%@` not found", fontName);
		font = [self systemFontOfSize:fontSize];
	}
	return font;
}

+ (UIFont *)___VARIABLE_classPrefix:identifier___BoldFontWithSize:(CGFloat)fontSize
{
	return [self safeFontWithName:@"CenturyGothic-Bold" fontSize:fontSize];
}

+ (UIFont *)___VARIABLE_classPrefix:identifier___RegularFontWithSize:(CGFloat)fontSize
{
	return [self safeFontWithName:@"CenturyGothic" fontSize:fontSize];
}

@end

@implementation ___VARIABLE_classPrefix:identifier___RegularTheme

- (id)init
{
    self = [super init];
    
    if (self)
    {
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"Color-Blue.png"] forBarMetrics:UIBarMetricsDefault];

        NSDictionary* attrs = @{
            UITextAttributeTextShadowColor: [UIColor clearColor],
            UITextAttributeFont: [UIFont ___VARIABLE_classPrefix:identifier___BoldFontWithSize:18.0]
        };
        
        [[UINavigationBar appearance] setTitleTextAttributes:attrs];
		if ([[UINavigationBar appearance] respondsToSelector:@selector(setShadowImage:)])
		{
			[[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
		}
    }
    
    return self;
}

- (NSDictionary *)attributesForTextStyle:(___VARIABLE_classPrefix:identifier___TextStyle)style forControlState:(UIControlState)controlState
{
	NSMutableDictionary *attributes = [@{
			// An NSValue instance wrapping a UIOffset struct is expected.
			UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero],
			// Default is centered text, overwrite where a different alignment is needed
			___VARIABLE_classPrefix:identifier___AttributeTextAlignment : @(NSTextAlignmentLeft),
	} mutableCopy];

	switch (style)
	{
		default:
			WLog(@"Undetermined style %i - falling back to ___VARIABLE_classPrefix:identifier___TextStylePlain", style);
		case ___VARIABLE_classPrefix:identifier___TextStylePlain:
			attributes[UITextAttributeFont] = [UIFont boldSystemFontOfSize:16];
			attributes[UITextAttributeTextColor] = [UIColor colorWithWhite:0.1 alpha:1];
			attributes[___VARIABLE_classPrefix:identifier___AttributeLineBreakMode] = @(UILineBreakModeWordWrap);
			attributes[___VARIABLE_classPrefix:identifier___AttributeTextAlignment] = @(UITextAlignmentLeft);
			attributes[___VARIABLE_classPrefix:identifier___AttributeNumberOfLines] = @(0);
			break;
	}

	return attributes;
}

- (NSDictionary *)attributesForButtonStyle:(___VARIABLE_classPrefix:identifier___ButtonStyle)style withControlState:(UIControlState)controlState
{
	NSMutableDictionary *attributes = [@{
			___VARIABLE_classPrefix:identifier___AttributeBackgroundColor : [UIColor clearColor],
			___VARIABLE_classPrefix:identifier___AttributeTextStyle : @(___VARIABLE_classPrefix:identifier___TextStylePlain),
	} mutableCopy];

	switch (style)
	{
		default:
			WLog(@"Undetermined style %i - falling back to ___VARIABLE_classPrefix:identifier___ButtonStylePlain", style);
		case ___VARIABLE_classPrefix:identifier___ButtonStylePlain:
			attributes[___VARIABLE_classPrefix:identifier___AttributeTextStyle] = @(___VARIABLE_classPrefix:identifier___TextStylePlain);
			// Example image background for different control states:
			// - attributes[___VARIABLE_classPrefix:identifier___AttributeBackgroundImage] = (controlState & UIControlStateHighlighted) ? [[UIImage imageNamed:@"StretchingYesNoBackground-2-0-highlight"] stretchableImageWithLeftCapWidth:2 topCapHeight:0] : [[UIImage imageNamed:@"StretchingYesNoBackground-2-0"] stretchableImageWithLeftCapWidth:2 topCapHeight:0];
			attributes[___VARIABLE_classPrefix:identifier___AttributeTitleEdgeInsets] = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, 9, 0, 0)];
			attributes[___VARIABLE_classPrefix:identifier___AttributeContentHorizontalAlignment] = @(UIControlContentHorizontalAlignmentLeft);
			attributes[___VARIABLE_classPrefix:identifier___AttributeTitleColor] = [UIColor grayColor];
			break;
	}

	return attributes;
}

- (void)applyTextStyle:(___VARIABLE_classPrefix:identifier___TextStyle)style toLabel:(UILabel *)label
{
	[self applyTextStyle:style toLabel:label forControlState:UIControlStateNormal];
}

- (void)applyTextStyle:(___VARIABLE_classPrefix:identifier___TextStyle)style toLabel:(UILabel *)label forControlState:(UIControlState)controlState
{
	label.backgroundColor = [UIColor clearColor];
	label.opaque = NO;

	NSDictionary *attributes = [self attributesForTextStyle:style forControlState:controlState];

	[attributes forAttribute:UITextAttributeFont performBlock:^(id value) {label.font = value;}];
	[attributes forAttribute:UITextAttributeTextColor performBlock:^(id value) {label.textColor = value;}];
	[attributes forAttribute:UITextAttributeTextShadowColor performBlock:^(id value) {label.shadowColor = value;}];
	[attributes forAttribute:UITextAttributeTextShadowOffset performBlock:^(id value) {label.shadowOffset = [self UIOffsetValueToCGSize:value];}];
	[attributes forAttribute:___VARIABLE_classPrefix:identifier___AttributeTextAlignment performBlock:^(id value) {label.textAlignment = [value integerValue];}];
	[attributes forAttribute:___VARIABLE_classPrefix:identifier___AttributeLineBreakMode performBlock:^(id value) {
		label.lineBreakMode = [value integerValue];
		label.numberOfLines = 0;
	}];
	[attributes forAttribute:___VARIABLE_classPrefix:identifier___AttributeNumberOfLines performBlock:^(id value) {label.numberOfLines = [value integerValue];}];
}

- (void)applyTextStyle:(___VARIABLE_classPrefix:identifier___TextStyle)style toTextField:(UITextField *)textField
{
	NSDictionary *attributes = [self attributesForTextStyle:style forControlState:UIControlStateNormal];

	[attributes forAttribute:UITextAttributeFont performBlock:^(id value) {textField.font = value;}];
	[attributes forAttribute:UITextAttributeTextColor performBlock:^(id value) {textField.textColor = value;}];
	[attributes forAttribute:___VARIABLE_classPrefix:identifier___AttributeTextAlignment performBlock:^(id value) {textField.textAlignment = [value integerValue];}];
}

- (void)applyButtonStyle:(___VARIABLE_classPrefix:identifier___ButtonStyle)style toButton:(UIButton *)button
{
	NSArray *controlStates = @[@(UIControlStateNormal), @(UIControlStateHighlighted), @(UIControlStateSelected), @(UIControlStateDisabled)];

	for (NSNumber *controlStateNumber in controlStates)
	{
		NSInteger controlState = [controlStateNumber integerValue];
		NSDictionary *buttonAttributes = [self attributesForButtonStyle:style withControlState:controlState];

		[buttonAttributes forAttribute:___VARIABLE_classPrefix:identifier___AttributeTextStyle performBlock:^(id value) {[self applyTextStyle:[value integerValue] toLabel:button.titleLabel forControlState:controlState];}];
		[buttonAttributes forAttribute:___VARIABLE_classPrefix:identifier___AttributeBackgroundImage performBlock:^(id value) {[button setBackgroundImage:value forState:controlState];}];
		[buttonAttributes forAttribute:___VARIABLE_classPrefix:identifier___AttributeTitleColor performBlock:^(id value) {[button setTitleColor:value forState:controlState];}];

		if (controlState == UIControlStateNormal)
		{
			[buttonAttributes forAttribute:___VARIABLE_classPrefix:identifier___AttributeBackgroundColor performBlock:^(id value) {button.backgroundColor = value;}];
			[buttonAttributes forAttribute:___VARIABLE_classPrefix:identifier___AttributeTitleEdgeInsets performBlock:^(id value) {[button setTitleEdgeInsets:[value UIEdgeInsetsValue]];}];
			[buttonAttributes forAttribute:___VARIABLE_classPrefix:identifier___AttributeContentHorizontalAlignment performBlock:^(id value) {[button setContentHorizontalAlignment:[value integerValue]];}];
		}
	}
}

@end