//
//  Face.h
//  BabyFingers
//
//  Created by Baris Metin on 3/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Face3D : NSObject {
    
    NSUInteger v[3]; // vertex indices
    NSUInteger t[3]; // vertex texture indices
    NSUInteger n[3]; // vertex normal indices

}

- (void) setV:(NSUInteger*)f_v;
- (void) setT:(NSUInteger*)f_t;
- (void) setN:(NSUInteger*)f_n;

- (NSUInteger*) v;
- (NSUInteger*) t;
- (NSUInteger*) n;


@end
