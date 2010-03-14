//
//  OBJ.h
//  BabyFingers
//
//  Created by Baris Metin
//

#import <Cocoa/Cocoa.h>
#import "vertex.h"


@interface OBJ : NSObject {
    NSString* name;

    Vertex3D* vertex_tail;
    Vertex3D* normal_tail;
    
    Vertex3D* vertices;
    Vertex3D* normals;
}

@property (readonly) Vertex3D* vertices;
@property (readonly) Vertex3D* normals;

- (void) addVertex:(Vertex3D*) v;

- (void) addNormal:(Vertex3D*) n;


@end
