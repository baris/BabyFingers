//
//  OBJParser.m
//  BabyFingers
//
//  Created by Baris Metin
//

#import "util.h"
#import "OBJ.h"
#import "OBJParser.h"
#import "Vertex3D.h"
#import "Face3D.h"

NSString* vertex_start = @"v";
NSString* vertex_normal_start = @"vn";
NSString* texture_coordinate_start = @"vt";
NSString* face_start = @"f";
NSString* group_name_start = @"g";

#pragma mark Global Utilities
BOOL startsWith(NSString* str, NSString* start_str)
{
    return [str compare:start_str 
                options:NSLiteralSearch
                  range:NSMakeRange(0, [start_str length])] == NSOrderedSame;
}

NSString* lineRest(NSString* line, NSString* start)
{
    return [[line substringFromIndex:[start length]]
            stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
}

#pragma mark OBJPaser
@implementation OBJParser

@synthesize object;

- (id) initWithFile:(NSString*) file
{
    self = [super init];
    filename = [NSString stringWithString:file];
    filedata = [NSData dataWithContentsOfFile:filename];
    content = (char*) [filedata bytes];
    size = [filedata length];
    index = 0;
    state = S_UNKNOWN;
    object = [[OBJ alloc] init];
    return self;
}

- (void) dealloc
{
    [object release];
    [super dealloc];
}

- (NSString*) readLine
{
    if (index >= size) {
        return NULL;
    }
    
    char* c = content + index;
    NSUInteger line_end = index;
    while(!is_newline(*c)) {
        ++line_end; ++c;
    }    
    NSUInteger line_size = line_end - index;
    
    char* line = (char*) malloc(sizeof(char) * (line_size + 1));
    memcpy(line, (content + index), line_size);
    line[line_size] = '\0';
    
    NSString* ret = [NSString stringWithUTF8String:line];
    
    free(line);
    index += line_size + 1; // pass newline
    
    return ret;
}

- (LineType) typeOf:(NSString*)line
{    
    if (startsWith(line, vertex_start)) {
        if (startsWith(line, vertex_normal_start)) {
            return T_VERTEX_NORMAL;
        } else if (startsWith(line, texture_coordinate_start)) {
            return T_TEXCOORD;
        }
        return T_VERTEX;
    } else if (startsWith(line, face_start)) {
        return T_FACE;
    } else if (startsWith(line, group_name_start)) {
        return T_GROUP_NAME;
    }
    return T_UNKNOWN;
}

- (Vertex3D*) parseVertex3D:(NSString*)str
{
    Vertex3D* v = [[Vertex3D alloc] init];
    NSArray* chunks = [str componentsSeparatedByString:@" "];
    if ([chunks count] == 3) {
        [v setX:[[chunks objectAtIndex:0] floatValue]];
        [v setY:[[chunks objectAtIndex:1] floatValue]];
        [v setZ:[[chunks objectAtIndex:2] floatValue]];
    }
    [v autorelease];
    return v;
}

- (Face3D*) parseFace3D:(NSString*)str
{
    Face3D* f = [[Face3D alloc] init];
    NSArray* chunks_1 = [str componentsSeparatedByString:@" "];
    NSUInteger f_v[3], f_t[3], f_n[3];
    for (int i=0; i < 3; i++) {
        NSArray* chunks_2 = [[chunks_1 objectAtIndex:i] componentsSeparatedByString:@"/"];
        f_v[i] = [[chunks_2 objectAtIndex:0] intValue];
        f_t[i] = [[chunks_2 objectAtIndex:1] intValue];
        f_n[i] = [[chunks_2 objectAtIndex:2] intValue];
    }
    [f setV:f_v];
    [f setT:f_t];
    [f setN:f_n];
    [f autorelease];
    return f;
}

- (void) parse
{
    LineType line_type = T_UNKNOWN;    
    NSString* line;
    while ((line = [self readLine]) != NULL) {
        line_type = [self typeOf:line];
        switch (line_type) {
            case T_VERTEX:
            {
                state = S_VERTEX;
                NSString* vstr = lineRest(line, vertex_start);
                Vertex3D* vertex = [self parseVertex3D:vstr];
                [object addVertex:vertex];
                [vertex release];
                break;
            }
            case T_VERTEX_NORMAL:
            {
                state = S_VERTEX_NORMAL;
                NSString* vnstr = lineRest(line, vertex_normal_start);
                Vertex3D* normal = [self parseVertex3D:vnstr];
                [object addNormal:normal];
                [normal release];
                break;
            }
            case T_TEXCOORD:
            {
                // TODO
                break;                
            }
            case T_FACE:
            {
                state = S_FACE;
                NSString* fstr = lineRest(line, face_start);
                Face3D* face = [self parseFace3D:fstr];
                [object addFace:face];
                [face release];
                break;
            }
            default:
                break;
        }
    }

}

@end
