//
//  OBJ.m
//  BabyFingers
//
//  Created by Baris Metin
//

#import "OBJ.h"


@implementation OBJ

- (void) addVertex:(Vertex3D*) v
{
    vertex_tail->next = v;
    vertex_tail = v;
}

- (void) addNormal:(Vertex3D*) n
{
    normal_tail->next = n;
    normal_tail = n;
}

- (void)dealloc
{
    Vertex3D* v = vertices;
    while (v) {
        Vertex3D* tmp = v->next;
        free(v);
        v = tmp;
    }
    
    Vertex3D* n = normals;
    while (n) {
        Vertex3D* tmp = n->next;
        free(n);
        n = tmp;
    }

    [super dealloc];
}

@synthesize vertices;
@synthesize normals;

@end
