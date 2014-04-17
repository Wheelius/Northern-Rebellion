mob/verb
	music()
		world<<sound('themesong.wav')
mob
	var
		str
		def
		hp
	verb
		Attack(mob/M as mob in oview(1))
			var/damage = usr.str - M.def
			if(damage <= 0)
				usr << "[M] easily evades your attack!"
				M << "You easily evade [usr]'s attack."
			else
				M.hp -= damage
				view() << "[usr] attacks [M] for [damage] HP!"
				M:deathcheck()
mob
	proc
		deathcheck()
			if(src.hp <= 0)
				view() << "[src] dies!"
				src.hp = 10
				src.Move(locate(1,50,1))
				usr.str += 1
				usr.def += 1
mob
	var/standing
	Login()
		if(!loc)
			loc = locate("start")
		..()
	icon = 'player.dmi'
	hp=100
	str=20
	def=10
	verb
		Heal()
			view()<<"You fall asleep!"
			sleep(100)
			hp=100
			view()<<"You awake feeling refeshed and ready for an adventure!"
mob/NPCs
	pikachu
		icon='pikachu.dmi'
		hp=1000
		def=200
		str=200
//begin ai---------------------------------------
mob
	Click()
		if(get_dist(src, usr) <= 1)
			usr.attack(src)

	Stat()
		stat(src)

		for(var/mob/ai/m in world)
			stat(" ")
			stat("AI mob", m)
			stat("target", m.target)
mob
	proc
		ai()
		hit_by(mob/m)
		attack(mob/target)
			target.hit_by(src)
	ai
		var
			mob/target

		New()
			..()
			spawn(rand(10,20)) ai()

		ai()
			if(target)
				if(get_dist(src, target) > 1)
					step_to(src, target)
					sleep(5)
				else
					attack(target)
					sleep(10)
					Attack()
			else
				// We try to acquire a target. If we get a target we
				// have a short delay before the next AI cycle. If we
				// don't get a target we continue wandering.
				get_target()
				if(target)
					sleep(5)
				else
					step_rand(src)
					sleep(20)

			spawn() ai()

		hit_by(mob/m)
			if(!target)
				target = m
		proc
			get_target()
		red
			icon_state = "red"
			icon='southgaurd.dmi'
			name="South Gaurd"
			hp=100
			def=10
			str=10
		blue
			icon_state = "blue"
			icon='northgaurd.dmi'
			name="North Gaurd"
			hp=20
			def=10
			str=30