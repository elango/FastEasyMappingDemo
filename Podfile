platform :ios, '7.0'
inhibit_all_warnings!

#Verions with fixed import in +[NSManagedObject MR_importFromArray:inContext:] - Instead of async import sync is used.
#Since original version perform async import and return in sync way result of import, which is empty.
#pod "MagicalRecord", :path => "./External/MagicalRecord-master/"

#MagicalRecord fork
pod "MagicalRecord", :git => "https://github.com/seepel/MagicalRecord.git"

pod "Mantle", "~> 1.4"
pod "EasyMapping", "~> 0.5.4"
pod "EasyMappingKit", :git => "https://github.com/Yalantis/EasyMappingKit.git"