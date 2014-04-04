bind(entity_damage, null, null, @event, 
if(@event['cause'] == 'STARVATION'){
  set_peffect(@event['player'],2,0,5,false)
  set_peffect(@event['player'],4,0,5,false)
  set_peffect(@event['player'],16,0,5,false)
  set_peffect(@event['player'],17,0,5,false)
  set_peffect(@event['player'],18,0,5,false)
  cancel()
}
)
bind(creature_spawn, null, null, @event,
if(!is_cancelled()){
  if(@event['reason'] == NATURAL){
    if(@event[type] == ZOMBIE){
		if(rand(1,6) == 2){
		#broadcast(BossZomboid @event[location][x] @event[location][y] @event[location][z])
			queue_delay(1)
			queue_push(closure(
			if(entity_exists(@event[id])){
			  set_mob_name(@event[id],cc(color(dark_blue),'Health Zombie'))
			  set_name_visible(@event[id],false)
			  #set_ploc(ryan_the_leach,@event[location])
			  #set_max_health(@event[id],get_max_health(@event[id])*2)
			  #set_entity_health(@event[id],100)
			  set_mob_effect(@event[id], 8, 3, 60*60*60, true)
			  set_mob_effect(@event[id], 1, 0, 60*60*60, true)
			  set_equipment_droprates(@event[id], array(HELMET:0,CHESTPLATE:0.25,LEGGINGS:0.25,BOOTS:0.25,WEAPON:1))
			  set_mob_equipment(@event[id], array(
				HELMET: array(type:'397:3'), 
				CHESTPLATE: array(type:299, color: array(r:rand(255),b:rand(255),g:rand(255))), 
				LEGGINGS: array(type:300, color: array(r:rand(255),b:rand(255),g:rand(255))), 
				BOOTS: array(type:301, color: array(r:rand(255),b:rand(255),g:rand(255))), 
				WEAPON: array(type:'373:8261')
			  ))
			  ))
			}
		}
    }
  }
}
)

bind(entity_death, null, null, @event,
#broadcast(@event)
)