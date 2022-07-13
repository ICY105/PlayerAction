# PlayerAction
A Minecraft datapack library that wraps various player actions into selector and function tag calls. This library currently handles:
* Right click detection using Villagers or COAS/WFOAS
* Interactioning with certain blocks
* Interacting with certain entities
* Detecting movement
* Detecting riding entities

This is an embedded library, so you package it inside your datapack as opposed to having a separate download. Requires [LanternLoad](https://github.com/LanternMC/load) to operate.

## NBT Format
These are NBT data specifications for items, storage, or entities that hold special data.

```
Items that should use Villager based click detection when held. Clicks are passed back by function tags.
Item.tag{player_action:{click_detection:1b}}
```

## Scoreboards
These are scoreboard objectives used to represent a value of some kind.

```
player_action.data
  Used for math and passing variables between functions.
```

```
player_action.uuid.0
player_action.uuid.1
player_action.uuid.2
player_action.uuid.3
  These 4 scoreboards hold a players UUID. Do not modify these manually.
```

```
player_action.x
player_action.y
player_action.z
  These 3 scoreboards hold a players position, using a scale of x70
  (the largst possible withouth causing over/under flow). Do not modify these manually.
```

```
player_action.<action>
player_action.<block>
  There are many scoreboard values covering various interactions. These are used internally
  and should not be access directly.
```

## Selector Tags
These are tags (added throught the /tag command) that mark entities as being something, or as needing to do something.

```
Players will have these tags when activly performing the corresponding action:
 - player_action.moving: any movement, even if not a direct player input (such as falling)
 - player_action.flying: creative mode flight
 - player_action.walking
 - player_action.falling
 - player_action.climbing
 - player_action.elyra_flying
 - player_action.swimming
 - player_action.sneaking
 - player_action.sprinting
 - player_action.riding_pig
 - player_action.riding_boat
 - player_action.riding_mule
 - player_action.riding_llama
 - player_action.riding_horse
 - player_action.riding_donkey
 - player_action.riding_strider
 - player_action.riding_minecart
```

## Function Tags
Functions tags are called by PlayerAction to inform you an event has happened. To use these calls, you must implement your desired actions in a function and add it to the target function tag list. Remember that function tag calls do not target a specific datapack, so you will need to verfiy the conditions are correct before applying actions (like check if a player is holding a special item when right clicking):

```
function #player_action:v1/died
  Triggers whenever a players dies.
  
function #player_action:v1/enchanted
  Triggers whenever a player enchants an item.
  
function #player_action:v1/joined
  Triggers whenever a player joins the world, either loading a world
  in single player or joining a multiplayer server.
  
function #energy:v1/jumped
  Triggers player_action a player jumps.
  
function #player_action:v1/left_click
  Triggers when a player left clicks while holding a click-detection enabled item (see NBT format).
  
function #player_action:v1/right_click
  Triggers when a player right clicks while holding a click-detection enabled item (see NBT format),
  or when they right click a Carrot on a Stick or Warped Fungus on a Stick.
```

```
The following tags trigger when a player interacts with a block. In most cases this means opening a GUI,
but can also be caused by placing an item on a campfire for example.
  function #player_action:v1/interact_block
  function #player_action:v1/open_gui
  
  function #player_action:v1/interact_anvil
  function #player_action:v1/interact_barrel
  function #player_action:v1/interact_beacon
  function #player_action:v1/interact_blast_furnace
  function #player_action:v1/interact_brewingstand
  function #player_action:v1/interact_cake
  function #player_action:v1/interact_campfire (both types)
  function #player_action:v1/interact_cartography table
  function #player_action:v1/interact_cauldron
  function #player_action:v1/interact_chest
  function #player_action:v1/interact_crafting_table
  function #player_action:v1/interact_dispenser
  function #player_action:v1/interact_dropper
  function #player_action:v1/interact_enderchest
  function #player_action:v1/interact_flower_pot
  function #player_action:v1/interact_furnace
  function #player_action:v1/interact_grindstone
  function #player_action:v1/interact_hopper
  function #player_action:v1/interact_jukebox
  function #player_action:v1/interact_lectern
  function #player_action:v1/interact_loom
  function #player_action:v1/interact_noteblock
  function #player_action:v1/interact_shulker_box
  function #player_action:v1/interact_smithing_table
  function #player_action:v1/interact_smoker
  function #player_action:v1/interact_stonecutter
  function #player_action:v1/interact_trapped_chest
```

## How to use
1. Install [LanternLoad](https://github.com/LanternMC/load) in your datapack
2. Copy the `data/player_action` folder into your data pack
3. Merge the contents of `PlayerAction/data/load/tags/functions/load.json` and your own `data/load/tags/functions/load.json`
4. Implement the API as described above.

For easier mangament of dependencies, check out my project [Datapack Build Manager](https://github.com/ICY105/DatapackBuildManager).
