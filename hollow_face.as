// AngelCAD code: jon_face.as

shape@ main_shape(as_args@ args)
{
   string model = args.get_string("model","Jon_Face_polyfix_1.obj");
   solid@ face = polyhedron(model);
   
   // center the face and rotate so that top of head is at +Z
   pos3d@ c = face.box().center();
   @face = rotate_x(deg:-90)*translate(-c.x(),-c.y(),-c.z())*face;
   
   // subtract a 10% scaled down and offset copy
   solid@ hollow_face = face - translate(2,0,0)*scale(0.9)*face;
   
   // scale up result
   return scale(9.0)*hollow_face;
}

void main()
{
   shape@ obj = main_shape(GetArgs());
   obj.write_xcsg(GetInputFullPath(),secant_tolerance:-1.0);
}
