GDPC                                                                                           X   res://.godot/exported/133200997/export-001994bc2cec1f8a1bb046c343fa3bd7-M_RocketBody.res�      T
      ��Mt#���-X���    T   res://.godot/exported/133200997/export-14584830dbc22d3f76a596eed5f4948e-node_3d.scn         �      �b����r���Q�(    X   res://.godot/exported/133200997/export-1b8aa3e59a1a0a20d7bbd86b72ae51b9-SM_RocketGas.resP2      e      ��ڂfb�5r�#�8    \   res://.godot/exported/133200997/export-b8ed545ed977673c7b9329a2cbed9711-M_RocketBooster.res �'      T
      �+^{�-ѱ�c��Պi    ,   res://.godot/global_script_class_cache.cfg  �?             ��Р�8���8~$}P�       res://.godot/uid_cache.bin  `C      �       �����������        res://M_RocketBody.tres.remap   0>      i       Z{_��>���;~��        res://M_RocketBooster.tres.remap�>      l       G�Yq"ҰzH����       res://Rocket.gd �      �      ��;���O����yD�        res://SM_RocketGas.tres.remap   ?      i       ��m�t�a~U����	       res://WorldBase.gd  �      �       ��
Cm�픎fZ�P7       res://icon.svg  �?      �      C��=U���^Qu��U3       res://node_3d.tscn.remap�=      d       �k�	���c{oo�       res://project.binaryD      �      {�{����O订V�    q�NRSRC                    PackedScene            ��������                                                  ..    CameraPivot    RigidBody3D    resource_local_to_scene    resource_name 	   friction    rough    bounce 
   absorbent    script    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    size    subdivide_width    subdivide_height    subdivide_depth    custom_solver_bias    margin    top_radius    bottom_radius    height    radial_segments    rings    cap_top    cap_bottom    radius 	   _bundled       Script    res://WorldBase.gd ��������   Script    res://Rocket.gd ��������	   Material    res://M_RocketBody.tres ���(>R.	   Material    res://M_RocketBooster.tres T=w��dB   SphereMesh    res://SM_RocketGas.tres �:����g      local://PhysicsMaterial_dlljf j         local://BoxMesh_w7fgs �         local://BoxShape3D_bdij1 �         local://CylinderMesh_0ekqf �         local://CylinderShape3D_drmm2          local://CylinderMesh_kuab7 J         local://CylinderShape3D_huy34 �         local://PackedScene_55b6p �         PhysicsMaterial    	         BoxMesh            �A  �>  �A	         BoxShape3D            �A  �>  �A	         CylinderMesh                        �>	         CylinderShape3D            �>	         CylinderMesh                      ���=      ��L>      ���=	         CylinderShape3D          ���=      ��L>	         PackedScene          	         names "   3      Node3D    script    Floor    physics_material_override    StaticBody3D    MeshInstance3D    mesh    CollisionShape3D    shape    Rocket 
   transform    mass    RigidBody3D    PinJoint3D    node_a    node_b    CameraPivot    lock_rotation 	   Camera3D    SpotLight3D    light_color    light_energy    shadow_enabled    distance_fade_enabled    distance_fade_begin    spot_range    spot_angle    spot_angle_attenuation    FootZp    angular_limit/enable    angular_limit/upper    angular_limit/lower    HingeJoint3D 	   skeleton    Particles3D    amount 
   direction    spread    gravity    initial_velocity_min    initial_velocity_max    CPUParticles3D    FootZn    FootXp    FootXn    OmniLight3D    omni_range    omni_attenuation    OmniLight3D2    OmniLight3D3    OmniLight3D4    	   variants    .                                              �?              �?              �?    [B�?         C                                 �?              �?              �?      �@  �@   
�#<           �?            d�K? �?     ��d�K?                                   �?            1�;�  �?      ��1�;�                 �?    ���<  �?     @@      A     4B     �A   ]��?     �?              �?              �?    ��L�ף�>                                                     �?              �?              �?    /c��                            ��         �A                  ��L>   333?     �?              �?              �?    ��L�ף�     �?              �?              �?    ���         �?              �?              �?ף�>��L�         �?              �?              �?ף���L�         �?              �?              �?    }�@       ��@   �F�B     �?              �?              �?�,9@�,@a#A     �?              �?              �?|�����A��6�     �?              �?              �?�	A�@���      node_count    #         nodes     �  ��������        ����                            ����                          ����                          ����                        	   ����   
                                   ����                                ����   
   	      
                          ����   
                       ����                          ����                          ����	   
                                                                        ����   
                                                     ����                     ����         !                       ����                    )   "   ����   
      #            $      %       &   !   '   "   (   #                  *   ����   
   $                                                  ����                     ����         !                       ����                    )   "   ����   
   %   #            $      %       &   !   '   "   (   #                  +   ����   
   &                                                  ����                     ����         !                       ����                    )   "   ����   
   %   #            $      %       &   !   '   "   (   #                  ,   ����   
   '                                                  ����                     ����         !                       ����                    )   "   ����   
   %   #            $      %       &   !   '   "   (   #               -   -   ����   
   (      )   .   *   /                  -   0   ����   
   +      )   .   *   /                  -   1   ����   
   ,      )   .   *   /                  -   2   ����   
   -      )   .   *   /                conn_count              conns               node_paths              editable_instances              version       	      RSRC3%@��1extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
��A�rk��Wextends RigidBody3D

const MaxThrusterPower = 5.0
const ThrustBaseDirection = Vector3(0.0, 1.0, 0.0)
var Thrust = 300.0
var Force = Vector3(0, 0, 0)

# Mouse Event
var MousePressed = false
var MouseStartPosition = Vector2(0, 0)
var Direction = Vector2(0, 0)
const DirectionCoeff = 0.0005


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Get the thruster direction	
	Direction = get_viewport().get_mouse_position() - MouseStartPosition
	# Check if the Throttle pressed or not
	var Emitting = false
	if Input.is_action_pressed("Throttle"):
		Force = self.global_transform.basis.y * Thrust
		Emitting = true
	else:
		Force = Vector3(0, 0, 0)
	# Set central force to each booster
	get_node("FootXp/RigidBody3D").apply_central_force(Force * 0.25 * (1.0 - Direction.x * DirectionCoeff))
	get_node("FootXn/RigidBody3D").apply_central_force(Force * 0.25 * (1.0 + Direction.x * DirectionCoeff))
	get_node("FootZp/RigidBody3D").apply_central_force(Force * 0.25 * (1.0 - Direction.y * DirectionCoeff))
	get_node("FootZn/RigidBody3D").apply_central_force(Force * 0.25 * (1.0 + Direction.y * DirectionCoeff))
	# Set particle emitting
	get_node("FootXp/RigidBody3D/Particles3D").emitting = Emitting
	get_node("FootXn/RigidBody3D/Particles3D").emitting = Emitting
	get_node("FootZp/RigidBody3D/Particles3D").emitting = Emitting
	get_node("FootZn/RigidBody3D/Particles3D").emitting = Emitting

# Called when input event fired.
func _input(event):
	if event.is_action_pressed("Throttle"):
		if not MousePressed:
			MousePressed = true
			# Set Start Position
			MouseStartPosition = event.position
	if event.is_action_released("Throttle"):
		MousePressed = false
s#�RSRC                    StandardMaterial3D            ��������                                            n      resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script        !   local://StandardMaterial3D_23fny �	         StandardMaterial3D          �� ?��e?��p?  �?        @?      ��L?m      RSRC>�{�5� ��bORSRC                    StandardMaterial3D            ��������                                            n      resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script        !   local://StandardMaterial3D_2bf8y �	         StandardMaterial3D          ���>���>���>  �?        �?      33�>m      RSRC��2�0�����jRSRC                    SphereMesh            ��������                                            y      resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    radius    height    radial_segments    rings    is_hemisphere        !   local://StandardMaterial3D_gxicd �
         local://SphereMesh_7vmik          StandardMaterial3D                   ��6?    ��$>���>m         SphereMesh    o             t      ���=u      ���=v         w         m      RSRC�iMq5~�y[remap]

path="res://.godot/exported/133200997/export-14584830dbc22d3f76a596eed5f4948e-node_3d.scn"
_yw�cV""U�s[remap]

path="res://.godot/exported/133200997/export-001994bc2cec1f8a1bb046c343fa3bd7-M_RocketBody.res"
��㭮w�[remap]

path="res://.godot/exported/133200997/export-b8ed545ed977673c7b9329a2cbed9711-M_RocketBooster.res"
͐�[remap]

path="res://.godot/exported/133200997/export-1b8aa3e59a1a0a20d7bbd86b72ae51b9-SM_RocketGas.res"
AI�y�Y�list=Array[Dictionary]([])
�qA<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
��8������   ��ӱy�   res://icon.svg���(>R.   res://M_RocketBody.tresT=w��dB   res://M_RocketBooster.tres����i�   res://node_3d.tscn�:����g   res://SM_RocketGas.tresNI`x����ECFG      application/config/name         LunarMouse3D   application/run/main_scene         res://node_3d.tscn     application/config/features$   "         4.1    Forward Plus       application/config/icon         res://icon.svg     editor_plugins/enabled8   "      *   res://addons/coi_serviceworker/plugin.cfg      input/Throttle�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script      /   input_devices/pointing/emulate_touch_from_mouse            physics/3d/default_gravity        �?��4N�(X@��