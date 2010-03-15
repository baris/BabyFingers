//
//  Vertex3D.h
//  BabyFingers
//
//  Created by Baris Metin on 3/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <OpenGL/OpenGL.h>

@interface Vertex3D : NSObject {
    GLfloat x;
    GLfloat y;
    GLfloat z;
}

@property (readwrite) GLfloat x;
@property (readwrite) GLfloat y;
@property (readwrite) GLfloat z;

@end
