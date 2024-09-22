
execute store result score #temp player_action.data if items entity @s weapon.mainhand *[minecraft:custom_data={player_action:{click_detection:1b}}]

execute if score #temp player_action.data matches 0 if entity @s[tag=player_action.click_detection] run function player_action:v1.6/player/click_detection/end
execute if score #temp player_action.data matches 1 run function player_action:v1.6/player/click_detection/process
