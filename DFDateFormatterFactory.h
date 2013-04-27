//
//  DFDateFormatterFactory.h
//  GitHub Community
//
//  Created by Douglas Fischer on 4/20/13.
//  Copyright (c) 2013 XT3 Studios. All rights reserved.
//

@interface DFDateFormatterFactory : NSObject {
    
    NSCache *loadedDataFormatters;
    
}

+ (DFDateFormatterFactory *)sharedFactory;
- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format andLocale:(NSLocale *)locale;
- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format andLocaleIdentifier:(NSString *)localeIdentifier;

@end
