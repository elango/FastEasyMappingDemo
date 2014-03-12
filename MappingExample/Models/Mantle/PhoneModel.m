//
// PhoneModel.m 
// MappingExample
//
// Created by dmitriy on 3/12/14
// Copyright (c) 2014 Yalantis. All rights reserved. 
//
#import "PhoneModel.h"

@implementation PhoneModel

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"phoneID": @"id",
		@"ddi": @"ddi",
		@"ddd": @"ddd",
		@"number": @"number",
	};
}

#pragma mark - MTLManagedObjectSerializing

+ (NSString *)managedObjectEntityName {
	return @"Phone";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
	return @{
		@"phoneID": @"phoneID",
		@"ddi": @"ddi",
		@"ddd": @"ddd",
		@"number": @"number",
	};
}

+ (NSSet *)propertyKeysForManagedObjectUniquing {
	return [NSSet setWithObject:@"phoneID"];
}

@end