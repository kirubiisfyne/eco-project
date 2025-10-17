extends Control
class_name QuestBanner

@onready var quest_placeholder: VBoxContainer = $PanelContainer/VBoxContainer

func _ready() -> void:
	Quests.objectify.connect(add_and_change_objective)
	Quests.remove_objective_UI.connect(remove_objective)

func add_and_change_objective(npc_name: String, trash_number: int, plant_number: int, quest_id: int) -> void:
	var created_text: String
	if quest_id == 2:
		if (trash_number > 0 and plant_number == 0):
			created_text = "Help " + npc_name + "\n out with cleaning " + str(trash_number) + " trashes."
		elif (trash_number == 0 and plant_number > 0):
			created_text = "Help " + npc_name + "\n out with planting " + str(plant_number) + " lands."
		elif (trash_number > 0 and plant_number > 0):
			created_text = "Help " + npc_name + "\n out with cleaning & planting " + str(trash_number) + " trashes, & " + str(plant_number) + "\n lands"
	elif quest_id == 3:
		created_text = "Talk to " + npc_name + "."

	var objective_text = Label.new()
	var qp_children: Array[String]
	for i in quest_placeholder.get_children():
		qp_children.append(i.name)

	objective_text.name = "QuestOf" + npc_name
	objective_text.text = created_text

	if not qp_children.has(objective_text.name):
		quest_placeholder.add_child(objective_text)

	elif qp_children.has(objective_text.name):
		var old_objective_text = quest_placeholder.get_node("QuestOf" + npc_name)
		old_objective_text.text = created_text

func remove_objective(npc_name: String) -> void:
	var qp_children: Array[String]
	for i in quest_placeholder.get_children():
		qp_children.append(i.name)
	
	if qp_children.has("QuestOf"+npc_name):
		var old_objective = quest_placeholder.get_node("QuestOf" + npc_name)
		old_objective.call_deferred("queue_free")
