//
//  CTSlicehostSliceRequest.m
//  iPhone
//
//  Created by Michael Mayo on 3/12/10.
//

#import "CTSlicehostSliceRequest.h"
#import "ASIFormDataRequest.h"


@implementation CTSlicehostSliceRequest

#pragma mark -
#pragma mark Constructors

+ (id)sliceRequestWithMethod:(NSString *)method path:(NSString *)path {
	NSString *urlString = [NSString stringWithFormat:@"%@%@", [CTSlicehostRequest host], path];	
	CTSlicehostSliceRequest *request = [[[CTSlicehostSliceRequest alloc] initWithURL:[NSURL URLWithString:urlString]] autorelease];
	[request addBasicAuthenticationHeaderWithUsername:[CTSlicehostRequest apiKey] andPassword:@""];
	[request setRequestMethod:method];
	return request;
}

#pragma mark -
#pragma mark GET https://apikey@api.slicehost.com/slices.xml
+ (id)listRequest {
    return [CTSlicehostSliceRequest sliceRequestWithMethod:@"GET" path:@"slices.xml"];
}

- (NSArray *)slices {
	if (xmlParserDelegate.sliceObjects) {
		return xmlParserDelegate.sliceObjects;
	}
	
	NSXMLParser *parser = [[[NSXMLParser alloc] initWithData:[self responseData]] autorelease];
	if (xmlParserDelegate == nil) {
		xmlParserDelegate = [[CTSlicehostSliceXMLParserDelegate alloc] init];
	}
	
	[parser setDelegate:xmlParserDelegate];
	[parser setShouldProcessNamespaces:NO];
	[parser setShouldReportNamespacePrefixes:NO];
	[parser setShouldResolveExternalEntities:NO];
	[parser parse];
	
	return xmlParserDelegate.sliceObjects;
}

#pragma mark -
#pragma mark GET https://apikey@api.slicehost.com/slices/xxxx.xml
+ (id)getSliceRequest:(NSUInteger)sliceId {
    return [CTSlicehostSliceRequest sliceRequestWithMethod:@"GET" path:[NSString stringWithFormat:@"slices/%i.xml", sliceId]];
}

- (CTSlicehostSlice *)slice {
    if ([[self slices] count] > 0) {
        return [[self slices] objectAtIndex:0];
    } else {
        return nil;
    }
}

#pragma mark -
#pragma mark POST https://apikey@api.slicehost.com/slices.xml
+ (id)createSliceRequest:(CTSlicehostSlice *)slice {
    CTSlicehostRequest *request = [CTSlicehostSliceRequest sliceRequestWithMethod:@"POST" path:@"slices.xml"];
	NSData* data = [[slice toXML] dataUsingEncoding:NSASCIIStringEncoding];
	[request setPostBody:[NSMutableData dataWithData:data]];
    [request addRequestHeader:@"Content-Type" value:@"application/xml"];
    return request;
}

#pragma mark -
#pragma mark PUT https://apikey@api.slicehost.com/slices/xxxx.xml rename
+ (id)renameSliceRequest:(NSUInteger)sliceId name:(NSString *)name {
    CTSlicehostSliceRequest *request = [CTSlicehostSliceRequest sliceRequestWithMethod:@"PUT" path:[NSString stringWithFormat:@"slices/%i.xml", sliceId]];
    NSString *xml = [NSString stringWithFormat:@"<slice><id>%i</id><name>%@</name>", sliceId, name];
	NSData* data = [xml dataUsingEncoding:NSASCIIStringEncoding];
	[request setPostBody:[NSMutableData dataWithData:data]];
    return request;
}

#pragma mark -
#pragma mark DELETE https://apikey@api.slicehost.com/slices/xxxx.xml
+ (id)deleteSliceRequest:(NSUInteger)sliceId {
    return [CTSlicehostSliceRequest sliceRequestWithMethod:@"DELETE" path:[NSString stringWithFormat:@"slices/%i.xml", sliceId]];
}

#pragma mark -
#pragma mark PUT https://apikey@api.slicehost.com/slices/xxxx/reboot.xml 
+ (id)softRebootRequest:(NSUInteger)sliceId {
    return [CTSlicehostSliceRequest sliceRequestWithMethod:@"PUT" path:[NSString stringWithFormat:@"slices/%i/reboot.xml", sliceId]];
}

#pragma mark -
#pragma mark PUT https://apikey@api.slicehost.com/slices/xxxx/hard_reboot.xml 
+ (id)hardRebootRequest:(NSUInteger)sliceId {
    return [CTSlicehostSliceRequest sliceRequestWithMethod:@"PUT" path:[NSString stringWithFormat:@"slices/%i/hard_reboot.xml", sliceId]];
}

#pragma mark -
#pragma mark PUT https://apikey@api.slicehost.com/slices/xxxx/rebuild.xml?image_id=x 
+ (id)rebuildFromImageRequest:(NSUInteger)sliceId imageId:(NSUInteger)imageId {
    return [CTSlicehostSliceRequest sliceRequestWithMethod:@"PUT" path:[NSString stringWithFormat:@"slices/%i/rebuild.xml?image_id=%i", sliceId, imageId]];
}

#pragma mark -
#pragma mark PUT https://apikey@api.slicehost.com/slices/xxxx/rebuild.xml?backup_id=x
+ (id)rebuildFromBackupRequest:(NSUInteger)sliceId backupId:(NSUInteger)backupId {
    return [CTSlicehostSliceRequest sliceRequestWithMethod:@"PUT" path:[NSString stringWithFormat:@"slices/%i/rebuild.xml?backup_id", sliceId, backupId]];
}

@end
