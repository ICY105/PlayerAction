
schedule function player_action:v1.5/tick 5t
schedule function player_action:v1.5/player/click_detection/tick_entities 100t
data merge storage player_action:temp {list:[], obj:{}, var:""}

# dummy
scoreboard objectives add player_action.data dummy

scoreboard objectives add player_action.uuid.0 dummy
scoreboard objectives add player_action.uuid.1 dummy
scoreboard objectives add player_action.uuid.2 dummy
scoreboard objectives add player_action.uuid.3 dummy

scoreboard objectives add player_action.x dummy
scoreboard objectives add player_action.y dummy
scoreboard objectives add player_action.z dummy

# movement
scoreboard objectives add player_action.aviate minecraft.custom:minecraft.aviate_one_cm
scoreboard objectives add player_action.climb minecraft.custom:minecraft.climb_one_cm
scoreboard objectives add player_action.fall minecraft.custom:minecraft.fall_one_cm
scoreboard objectives add player_action.fly minecraft.custom:minecraft.fly_one_cm
scoreboard objectives add player_action.walk minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add player_action.jump minecraft.custom:minecraft.jump

# other interactions
scoreboard objectives add player_action.death minecraft.custom:minecraft.deaths
scoreboard objectives add player_action.join minecraft.custom:minecraft.leave_game
scoreboard objectives add player_action.enchant minecraft.custom:minecraft.enchant_item
scoreboard objectives add player_action.use_coas minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add player_action.use_wfoas minecraft.used:minecraft.warped_fungus_on_a_stick
