//
// PersonModel.m 
// MappingExample
//
// Created by dmitriy on 3/12/14
// Copyright (c) 2014 Yalantis. All rights reserved. 
//
#import "PersonModel.h"

#import "PhoneModel.h"

@implementation PersonModel

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"personID": @"id",
	    @"name": @"name",
	    @"email": @"email",
	    @"phones": @"phones",
	};
}

#pragma mark - MTLManagedObjectSerializing

+ (NSString *)managedObjectEntityName {
	return @"Person";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
	return @{
		@"personID": @"personID",
	    @"name": @"name",
	    @"email": @"email",
	    @"phones": @"phones"
	};
}

+ (NSSet *)propertyKeysForManagedObjectUniquing {
	return [NSSet setWithObject:@"personID"];
}

#pragma mark -

+ (NSValueTransformer *)phonesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:PhoneModel.class];
}

@end