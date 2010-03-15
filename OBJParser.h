//
//  OBJParser.h
//  BabyFingers
//
//  Created by Baris Metin
//

#import <Cocoa/Cocoa.h>
#import "OBJ.h"

typedef enum {
    T_GROUP_NAME,
    T_OBJECT_NAME,
    T_COMMENT,
    T_VERTEX,
    T_VERTEX_NORMAL,
    T_TEXCOORD,
    T_FACE,
    
    T_MLTLIB,
    T_USEMLT,
    
    T_UNKNOWN
} LineType ;


typedef enum {
    S_VERTEX,
    S_VERTEX_NORMAL,
    S_FACE,
    
    S_UNKNOWN
} ParserState;



@interface OBJParser : NSObject {
    NSString* filename;
    NSData* filedata;
    char* content;
    NSUInteger size;
    NSUInteger index;
    ParserState state;
    OBJ* object;
}

@property (readonly) OBJ* object;

- (id) initWithFile:(NSString*)file;
- (void) parse;

@end
