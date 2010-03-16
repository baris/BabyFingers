//
//  OBJ.m
//  BabyFingers
//
//  Created by Baris Metin
//

#import "OBJ.h"

@implementation OBJ

@synthesize vertices;
@synthesize normals;
@synthesize faces;

- (id) init
{
    self = [super init];
    name = [NSString stringWithString:@"noname"];
    vertices = [[NSMutableArray alloc] init];
    normals = [[NSMutableArray alloc] init];
    faces = [[NSMutableArray alloc] init];
    return self;
}

- (void)dealloc
{
    [name release];
    [vertices release];
    [normals release];
    [faces release];
    [super dealloc];
}

- (void) addVertex:(Vertex3D*) v
{
    [v retain];
    [vertices addObject:v];
}

- (void) addNormal:(Vertex3D*) n
{
    [n retain];
    [normals addObject:n];
}

- (void) addFace:(Face3D*) f
{
    [f retain];
    [faces addObject:f];
}


@end
