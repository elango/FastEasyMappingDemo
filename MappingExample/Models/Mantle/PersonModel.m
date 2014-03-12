//
// PersonModel.m 
// MappingExample
//
// Created by dmitriy on 3/12/14
// Copyright (c) 2014 Yalantis. All rights reserved. 
//
#import "PersonModel.h"

@implementation PersonModel

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return nil;
}

#pragma mark - MTLManagedObjectSerializing

+ (NSString *)managedObjectEntityName {
	return nil;
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
	return nil;
}

+ (NSSet *)propertyKeysForManagedObjectUniquing {
	return nil;
}

@end