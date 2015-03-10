//
//  MappingProvider.m
//  EasyMappingExample
//
//  Created by Lucas Medeiros on 23/02/13.
//  Copyright (c) 2013 EasyKit. All rights reserved.
//

#import "MappingProvider.h"
#import <FEMManagedObjectMapping.h>

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

+ (FEMManagedObjectMapping *)phoneMapping {
	return [FEMManagedObjectMapping mappingForEntityName:@"Phone" configuration:^(FEMManagedObjectMapping *mapping) {
		[mapping setPrimaryKey:@"phoneID"];
		[mapping addAttributesFromDictionary:@{@"phoneID" : @"id"}];
		[mapping addAttributesFromArray:@[@"number", @"ddd", @"ddi"]];
	}];
}

+ (FEMManagedObjectMapping *)personWithPhonesMapping {
	return [FEMManagedObjectMapping mappingForEntityName:@"Person" configuration:^(FEMManagedObjectMapping *mapping) {
		[mapping setPrimaryKey:@"personID"];
		[mapping addAttributesFromDictionary:@{@"personID": @"id"}];
		[mapping addAttributesFromArray:@[@"name", @"email"]];
        [mapping addToManyRelationshipMapping:[self phoneMapping] forProperty:@"phones" keyPath:@"phones"];
	}];
}

@end
