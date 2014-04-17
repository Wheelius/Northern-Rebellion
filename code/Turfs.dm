turf
	//walls------------------------------------------------------------------------
	StoneWall
		icon='stonewall.dmi'
		density= 1
		opacity= 1
	WoodWall
		icon='woodwall.dmi'
		density=1
		opacity=1
	//floors-----------------------------------------------------------------------
	Grass
		icon = 'grass.dmi'
	start
		icon ='grass.dmi'
	tree
		icon ='tree.dmi'
		density=1
		opacity=1
	leaves
		icon='leaves.dmi'
		density=0
		opacity=0
	Dirt
		icon='dirt.dmi'
	stonefloor
		icon='stonefloor.dmi'
	woodfloor
		icon='woodfloor.dmi'
	//Doors--------------------------------------------------------------------------
	WoodenDoor
		icon = 'wooddoorgrass.dmi'
		icon_state = "closed"
		density = 1
		opacity = 1
		Click()
			if(!density)//open already
				icon_state = "closed"
				density=!density
				opacity=!opacity
			else if(density)//closed
				icon_state = "open"
				density=!density
				opacity=!opacity
			else
				..()
	Woodendoor
		icon = 'wooddoorstone.dmi'
		icon_state = "closed"
		density = 1
		opacity = 1
		Click()
			if(!density)//open already
				icon_state = "closed"
				density=!density
				opacity=!opacity
			else if(density)//closed
				icon_state = "open"
				density=!density
				opacity=!opacity
			else
				..()
	//-----------------------------------------------------------------
mob
	Throne
		icon='throne.dmi'
		density=1
		Click()
			src.loc=loc
			usr<<"you take a seat on the Throne! Congratulations!"