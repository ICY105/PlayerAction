
function player_action:v1.5/player/remove_tags

execute unless score @s player_action.uuid.0 matches -2147483648.. run function player_action:v1.5/player/set_uuid
function player_action:v1.5/player/is_moving
function player_action:v1.5/player/process_data
function player_action:v1.5/player/click_detection/tick

function player_action:v1.5/player/reset_scores

function #player_action:v1/tick
