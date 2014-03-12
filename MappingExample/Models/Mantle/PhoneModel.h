//
// PhoneModel.h 
// MappingExample
//
// Created by dmitriy on 3/12/14
// Copyright (c) 2014 Yalantis. All rights reserved. 
//
#import <Foundation/Foundation.h>

@interface PhoneModel : MTLModel <MTLJSONSerializing, MTLManagedObjectSerializing>

@property (nonatomic, retain) NSNumber * phoneID;
@property (nonatomic, retain) NSString * ddi;
@property (nonatomic, retain) NSString * ddd;
@property (nonatomic, retain) NSString * number;

+ (NSDictionary *)JSONKeyPathsByPropertyKey;

+ (NSString *)managedObjectEntityName;
+ (NSDictionary *)managedObjectKeysByPropertyKey;
+ (NSSet *)propertyKeysForManagedObjectUniquing;

@end