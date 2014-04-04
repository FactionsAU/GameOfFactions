bind(player_join, null, null, @event,
  @worlds = get_values('reset_worlds')
  @pworldnode = cc('reset_worlds.',pworld())
  if(array_contains(array_keys(@worlds),@pworldnode)){
broadcast(@worlds)
    if(@worlds[@pworldnode] > plast_played()){
      set_ploc(get_spawn('world_newton'))
    }
  }
)