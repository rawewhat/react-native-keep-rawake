#import "KeepRawake.h"
#import "UIKit/UIKit.h"

@implementation KeepRawake

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(activate, activateWithResolver:(RCTPromiseResolveBlock)resolve rejector:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
        resolve(true);
    });
}

RCT_EXPORT_METHOD(deactivate, activateWithResolver:(RCTPromiseResolveBlock)resolve rejector:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setIdleTimerDisabled:NO];
        resolve(false);
    });
}

@end
