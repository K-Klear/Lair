components {
  id: "wall"
  component: "/main/3d_view/walls/wall.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "tile_set: \"/main/3d_view/walls/atlases/wall.atlas\"\n"
  "default_animation: \"wall\"\n"
  "material: \"/graphics/shaders/skew.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "cracks"
  type: "sprite"
  data: "tile_set: \"/main/3d_view/walls/atlases/cracks.atlas\"\n"
  "default_animation: \"cracks\"\n"
  "material: \"/graphics/shaders/skew.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 0.01
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
