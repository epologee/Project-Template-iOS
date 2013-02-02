#import "___VARIABLE_classPrefix:identifier___CoreDataProxy.h"

@interface ___VARIABLE_classPrefix:identifier___DataProxy () <TTAbstractDataProxyProtected>

@end

@implementation ___VARIABLE_classPrefix:identifier___DataProxy

+ (___VARIABLE_classPrefix:identifier___DataProxy *)sharedModel
{
	static ___VARIABLE_classPrefix:identifier___DataProxy *_sharedModel = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedModel = [[___VARIABLE_classPrefix:identifier___DataProxy alloc] initWithStoreName:@"___PACKAGENAMEASIDENTIFIER___"];
	});

	return _sharedModel;
}

@end