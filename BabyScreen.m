//
//  BabyScreen.m
//  BabyFingers
//
//  Created by Baris Metin
//

#import "Face3D.h"
#import "Vertex3D.h"
#import "OBJ.h"
#import "OBJParser.h"
#import "BabyScreen.h"

@implementation BabyScreen

- (id)initWithFrame: (NSRect)rect pixelFormat:(NSOpenGLPixelFormat *)format
{
    self = [super initWithFrame:rect pixelFormat:format];
    [self initOpenGLView];
    return self;
}

-(BOOL)acceptsFirstResponder { return YES; }
-(BOOL)becomeFirstResponder  { return YES; }
-(BOOL)resignFirstResponder  { return YES; }

- (void)initOpenGLView
{       
    glContext = [self openGLContext];
    [glContext makeCurrentContext];
    
    glShadeModel(GL_SMOOTH);
    glEnable(GL_LIGHTING);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_LIGHT0);
}

- (void) playSound: (NSString*)file
{
    NSSound *sound = [[NSSound alloc] initWithContentsOfFile:file byReference:YES];
    [sound play];
}

- (void) playRandomSound
{
    // TODO
}

- (void)keyDown: (NSEvent *)event
{
    [self playRandomSound];
    [self drawRect:[self bounds]];
}

- (void)mouseMoved: (NSEvent *)event
{
    [self drawRect:[self bounds]];
}

- (OBJ*) loadOBJ:(NSString*)file
{
    OBJParser* parser = [[OBJParser alloc] initWithFile:file];
    [parser parse];
    OBJ* obj = [parser object];
    [obj retain];
    [parser release];
    return obj;
}

- (void) drawObj:(OBJ*) obj
{
    NSUInteger num_faces = [[obj faces] count];
    
    glBegin(GL_TRIANGLES);
    for (int f=0; f < num_faces; f++) {
        Face3D* face = [[obj faces] objectAtIndex:f];
        for (int i=0; i < 3; i++) {
            Vertex3D* v = [[obj vertices] objectAtIndex:([face v][i] - 1)];
            Vertex3D* n = [[obj normals] objectAtIndex:([face n][i] - 1)];
            
            glVertex3f([v x], [v y], [v z]);
            glNormal3f([n x], [n y], [n z]);
        }
    }
    glEnd();
}

- (void) drawRandomObject
{
    glPushMatrix();
    // TESTING
    static double i = 10;
    i += 10;
    if (i >=720) i = 0;
    

    srand(time(0) * i);
    int k = rand();

    // TEST animation
    glRotated(i, i/k, i*k, 0);
    glScaled(4.0, 4.0, 4.0);

    static OBJ* obj = 0;
    if (!obj)
        obj = [self loadOBJ:[[NSBundle mainBundle] pathForResource:@"butterfly" ofType:@"obj"]];
    [self drawObj:obj];
//    [obj release];
    glPopMatrix();
}

- (void)drawRect: (NSRect)bounds
{
    glClearColor(0.5, 0.5, 0.8, 0.0);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
    [self drawRandomObject];
    [glContext flushBuffer];
}

@end
