#import "KIFTestScenario+___VARIABLE_classPrefix:identifier___TestScenario.h"
#import "KIFTestStep.h"
#import "KIFTestStep+___VARIABLE_classPrefix:identifier___Integrations.h"
#import "___VARIABLE_classPrefix:identifier___LocalizedStrings.h"

@implementation KIFTestScenario (___VARIABLE_classPrefix:identifier___TestScenario)

+ (id)scenarioToConfirmRootViewControllerPresence
{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"When the app starts, the user should be presented with the main view controller."];
    
	[scenario addStep:[KIFTestStep stepToReset]];
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:LS_ROOT_TITLE]];
	
	// https://github.com/square/KIF#example

	return scenario;
}

@end
