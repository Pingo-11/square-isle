extends Interactable

@export
var particles: GPUParticles2D

func interact(character: CharacterBody2D):
	particles.restart()
