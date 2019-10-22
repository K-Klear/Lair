components {
  id: "wall"
  component: "/main/3d_view/wall.script"
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
  id: "front"
  type: "sprite"
  data: "tile_set: \"/main/3d_view/dungeon.atlas\"\n"
  "default_animation: \"wall_front\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: -1.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "left"
  type: "sprite"
  data: "tile_set: \"/main/3d_view/dungeon.atlas\"\n"
  "default_animation: \"wall_test\"\n"
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
