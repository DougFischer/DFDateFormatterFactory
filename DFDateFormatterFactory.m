//
//  DFDateFormatterFactory.m
//  GitHub Community
//
//  Created by Douglas Fischer on 4/20/13.
//  Copyright (c) 2013 XT3 Studios. All rights reserved.
//

#import "DFDateFormatterFactory.h"

#define CACHE_LIMIT 15;

@implementation DFDateFormatterFactory


- (id)init {
    self = [super init];
    if (self) {
        loadedDataFormatters = [[NSCache alloc] init];
        loadedDataFormatters.countLimit = CACHE_LIMIT;
    }
    return self;
}


#pragma mark -
#pragma mark Static Methods

+ (DFDateFormatterFactory *)sharedFactory {
    static DFDateFormatterFactory *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DFDateFormatterFactory alloc] init];
    });
    
    return sharedInstance;
}


#pragma mark -
#pragma mark NSDateFormatter Initialization Methods

- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format andLocale:(NSLocale *)locale {
    NSString *key = [NSString stringWithFormat:@"%@|%@", format, locale.localeIdentifier];
    
    NSDateFormatter *dateFormatter = [loadedDataFormatters objectForKey:key];
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = format;
        dateFormatter.locale = locale;
        [loadedDataFormatters setObject:dateFormatter forKey:key];
    }
    
    return dateFormatter;
}

- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format andLocaleIdentifier:(NSString *)localeIdentifier {    
    return [self dateFormatterWithFormat:format andLocale:[[NSLocale alloc] initWithLocaleIdentifier:localeIdentifier]];
}

@end
