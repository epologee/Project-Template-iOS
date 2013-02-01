#import "___VARIABLE_classPrefix:identifier___Theme.h"

static id <___VARIABLE_classPrefix:identifier___Theme> _currentTheme;

@implementation ___VARIABLE_classPrefix:identifier___Theme

+ (id <___VARIABLE_classPrefix:identifier___Theme>)currentTheme
{
	NSAssert(_currentTheme != nil, @"Use `setCurrentTheme` before accessing `currentTheme`");
	return _currentTheme;
}

+ (void)setCurrentTheme:(id <___VARIABLE_classPrefix:identifier___Theme>)theme
{
	static dispatch_once_t onceToken;

	dispatch_once(&onceToken, ^{_currentTheme = theme;});
}

- (CGSize)UIOffsetValueToCGSize:(NSValue *)offsetValue
{
	if (offsetValue == nil)
	{
		return CGSizeZero;
	}

	UIOffset offset = offsetValue ? [offsetValue UIOffsetValue] : UIOffsetZero;
	return CGSizeMake(offset.horizontal, offset.vertical);
}

@end

@implementation NSDictionary (___VARIABLE_classPrefix:identifier___Theme)

- (void)forAttribute:(id)attribute performBlock:(void (^)(id value))block
{
	if (self[attribute])
	{
		block(self[attribute]);
	}
}

@end