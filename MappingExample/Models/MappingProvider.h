//
//  MappingProvider.h
//  EasyMappingExample
//
//  Created by Lucas Medeiros on 23/02/13.
//  Copyright (c) 2013 EasyKit. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EMKManagedObjectMapping;

@interface MappingProvider : NSObject

+ (EKManagedObjectMapping *)phoneMappingOriginal;
+ (EKManagedObjectMapping *)personWithPhonesMappingOriginal;

+ (EMKManagedObjectMapping *)phoneMapping;
+ (EMKManagedObjectMapping *)personWithPhonesMapping;

@end
