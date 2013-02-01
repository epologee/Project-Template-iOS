#import "KIFTestScenario.h"

/**

	Note:	You need to manually duplicate your main target after the project is created, 
			suffix it with ' Integrations' (mind the space). Go into the new target's
			build settings and determine a new value for PRODUCT_NAME (it defaults 
			to something that ends on ' copy') and have the Info.plist file property
			point to the original plist of your application.
			
			When all this is done, run 'pod install' or 'pod update' and your
			integration testing is ready to go.

*/

@interface KIFTestScenario (___VARIABLE_classPrefix:identifier___TestScenario)

+ (id)scenarioToConfirmRootViewControllerPresence;

@end
