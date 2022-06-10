extends CanvasLayer

var score = 0

func _ready():
	$ScoreLabel.text = ("Score: " +  str(score))
	
func update_score():
	$ScoreLabel.text = ("Score: " + str(score))

func _on_Goal_goal_scored():
	score -= 1
	update_score()

func _on_Goal2_goal_scored():
	score += 1
	update_score()
