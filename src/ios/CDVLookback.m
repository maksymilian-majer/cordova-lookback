#import "CDVLookback.h"
#import <Lookback/Lookback.h>

static BOOL g_setupWithAppTokenHasBeenCalled = NO;

@implementation CDVLookback

- (void)setupWithAppToken:(CDVInvokedUrlCommand*)command
{
	if(g_setupWithAppTokenHasBeenCalled) {
		NSLog(@"WARNING!! You just called Lookback.setupWithAppToken() a second time: this is incorrect, and would normally crash your app.");
		[self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR] callbackId:command.callbackId];
		return;
	}
	g_setupWithAppTokenHasBeenCalled = YES;
	
    CDVPluginResult* pluginResult = nil;
    NSString* token = [command.arguments objectAtIndex:0];

    if (token != nil && [token length] > 0) {
        [Lookback_Weak setupWithAppToken:token];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)shakeToRecord:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    BOOL shakeToRecord = [[command.arguments objectAtIndex:0] boolValue];
    [Lookback_Weak lookback].shakeToRecord = shakeToRecord;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)enabled:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    BOOL enabled = [[command.arguments objectAtIndex:0] boolValue];
    [Lookback_Weak lookback].recording = enabled;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)paused:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    BOOL paused = [[command.arguments objectAtIndex:0] boolValue];
    [Lookback_Weak lookback].paused = paused;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)enteredView:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* viewName = [command.arguments objectAtIndex:0];

    if (viewName != nil && [viewName length] > 0) {
        [[Lookback_Weak lookback] enteredView:viewName];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)exitedView:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* viewName = [command.arguments objectAtIndex:0];

    if (viewName != nil && [viewName length] > 0) {
        [[Lookback_Weak lookback] exitedView:viewName];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)userIdentifier:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* identifier = [command.arguments objectAtIndex:0];

    [Lookback_Weak lookback].options.userIdentifier = identifier;

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end