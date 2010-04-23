//
//  CTSlicehostFlavorRequest.h
//  iPhone
//
//  Created by Michael Mayo on 4/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTSlicehostRequest.h"

@class CTSlicehostFlavor;

@interface CTSlicehostFlavorRequest : CTSlicehostRequest {

}

// GET https://apikey@api.slicehost.com/flavors.xml
+ (id)listRequest;
- (NSArray *)flavors;

// GET https://apikey@api.slicehost.com/flavors/xxxx.xml
+ (id)getFlavorRequest:(NSUInteger)flavorId;
- (CTSlicehostFlavor *)flavor;

@end
