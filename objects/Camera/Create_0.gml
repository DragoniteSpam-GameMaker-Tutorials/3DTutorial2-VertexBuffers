/// @description Set up 3D things

// Bad things happen if you turn off the depth buffer in 3D
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

// Vertex format: data must go into vertex buffers in the order defined by this
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

vbuffer = vertex_create_buffer();
vertex_begin(vbuffer, vertex_format);
/*
// A square composed of two triangles: the Hello World of computer graphics
var x1 = 400;
var y1 = 400;
var x2 = 600;
var y2 = 600;

vertex_add_point(vbuffer, x1, y1, 100,      0, 0, 1,        0, 0,       c_white, 1);
vertex_add_point(vbuffer, x2, y1, 100,      0, 0, 1,        0, 0,       c_white, 1);
vertex_add_point(vbuffer, x2, y2, 100,      0, 0, 1,        0, 0,       c_white, 1);

vertex_add_point(vbuffer, x2, y2, 100,      0, 0, 1,        0, 0,       c_blue, 1);
vertex_add_point(vbuffer, x1, y2, 100,      0, 0, 1,        0, 0,       c_blue, 1);
vertex_add_point(vbuffer, x1, y1, 100,      0, 0, 1,        0, 0,       c_blue, 1);
*/

// Create a checkerboard pattern on the floor
for (var i = 0; i < room_width; i += 32) {
    for (var j = 0; j < room_height; j += 32) {
        if ((i % 64 == 0 && j % 64 == 0) || (i % 64 > 0 && j % 64 > 0)) {
            var color = c_blue;
        } else {
            var color = c_white;
        }
        
        vertex_add_point(vbuffer, i, j, 100,                0, 0, 1,        0, 0,       color, 1);
        vertex_add_point(vbuffer, i + 32, j, 100,           0, 0, 1,        0, 0,       color, 1);
        vertex_add_point(vbuffer, i + 32, j + 32, 100,      0, 0, 1,        0, 0,       color, 1);

        vertex_add_point(vbuffer, i + 32, j + 32, 100,      0, 0, 1,        0, 0,       color, 1);
        vertex_add_point(vbuffer, i, j + 32, 100,           0, 0, 1,        0, 0,       color, 1);
        vertex_add_point(vbuffer, i, j, 100,                0, 0, 1,        0, 0,       color, 1);
    }
}

vertex_end(vbuffer);