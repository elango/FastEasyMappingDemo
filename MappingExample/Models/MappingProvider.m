//
//  MappingProvider.m
//  EasyMappingExample
//
//  Created by Lucas Medeiros on 23/02/13.
//  Copyright (c) 2013 EasyKit. All rights reserved.
//

#import "MappingProvider.h"

@implementation MappingProvider


+ (EKManagedObjectMapping *)phoneMappingOriginal
{
    return [EKManagedObjectMapping mappingForEntityName:@"Phone" withBlock:^(EKManagedObjectMapping *mapping) {
        [mapping mapFieldsFromDictionary:@{ @"id": @"phoneID" }];
        [mapping mapFieldsFromArray:@[@"number"]];
        [mapping mapFieldsFromDictionary:@{
                                           @"ddi" : @"ddi",
                                           @"ddd" : @"ddd"
                                           }];
        mapping.primaryKey = @"phoneID";
    }];
}

+ (EKManagedObjectMapping *)personWithPhonesMappingOriginal
{
    return [EKManagedObjectMapping mappingForEntityName:@"Person" withBlock:^(EKManagedObjectMapping *mapping) {
        [mapping mapFieldsFromDictionary:@{ @"id": @"personID" }];
        [mapping mapFieldsFromArray:@[@"name", @"email"]];
        [mapping hasManyMapping:[self phoneMappingOriginal] forKey:@"phones"];
        mapping.primaryKey = @"personID";
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
