//
//  OBJ.h
//  BabyFingers
//
//  Created by Baris Metin
//

#import <Cocoa/Cocoa.h>

@class Vertex3D, Face3D;

@interface OBJ : NSObject {
    NSString* name;
    NSMutableArray* vertices;
    NSMutableArray* normals;
    NSMutableArray* faces;
}

@property (readonly) NSMutableArray* vertices;
@property (readonly) NSMutableArray* normals;
@property (readonly) NSMutableArray* faces;

- (void) addVertex:(Vertex3D*) v;
- (void) addNormal:(Vertex3D*) n;
- (void) addFace:(Face3D*) f;

@end
