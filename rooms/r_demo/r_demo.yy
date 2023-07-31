{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "r_demo",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_371DE36E","path":"rooms/r_demo/r_demo.yy",},
    {"name":"inst_4B27FD2E","path":"rooms/r_demo/r_demo.yy",},
    {"name":"inst_3A0C70F1","path":"rooms/r_demo/r_demo.yy",},
    {"name":"inst_4CD2558A","path":"rooms/r_demo/r_demo.yy",},
    {"name":"inst_52B01C57","path":"rooms/r_demo/r_demo.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":-300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Player","depth":-200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_371DE36E","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":608.0,"y":352.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4B27FD2E","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oWeaponPickup","path":"objects/oWeaponPickup/oWeaponPickup.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":512.0,"y":256.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3A0C70F1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oWP_Plasma","path":"objects/oWP_Plasma/oWP_Plasma.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":672.0,"y":256.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4CD2558A","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oWeapon","path":"objects/oWeapon/oWeapon.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":-32.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_52B01C57","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oRoomExit","path":"objects/oRoomExit/oRoomExit.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oRoomExit","path":"objects/oRoomExit/oRoomExit.yy",},"propertyId":{"name":"targetRoom","path":"objects/oRoomExit/oRoomExit.yy",},"value":"r_demo2",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oRoomExit","path":"objects/oRoomExit/oRoomExit.yy",},"propertyId":{"name":"targetX","path":"objects/oRoomExit/oRoomExit.yy",},"value":"608",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oRoomExit","path":"objects/oRoomExit/oRoomExit.yy",},"propertyId":{"name":"targetY","path":"objects/oRoomExit/oRoomExit.yy",},"value":"672",},
          ],"rotation":0.0,"scaleX":3.5,"scaleY":0.5,"x":512.0,"y":0.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"T_Soil","depth":-100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":23,"SerialiseWidth":40,"TileCompressedData":[
-375,-2147483648,1,184,-6,185,1,186,-152,-2147483648,1,184,-6,185,1,186,-72,-2147483648,1,184,-6,185,1,186,-297,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tile_terrain","path":"tilesets/tile_terrain/tile_terrain.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Levels","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":24,"SerialiseWidth":43,"TileCompressedData":[
-175,0,-2,12,-18,0,-3,12,-20,0,-2,12,-9,0,-2,12,-7,0,-3,12,-31,0,-2,12,-7,0,-3,12,-40,0,-3,12,-10,0,-2,12,-28,0,-3,12,-10,0,-2,
12,-76,0,-2,12,-41,0,-2,12,-101,0,-3,12,-3,0,-3,4,-34,0,-3,12,-3,0,-3,12,-34,0,-3,12,-3,0,-3,12,-7,0,-2,12,-25,0,-3,12,-13,0,
-2,12,-25,0,-3,12,-7,0,-3,12,-40,0,-3,12,-40,0,-3,12,-157,0,],"TileDataFormat":1,},"tilesetId":{"name":"demo_tileset","path":"tilesets/demo_tileset/demo_tileset.yy",},"userdefinedDepth":true,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Water","depth":32,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":24,"SerialiseWidth":43,"TileCompressedData":[
-117,-2147483648,-4,44,-38,-2147483648,-2,44,4,37,39,44,44,-37,-2147483648,6,44,37,46,46,39,44,-15,-2147483648,-5,0,-16,-2147483648,-2,44,-3,46,2,47,44,-15,-2147483648,-5,44,-16,-2147483648,2,44,
37,-3,46,2,47,44,-14,-2147483648,-2,44,5,37,38,39,44,44,-15,-2147483648,2,44,45,-3,46,2,47,44,-13,-2147483648,-2,44,1,37,-3,46,3,39,44,44,-15,-2147483648,5,44,45,
46,47,44,-13,-2147483648,-2,44,1,37,-5,46,2,47,44,-16,-2147483648,-3,44,-14,-2147483648,2,44,37,-6,46,2,47,44,-33,-2147483648,2,44,45,-6,46,2,47,44,-34,-2147483648,2,44,45,
-5,46,2,47,44,-35,-2147483648,2,44,45,-3,46,2,47,44,-13,-2147483648,-4,0,-20,-2147483648,-5,44,-12,-2147483648,1,0,-5,44,-36,-2147483648,-3,44,5,37,38,39,44,44,-34,-2147483648,-2,44,
2,37,38,-3,46,3,39,44,44,-32,-2147483648,-2,44,1,37,-6,46,2,47,44,-32,-2147483648,2,44,45,-7,46,2,47,44,-32,-2147483648,2,44,45,-6,46,2,47,44,-34,-2147483648,2,
44,45,-4,46,2,47,44,-36,-2147483648,6,44,45,46,46,47,44,-38,-2147483648,-4,44,-57,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"demo_tileset","path":"tilesets/demo_tileset/demo_tileset.yy",},"userdefinedDepth":true,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_1","depth":132,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":23,"SerialiseWidth":40,"TileCompressedData":[
-418,-2147483648,3,277,278,279,-37,-2147483648,3,309,310,311,-37,-2147483648,3,341,342,343,-419,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tile_terrain","path":"tilesets/tile_terrain/tile_terrain.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Base_terrain","depth":232,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":23,"SerialiseWidth":40,"TileCompressedData":[
-920,118,],"TileDataFormat":1,},"tilesetId":{"name":"tile_terrain","path":"tilesets/tile_terrain/tile_terrain.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 720,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 1280,
  },
  "sequenceId": null,
  "views": [
    {"hborder":320,"hport":840,"hspeed":-1,"hview":420,"inherit":false,"objectId":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},"vborder":180,"visible":true,"vspeed":-1,"wport":1500,"wview":750,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}