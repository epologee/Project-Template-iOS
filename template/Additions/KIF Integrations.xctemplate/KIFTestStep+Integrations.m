#import "KIFTestStep+___VARIABLE_classPrefix:identifier___Integrations.h"

@implementation KIFTestStep (___VARIABLE_classPrefix:identifier___Integrations)

+ (id)stepToReset
{
	return [self stepWithDescription:@"Reset the application state." executionBlock:^(KIFTestStep *step, NSError **error) {
		NSString *domainName = [[NSBundle mainBundle] bundleIdentifier];
		[[NSUserDefaults standardUserDefaults] removePersistentDomainForName:domainName];
        
		KIFTestCondition(YES, error, @"Failed to reset some part of the application.");
        
		return KIFTestStepResultSuccess;
	}];
}

@end
