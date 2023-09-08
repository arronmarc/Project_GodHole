application_surface_draw_enable(false);

// Create ppfx system
ppfx_id = new PPFX_System();

// Create profile with all effects
var effects = [
    new FX_Pixelize(true, 0.05, 20, 50)
];
main_profile = new PPFX_Profile("Main", effects);



// Create a exclusive post-processing system for the layer
layer_effects_id = new PPFX_System();

// Create a profile with effects, for the system
var _layer_profile = new PPFX_Profile("Cool Effect", [
    new FX_Pixelize(true, 0.03, 20, 50)
]);

// Load profile
layer_effects_id.ProfileLoad(_layer_profile);

layer_renderer = new PPFX_LayerRenderer();
layer_renderer.Apply(layer_effects_id, layer_get_id("Instances"), layer_get_id("Instances")); 
