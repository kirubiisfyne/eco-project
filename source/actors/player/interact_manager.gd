extends Node
class_name InteractManager

@onready var raycast_2D: RayCast2D = $"../RayCast2D"

@export var animation_man: AnimationManager

func _input(event: InputEvent) -> void:
	var inter_obj = raycast_2D.get_collider()
	if inter_obj and Input.is_action_just_pressed("interact"):
		if PlayerConditionals.is_dialogue == false\
		and inter_obj.has_method("interact"):
			animation_man.put_away_anim()
			inter_obj.interact()
	


	#if PlayerConditionals.is_dialogue == false:
		#if Input.is_action_just_pressed("interact"):
			#if inter_obj and inter_obj.has_method("interact"):
				#inter_obj.interact()
