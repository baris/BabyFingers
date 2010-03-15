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

- (void) addVertex:(Vertex3D*) v
{
    [vertices addObject:v];
    [v release];
}

- (void) addNormal:(Vertex3D*) n
{
    [normals addObject:n];
    [n release];
}

- (void) addFace:(Face3D*) f
{
    [faces addObject:f];
    [f release];
}

- (void)dealloc
{
    [name retain];
    [vertices retain];
    [normals retain];
    [faces retain];
    [super dealloc];
}

@end
