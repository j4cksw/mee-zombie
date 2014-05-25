PhysicsData = {
  ["bullet"] = {
    type="kinematic",
    options = {
      isSensor = true
    }
  },
  ["player"] = {
    type="dynamic",
    options = {
      shape = {-142, -93  ,  -42, -97  ,  -42, 197  ,  -145, 197},
      isSensor = true,
      gravityScale = 0
    }
  }
}
return PhysicsData