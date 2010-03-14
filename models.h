/*
 *  models.h
 *  BabyFingers
 *
 *  Created by Baris Metin
 *
 */

#import <OpenGL/OpenGL.h>
#import "vertex.h"

typedef struct {
	Vertex3D vertex;
	Vertex3D normal;
} VertexData3D;

typedef struct {
    Vertex3D vertex;
    Vertex3D normal;
    Vertex3D texCoord;
} TexturedVertexData3D;

void loadModel(const VertexData3D *model, GLsizei numVertices)
{
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_NORMAL_ARRAY);
    glVertexPointer(3, GL_FLOAT, sizeof(VertexData3D), &model[0].vertex);
    glNormalPointer(GL_FLOAT, sizeof(VertexData3D), &model[0].normal);
    glDrawArrays(GL_TRIANGLES, 0, numVertices);
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_NORMAL_ARRAY);
    
}

void loadTexturedModel(const TexturedVertexData3D *model, GLsizei numVertices)
{
    glEnableClientState(GL_VERTEX_ARRAY);
    //glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glEnableClientState(GL_NORMAL_ARRAY);
    glVertexPointer(3, GL_FLOAT, sizeof(TexturedVertexData3D), &model[0].vertex);
    glNormalPointer(GL_FLOAT, sizeof(TexturedVertexData3D), &model[0].normal);
    //glTexCoordPointer(2, GL_FLOAT, sizeof(TexturedVertexData3D), &model[0].texCoord);
    glDrawArrays(GL_TRIANGLES, 0, numVertices);
    glDisableClientState(GL_VERTEX_ARRAY);
    //glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    glDisableClientState(GL_NORMAL_ARRAY);
}

#import "butterfly_body.h"
#import "OBJParser.h"
    

void loadButterfly()
{
    NSLog(@"--------");
    OBJParser* parser = [[OBJParser alloc] initWithFile:@"/Users/baris/cube.obj"];
    [parser parse];
    NSLog(@"--------");
    loadModel(Butterfly_body, Butterfly_bodyNumberOfVertices);
}
