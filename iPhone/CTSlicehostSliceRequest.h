//
//  CTSlicehostSliceRequest.h
//  iPhone
//
//  Created by Michael Mayo on 3/12/10.
//

#import <Foundation/Foundation.h>
#import "CTSlicehostRequest.h"
#import "CTSlicehostSlice.h"
#import "CTSlicehostSliceXMLParserDelegate.h"

@interface CTSlicehostSliceRequest : CTSlicehostRequest {
	CTSlicehostSliceXMLParserDelegate *xmlParserDelegate;
}

// GET https://apikey@api.slicehost.com/slices.xml
+ (id)listRequest;
- (NSArray *)slices;

// GET https://apikey@api.slicehost.com/slices/xxxx.xml
+ (id)getSliceRequest:(NSUInteger)sliceId;
- (CTSlicehostSlice *)slice;

// POST https://apikey@api.slicehost.com/slices.xml
+ (id)createSliceRequest:(CTSlicehostSlice *)slice;

// PUT https://apikey@api.slicehost.com/slices/xxxx.xml rename
+ (id)renameSliceRequest:(NSUInteger)sliceId name:(NSString *)name;

// DELETE https://apikey@api.slicehost.com/slices/xxxx.xml
+ (id)deleteSliceRequest:(NSUInteger)sliceId;

// PUT https://apikey@api.slicehost.com/slices/xxxx/reboot.xml 
+ (id)softRebootRequest:(NSUInteger)sliceId;

// PUT https://apikey@api.slicehost.com/slices/xxxx/hard_reboot.xml 
+ (id)hardRebootRequest:(NSUInteger)sliceId;

// PUT https://apikey@api.slicehost.com/slices/xxxx/rebuild.xml?image_id=x 
+ (id)rebuildFromImageRequest:(NSUInteger)sliceId imageId:(NSUInteger)imageId;

// PUT https://apikey@api.slicehost.com/slices/xxxx/rebuild.xml?backup_id=x
+ (id)rebuildFromBackupRequest:(NSUInteger)sliceId backupId:(NSUInteger)backupId;

@end
