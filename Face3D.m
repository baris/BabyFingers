//
//  Face.m
//  BabyFingers
//
//  Created by Baris Metin on 3/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Face3D.h"


@implementation Face3D

- (void) setV:(NSUInteger*)f_v {
    v[0] = f_v[0];
    v[1] = f_v[1];
    v[2] = f_v[2];
}

- (void) setT:(NSUInteger*)f_t {
    t[0] = f_t[0];
    t[1] = f_t[1];
    t[2] = f_t[2];
}

- (void) setN:(NSUInteger*)f_n {
    n[0] = f_n[0];
    n[1] = f_n[1];
    n[2] = f_n[2];
}

- (NSUInteger*) v
{
    return v;
}

- (NSUInteger*) t
{
    return t;
}

- (NSUInteger*) n
{
    return n;
}


@end
