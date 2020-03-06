/// @description Draw the 3D world

// 3D projections require a view and projection matrix
var camera = camera_get_active();
camera_set_view_mat(camera, matrix_build_lookat(0, 0, 400, room_width, room_height, 0, 0, 0, -1));
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(60, window_get_width() / window_get_height(), 1, 32000));
camera_apply(camera);

// Everything must be drawn after the 3D projection has been set
vertex_submit(vbuffer, pr_trianglelist, -1);