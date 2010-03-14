//
//  BabyController.m
//  BabyFingers
//
//  Created by Baris Metin
//

#import "BabyController.h"
#import "BabyWindow.h"
#import "BabyScreen.h"


@implementation BabyController

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{       
    NSRect mainDisplayRect = [[NSScreen mainScreen] frame];
    BabyWindow *mainWindow = [[BabyWindow alloc] initWithContentRect: mainDisplayRect
                                                           styleMask:NSBorderlessWindowMask 
                                                             backing:NSBackingStoreBuffered 
                                                               defer:YES];
    [mainWindow setLevel:NSMainMenuWindowLevel+1];
    [mainWindow setOpaque:YES];
    [mainWindow setHidesOnDeactivate:YES];
    [mainWindow setAcceptsMouseMovedEvents:YES];
    [mainWindow makeKeyWindow];
    
    NSOpenGLPixelFormatAttribute attrs[] = {
        NSOpenGLPFADoubleBuffer,
        0
    };
    NSOpenGLPixelFormat* pixelFormat = [[NSOpenGLPixelFormat alloc] initWithAttributes:attrs];
    NSRect viewRect = NSMakeRect(0.0, 0.0, mainDisplayRect.size.width, mainDisplayRect.size.height);
    babyScreen = [[BabyScreen alloc] initWithFrame:viewRect pixelFormat: pixelFormat];
    
    [mainWindow setContentView:babyScreen];
    [mainWindow setInitialFirstResponder:babyScreen];
    [mainWindow makeFirstResponder:babyScreen];
    
    [mainWindow makeKeyAndOrderFront:self];
}


@end
