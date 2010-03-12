//
//  CTSlicehostRequest.h
//  iPhone
//
//  Created by Michael Mayo on 3/12/10.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"


@interface CTSlicehostRequest : ASIHTTPRequest {
}

+ (NSString *)host;
+ (NSString *)apiKey;
+ (void)setAPIKey:(NSString *)newAPIKey;

@end
