/*
 *  vertex.h
 *  BabyFingers
 *
 *  Created by Baris Metin
 *
 */

#import <OpenGL/OpenGL.h>


typedef struct __Vertex3D {
    GLfloat x;
    GLfloat y;
    GLfloat z;
    struct __Vertex3D* next;
} Vertex3D;


static inline Vertex3D* vertex_new(GLfloat x, GLfloat y, GLfloat z)
{
    Vertex3D* v = (Vertex3D*) malloc(sizeof(Vertex3D));
    v->x = x;
    v->y = y;
    v->z = z;
    v->next = 0;
    return v;
}

static inline void vertex_free(Vertex3D* v)
{
    free(v);
    v = 0;
}