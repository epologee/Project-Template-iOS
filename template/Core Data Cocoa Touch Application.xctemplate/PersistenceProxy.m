#import "___VARIABLE_classPrefix:identifier___PersistenceProxy.h"

@interface ___VARIABLE_classPrefix:identifier___PersistenceProxy () <TTAbstractPersistenceProxyProtected>

@end

@implementation ___VARIABLE_classPrefix:identifier___PersistenceProxy

+ (___VARIABLE_classPrefix:identifier___PersistenceProxy *)sharedProxy
{
	static ___VARIABLE_classPrefix:identifier___PersistenceProxy *_sharedProxy = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedProxy = [[___VARIABLE_classPrefix:identifier___PersistenceProxy alloc] initWithStoreName:@"___PACKAGENAMEASIDENTIFIER___"];
	});

	return _sharedProxy;
}

@end