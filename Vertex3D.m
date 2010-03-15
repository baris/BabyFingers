//
//  Vertex3D.m
//  BabyFingers
//
//  Created by Baris Metin on 3/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Vertex3D.h"


@implementation Vertex3D

- (id) init
{
    self = [super init];
    x = 0.0;
    y = 0.0;
    z = 0.0;
    return self;
}

@synthesize x;
@synthesize y;
@synthesize z;

@end
