//
//  MappingProvider.m
//  EasyMappingExample
//
//  Created by Lucas Medeiros on 23/02/13.
//  Copyright (c) 2013 EasyKit. All rights reserved.
//

#import "MappingProvider.h"

@implementation MappingProvider

+ (EMKManagedObjectMapping *)carMapping {
	return [EMKManagedObjectMapping mappingForEntityName:@"Car" configuration:^(EMKManagedObjectMapping *mapping) {
		[mapping setPrimaryKey:@"carID"];
		[mapping addAttributeMappingDictionary:@{@"carID" : @"id"}];
		[mapping addAttributeMappingFromArray:@[@"model", @"year"]];
	}];
}

+ (EMKManagedObjectMapping *)phoneMapping {
	return [EMKManagedObjectMapping mappingForEntityName:@"Phone" configuration:^(EMKManagedObjectMapping *mapping) {
		[mapping setPrimaryKey:@"phoneID"];
		[mapping addAttributeMappingDictionary:@{@"phoneID" : @"id"}];
		[mapping addAttributeMappingFromArray:@[@"number", @"ddd", @"ddi"]];
	}];
}

+ (EMKManagedObjectMapping *)personWithPhonesMapping {
	return [EMKManagedObjectMapping mappingForEntityName:@"Person" configuration:^(EMKManagedObjectMapping *mapping) {
		[mapping setPrimaryKey:@"personID"];
		[mapping addAttributeMappingDictionary:@{@"personID": @"id"}];
		[mapping addAttributeMappingFromArray:@[@"name", @"email"]];
		[mapping addToManyRelationshipMapping:[self phoneMapping] forProperty:@"phones" keyPath:@"phones"];
	}];
}

@end
