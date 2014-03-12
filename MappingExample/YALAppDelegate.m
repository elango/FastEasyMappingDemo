//
//  YALAppDelegate.m
//  MappingExample
//
//  Created by dshe on 3/11/14.
//  Copyright (c) 2014 Yalantis. All rights reserved.
//

#import "YALAppDelegate.h"

#import "MagicalRecord+Setup.h"
#import "NSManagedObjectContext+MagicalRecord.h"
#import "MappingProvider.h"
#import "Person.h"
#import "NSManagedObject+MagicalDataImport.h"

@implementation YALAppDelegate

- (void)setupCoreData {
	[MagicalRecord setupAutoMigratingCoreDataStack];
}

- (NSArray *)generateJSON {
	NSMutableArray *output = [NSMutableArray array];
	for (NSUInteger index = 0; index < 500; index++) {
		NSDictionary *person = @{
			@"id": @(index),
			@"name": [NSString stringWithFormat:@"name %ld", (long)index],
			@"email": [NSString stringWithFormat:@"%ld@email.com", (long)index],
			@"phones": @[
				@{
					@"id": @(index * 5 + 0),
					@"number": @"11111",
					@"ddi": @"ddivalue",
					@"ddd": @"dddvalue",
				},
				@{
					@"id": @(index * 5 + 1),
					@"number": @"11111",
					@"ddi": @"ddivalue",
					@"ddd": @"dddvalue",
				},
				@{
					@"id": @(index * 5 + 2),
					@"number": @"11111",
					@"ddi": @"ddivalue",
					@"ddd": @"dddvalue",
				},
				@{
					@"id": @(index * 5 + 3),
					@"number": @"11111",
					@"ddi": @"ddivalue",
					@"ddd": @"dddvalue",
				},
				@{
					@"id": @(index * 5 + 4),
					@"number": @"11111",
					@"ddi": @"ddivalue",
					@"ddd": @"dddvalue",
				},
			],
		};

		[output addObject:person];
	}

	return output;
}

- (void)importJSON:(NSArray *)JSON {
	NSManagedObjectContext *context = [NSManagedObjectContext MR_rootSavingContext];

	CFTimeInterval before = CFAbsoluteTimeGetCurrent();

//    [Person MR_importFromArray:JSON inContext:context];

//    [EKMapper arrayOfObjectsFromExternalRepresentation:JSON
//                                           withMapping:[MappingProvider personWithPhonesMappingOriginal]
//                                inManagedObjectContext:context];
//    
//	[EMKManagedObjectDeserializer deserializeCollectionExternalRepresentation:JSON
//	                                                             usingMapping:[MappingProvider personWithPhonesMapping]
//				                                                      context:context];

	[context save:NULL];

	CFTimeInterval after = CFAbsoluteTimeGetCurrent() - before;

	NSLog(@"It takes: %f", after);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[self setupCoreData];

	[self importJSON:[self generateJSON]];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[self.window setRootViewController:[UIViewController new]];
    [self.window makeKeyAndVisible];

	return YES;
}

@end
