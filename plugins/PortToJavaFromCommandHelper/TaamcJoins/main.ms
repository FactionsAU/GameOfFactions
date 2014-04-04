proc(_firstjoin2,@player,
pgive_item(@player,299,1,array(display: cc(color(DARK_GREEN),@player,'\'s Armor'), lore: array(cc(color(GREY),@player,'\'s Starter Armor'),cc(color(RED),'You only get it once!')), color: array(r: 117, b: 34, g: 175)))
pgive_item(@player,272,1,array(display: cc(@player,'\'s Sword'), lore: array(cc(color(GREY),@player,'\'s Starter Sword'),cc(color(RED),'You only get it once!'))))
pgive_item(@player,393,64,array(display: cc(@player,'\'s Taters'), lore: array(cc(color(GREY),@player,'\'s Starter Food'),cc(color(GREEN),'What\'s Taters, eh?'))))
pgive_item(@player,284,1,array(display: cc(@player,'\'s Land Grabber'), lore: array(cc(color(GREY),@player,'\'s Land Grabber'),cc(color(GOLD),'Used to protect land'),cc(color(GOLD),'You can make another!'),cc(color(blue),'Sign up on www.taamc.com'),cc(color(blue), 'for extra claim blocks'))))
pgive_item(@player,328,1,array(display: cc(@player,'\'s Cart'), lore: array(cc(color(GREY),@player,'\'s Starter cart'),cc(color(GREEN),'Ride the Rails at the station'),cc(color(RED),'(Coming soon in the nether)'))))
pgive_item(@player,'358:4',1,array(display: cc(color(DARK_GRAY),@player,'\'s ',color(DARK_GREEN),color(l),'Map of Oldtown'), lore: array(cc(color(DARK_GRAY),'------------------------------------'), cc(color(DARK_BLUE),'map.taamc.com',color(DARK_GRAY),' for a live map!'), cc(color(DARK_GREEN),'To build exit Oldtown National Park'))))
pgive_item(@player,355,1,array(display: cc(@player,'\'s Sleeping Bag'), lore: array(cc(color(GREY),@player,'\'s Starter Bed'),cc(color(GREEN),'Use /bed to return to'),cc(color(GREEN),'The last place you rested'),cc(color(GREEN),'your sleepy head'))))
pgive_item(@player,322,1,array(display: cc(@player,'\'s Starter Apple'), lore: array(cc(color(GREY),@player,'\'s Starter Apple'),cc(color(GREEN),'This server has no health'),cc(color(GREEN),'regen from food, golden'),cc(color(GREEN),'apples and potions will be important'))))
pgive_item(@player,373,1,array(display: cc(@player,'\'s Starter Potion'), main: 10, potions: array(array(ambient: true, id: 22, seconds: 60*15, strength: 1),array(ambient: true, id: 23, seconds: 60*15, strength: 0),array(ambient: true, id: 11, seconds: 60*15, strength: 2)), lore: array(cc(color(GREY),@player,'\'s Starter Potion (15m)'),cc(color(GREEN),'Protects you for your first night'),cc(color(GREEN),'Sleep in a bed before its too late'),cc(color(GREEN),'/randomtp for quick wilderness access'),cc(color(GREEN),'No Hunger, Resist 3, 4 Gold Hearts'))))
queue_delay(5000)
queue_push(closure(
@entityid = pinfo(@player,13)
set_max_health(@entityid,30)
set_peffect(@player,6,0,1,true)
  team_add_player(new,@player)
  set_pscore(newExpires,@player,(get_pscore(newExpires,@player) + (20 * 60 * 15)))
tmsg(@player,cc(color(green),'Think kits are overpowered? /mulan to ditch the kit and get recognition!'))
))
)


bind(player_join, null, null, @event,

ifelse(phas_played(@event[player]) == false,
  _firstjoin2(@event[player])
  broadcast(cc(color(LIGHT_PURPLE),@event[player],' has joined the game for the first time'))

  foreach(all_players(),@p){
    play_sound(ploc(@p),array(sound:'CAT_PURREOW',volume:2,pitch:0.5))
  }
  launch_firework(ploc(@event[player]),array(flicker:true,colors:'LIME',fade:'YELLOW',type:'BURST'))
,
  foreach(all_players(),@p){
    play_sound(ploc(@p),array(sound:'LEVEL_UP',volume:2,pitch:0.5))
  }
)
)

#every minute
set_interval(1000*60,closure(
  foreach(all_players(),@p){
    if(get_pscore(newExpires,@p) < get_pscore(playtime,@p)){
      team_remove_player(new,@p)
    }
  }
))