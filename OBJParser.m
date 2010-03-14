//
//  OBJParser.m
//  BabyFingers
//
//  Created by Baris Metin
//

#import "util.h"
#import "OBJParser.h"


BOOL startsWith(NSString* str, NSString* start_str)
{
    return [str compare:start_str 
                options:NSLiteralSearch
                  range:NSMakeRange(0, [start_str length])] == NSOrderedSame;
}

@implementation OBJParser

- (id) initWithFile:(NSString*) file
{
    self = [super init];
    filename = [NSString stringWithString:file];
    filedata = [NSData dataWithContentsOfFile:filename];
    content = (char*) [filedata bytes];
    size = [filedata length];
    index = 0;
    state = S_UNKNOWN;
    current_object = 0;
    return self;
}


- (void) dealloc
{
    [filename retain];
    [filedata retain];
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
    if (startsWith(line, @"v")) {
        if (startsWith(line, @"vn")) {
            return T_VERTEX_NORMAL;
        }
        return T_VERTEX;
        
    } else if (startsWith(line, @"f")) {
        return T_FACE;
        
    } else if (startsWith(line, @"g")) {
        return T_GROUP_NAME;
        
    }
    
    return T_UNKNOWN;
}


- (void) parse
{
    LineType line_type = T_UNKNOWN;

    NSString* line;
    while ((line = [self readLine]) != NULL) {
        
        NSLog(line);
        line_type = [self typeOf:line];
        
        switch (line_type) {
            case T_GROUP_NAME:
            {
                break;
            }
            case T_VERTEX:
            {
                
                break;
            }
            case T_VERTEX_NORMAL:
            {
                break;
            }
            default:
                break;
        }
        
        [line retain];
    }
}


@end
