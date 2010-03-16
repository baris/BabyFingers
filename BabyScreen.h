//
//  BabyScreen.h
//  BabyFingers
//
//  Created by Baris Metin
//

#import <Cocoa/Cocoa.h>


@interface BabyScreen : NSOpenGLView {
	NSOpenGLContext *glContext;
}

- (void) initOpenGLView;

@end
