for _,module_settings in next,{"disableAutoShaman","disableAfkDeath","disableAutoScore"} do
    tfm.exec[module_settings](true)
end
maps = {
    {map="@7711812" ,difficulty="<vp> Easy",category="<vp>CT2"},
    {map="@7712575" ,difficulty="<vp> Easy",category="<vp>CT2"}, 
    {map="@7712598" ,difficulty="<vp> Easy",category="<vp>CT2"}, 
    {map="@7719350" ,difficulty="<vp> Easy",category="<vp> CT2"},
    {map="@7719524" ,difficulty="<j> Medium",category="<j> CT3"}, 
    {map="@7726206" ,difficulty="<vp> Easy",category="<vp> CT2"}, 
    {map="@7727560" ,difficulty="<j> Medium",category="<j> CT3"},
    {map="@7727868" ,difficulty="<vp> Easy",category="<vp> CT2"},
    {map="@7730512" ,difficulty="<vp> Easy",category="<vp> CT2"},
    {map="@7731011" ,difficulty="<r> Hard",category="<r> CT1"},
    {map="@6158764" ,difficulty="<vp> Easy",category="<vp> CT2"},
    {map="@7731679" ,difficulty="<vp> Easy",category="<vp> CT2"},
    {map="@6195684" ,difficulty="<vp> Easy",category="<vp> CT2"},
    {map="@7731981" ,difficulty="<vp> Easy",category="<vp> CT2"},
    {map="@6159770" ,difficulty="<vp> Easy",category="<N2> CT5"},
    {map="@7731505" ,difficulty="<j> Medium",category="<N2> CT5"},
    {map="@7728158" ,difficulty="<vp> Easy",category="<N2> CT5"},
    {map="@7732564" ,difficulty="<r> Hard",category="<r> CT1"},
    {map="@6195529" ,difficulty="<j> Medium",category="<j> CT3"},
    {map="@6195408" ,difficulty="<j> Medium",category="<j> CT3"},
    {map="@6195101" ,difficulty="<vp> Easy",category="<vp> CT2"},
    {map="@7739224" ,difficulty="<r> Hard",category="<r> CT1"},
    {map="@7732006" ,difficulty="<r> Hard",category="<r> CT1"},
    {map="@7736314" ,difficulty="<vp> Easy",category="<rose> CT4"},
    {map="@7741183" ,difficulty="<r> Hard",category="<r> CT1"},
}
translation = {
    en = {
        help = "<p align='center'><font size='19'>In this module <b><fc>#LavaRun</fc></b> you must becareful of the lava that <b><fc>ascends</fc></b>, you should get the <b><fc> cheese</fc></b> and <b><fc>win</fc></b> as soon as possible and never give a chance to the <b><fc>lava</fc></b> to approach you. type <b><fc>!menu</fc></b> to open your private menu , <b><r> [Warning] : </r></b><n>  Please turn on the FULLSCREEN to see the whole of the maps!</n>\n",
        commands_part1 = "<p align='center'><font size='19'><fc><b>#Lavarun commands</b></font></p>\n<p align='left'><font size='19'><fc> !menu\n\n!profile\n\n!points\n\n!staff",
        commands_part2 = "<font size='15'> to open the menu\n\nto open your profile\n\nto see your points\n\nto see the staff list of lavarun",
        other = "<n>It's time to</n> <fc>fly!</fc><n> , you must press Down Arrow to shoot </n><fc>Cannons</fc><n> to reach the cheese on the other side</n>",
        wins ="<font size='19'><b> wins :",
        died ="<font size='19'><b> deaths :",
        communitys ="<font size='19'><b> community :",
        close_button = "<a href='event:closeprofile'><p align='center'><font size='16'><r><b> [Close]",
    },
    ar = {
        help = "<p align='center'><font size='19'> في هذا النمط يجب عليك الحذر من اللاافا  التي تصعد ويجب عليك التقاط الجبن والفوز في اقرب وقت ممكن وعدم منح اللاافا فرصة التقرب منك اكتب ايعاز \n <b><fc>!menu </b></fc> \n لفتح القائمة الخاصة بك !",
        commands_part1 = "<p align='center'><font size='19'><fc><b>#Lavarun commands</b></font></p>\n<p align='left'><font size='19'><fc> !menu\n\n!profile\n\n!points\n\n!staff",
        commands_part2 = "<font size='15'> لفتح القائمة\n\nلفتح بروفايلك الشخصي / او بروفايل شخص ما\n\nللحصول على العدد الإجمالي لنقاطك\n\nلرؤية اسماء مدراء ومشرفين النمط",
        other = "<n> حان وقت </n><fc>الطيران</fc>\n<n> إضغط على الزر السفلي لإطلاق </n><fc>الكرات</fc><n>\n للوصول الى الجبن من الجهة الأخرى</n>",
        wins ="<font size='19'><b> مرات الفوز : ",
        died ="<font size='19'><b> مرات الموت : ",
        communitys ="<font size='19'><b> المجتمع :",
        close_button = "<a href='event:closeprofile'><p align='center'><font size='16'><r><b> [اغلاق]",
    }
}
admins = {["Aron#6810"] = true , ["Aronmaps#5892"] = true , ["King_seniru#5890"] = true}
mapper = {[""] = true}
players = {}
Sentences = {"<fc>[Lavarun] : </fc><j> write !menu to open the menu !","<fc>[Lavarun] : </fc><j> You can write !points to see your points !","<fc>[Lavarun] : </fc><j> You can use flying power when you have 10 points"}
date = false
lava = false
local mapIndex = 0
local images = {}
function ui.addImage(id, imageName, target, x, y, playerTarget)
    images[id] = images[id] or {}
    if playerTarget then
        if images[id][playerTarget] then
            ui.removeImage(id, playerTarget)
        end
        images[id][playerTarget] = tfm.exec.addImage(imageName, target, x, y, playerTarget)
    else
        for n in next, tfm.get.room.playerList do
            if images[id][n] then
                ui.removeImage(id, n)
            end
            images[id][n] = tfm.exec.addImage(imageName, target, x, y, n)
        end
    end
end
function ui.removeImage(id, playerTarget)
    if images[id] then
        if playerTarget then
            if images[id][playerTarget] then
                tfm.exec.removeImage(images[id][playerTarget])
                images[id][playerTarget] = nil
            end
        else

            for n in next, tfm.get.room.playerList do
                if images[id][n] then
                    tfm.exec.removeImage(images[id][n])
                    images[id][n] = nil
                end
            end
        end
    end
end
function tran(n, id)
    if translation[tfm.get.room.playerList[n].community] then
      return translation[tfm.get.room.playerList[n].community][id]
    else
      return translation["en"][id]
    end
end

mapIndx = math.random(#maps)
tfm.exec.newGame(maps[mapIndx].map)

star_lava = 0
lavay = 407
killzone = 434
function eventLoop(past,left)
    star_lava = star_lava + 1
    if star_lava == 5 then
        lava_star = 0
        lava = true
    end
    if left < 1000 then
        mapIndx = math.random(#maps)
        tfm.exec.newGame(maps[mapIndx].map)
    end
    if lava == true then
        lavay = lavay - 4
        killzone = killzone - 4
        ui.addImage(2,"1727b68eeb9.png","!1",-390,lavay,nil)
        for n, p in pairs(tfm.get.room.playerList) do
            if  p.y > killzone  then
                tfm.exec.killPlayer(n)
            end
        end
    end
end

rounds = 0
lavay = 407
killzone = 434
function eventNewGame()
    star_lava = 0
    lavay = 407
    killzone = 434
    rounds = rounds + 1
    for name , player in next, tfm.get.room.playerList do
        tfm.exec.respawnPlayer(name)
    end
    if rounds == 7 then
        rounds = 0
        tfm.exec.chatMessage(Sentences[math.random(#Sentences)])
    end
    for name, player in next, players do
		players[name].hasMeep = false
    end
    for admins in next, admins do
        if admins[name] then
            ui.addImage(3,"174684e0beb.png","$"..name,-34,-107)
        end
    end
    local author = tfm.get.room.xmlMapInfo.author
    local mapCode = tfm.get.room.xmlMapInfo.mapCode
    tfm.exec.setUIMapName(""..author.." - "..mapCode.. "<g> | </g> " .. "<n>Difficulty :</n>" .. " " .. maps[mapIndx].difficulty .. "<g> | </g> " .. "<n>Category : " .. " " .. maps[mapIndx].category)
end

function eventNewPlayer(name)
    for _,keys in next,{70,32,71,69,66} do
        tfm.exec.bindKeyboard(name,keys,true,true)
    end
    if admins[name] then
        ui.addImage(3,"174684e0beb.png","$"..name,-34,-107)
    end
    players[name] = {score=0 , wins=0 , dead=0,hasMeep=false , time = 0}
    tfm.exec.setPlayerScore(name,players[name].score)
    tfm.exec.chatMessage("<p align='center'><N>Welcome to </N><b><FC>#lavarun!</FC></b><br>Plase Type</br> <b><BV>!menu</BV></b><br>to open the menu (powers , commands , TOP5 , Help)</br><r>\n if you encountered any error please contact<b> Aron#6810</b></r></p>", name)
end

function eventKeyboard(name,key,down,x,y)
    if key == 70 then -- F
        if players[name].time+200 < os.time() then
            if players[name].score > 10 then
                tfm.exec.movePlayer(name,0,0,true,0,-50,false)
                tfm.exec.displayParticle(26,x-10,y,0,0,0,0,nil)
                if players[name] and players[name].score then
                    players[name].score = players[name].score - 10
                    tfm.exec.setPlayerScore(name,players[name].score)
                    players[name].time = os.time()
                end
            end
        end
    elseif key == 32 then -- space
        if players[name].score >= 15 and not players[name].hasMeep then
            tfm.exec.giveMeep(name,true)
            if players[name] and players[name].score then
                players[name].score = players[name].score - 15
                tfm.exec.setPlayerScore(name,players[name].score)
            end
            players[name].hasMeep = true
        end
    elseif key == 71 then -- G
        if players[name].score >= 20 then
            tfm.exec.movePlayer(name, 0, 0, false, 80, 0, false)
            tfm.exec.displayParticle(13,x-10,y,0,0,0,0,nil)
            if players[name] and players[name].score then
                players[name].score = players[name].score - 20
                tfm.exec.setPlayerScore(name,players[name].score)
            end
        end
    elseif key == 69 then -- E
        if players[name].score >= 50 and not tfm.get.room.playerList[name].hasCheese then
            tfm.exec.giveCheese(name)
            tfm.exec.displayParticle(11,x-10,y,0,0,0,0,nil)
            if players[name] and players[name].score then
                players[name].score = players[name].score - 50
                tfm.exec.setPlayerScore(name,players[name].score)
            end
        end
    elseif key == 66 then -- B
        if players[name].score >= 40 then
            explosion2(name, x, y)
            tfm.exec.displayParticle(3,x,y,9,0,0,0,nil)
            tfm.exec.displayParticle(3,x,y,-9,0,0,0,nil)
            if players[name] and players[name].score then
                players[name].score = players[name].score - 40
                tfm.exec.setPlayerScore(name,players[name].score)
            end
        end
    end
end

function eventPlayerMeep(name, x, y)
    tfm.exec.giveMeep(name,false)
	players[name].hasMeep = false
end

function explosion2(name, x0, y0)
    for k,v in pairs(tfm.get.room.playerList) do
        if not (k == name) then
            local x, y, angle, distance, powerX, powerY
            x = x0 - v.x
            y = y0 - v.y
            angle = math.atan(y/x) 
            distance = (x^2 + y^2)^(1/2)
            powerX = (-1000000 / distance^2)*math.cos(angle)
            powerY = (-1000000 / distance^2)*math.sin(angle)
            tfm.exec.movePlayer(k, 0, 0, false, powerX, powerY, false)
        end
    end
end

function eventChatCommand(name,command)
    local args = {}
    for name in command:gmatch("%S+") do
        table.insert(args, name)
    end
    if admins[name] then
        local member = args[2]
        if args[1] == "time" then
            tfm.exec.setGameTime(tonumber(args[2]),true)
        elseif args[1] == "map" then
            tfm.exec.newGame(tonumber(args[2]))
        elseif args[1] == "kill" then
            tfm.exec.killPlayer((args[2]))
        elseif args[1] == "p" then
            if players[member] and players[member].score then
                players[member].score = players[member].score + args[3]
                tfm.exec.setPlayerScore(member,players[member].score)
            end
        elseif args[1] == "banpowers" then
            for _,keys in next,{70,32,71,69,66} do
                tfm.exec.chatMessage("<fc>[Lavarun] : </fc><rose> You have been banned from using any power in the room :(",args[2])
                tfm.exec.bindKeyboard(args[2],keys,false,false)
            end
        elseif args[1] == "unbanpowers" then
            for _,keys in next,{70,32,71,69,66} do
                tfm.exec.chatMessage("<fc>[Lavarun] : </fc><rose> You can use your powers now !",args[2])
                tfm.exec.bindKeyboard(args[2],keys,true,true)
            end
        end
    end
    if command == "menu" then
        for _,remove_ui in next,{5,6,7,8,9} do
            ui.removeTextArea(remove_ui,name)
        end
        ui.addImage(1,"174556d8c59.png",":1",239,15,name) -- phone image
        ui.addTextArea(0, "<a href='event:powers'><p aling='center'><b> Powers", name, 297, 301, 57, 20, 0x000000, 0x000000, 1, true)
        ui.addTextArea(1, "<a href='event:help'><p aling='center'><b> Help", name, 363, 301, 57, 20, 0x000000, 0x000000, 1, true)
        ui.addTextArea(2, "<a href='event:commands'><font size='10'><p aling='center'><b> commands", name, 404, 301, 66, 28, 0x000000, 0x000000, 1, true)
        ui.addTextArea(3, "<a href='event:top5'><p aling='center'><b> TOP5", name, 363, 367, 56, 20, 0x000000, 0x000000, 1, true)
        ui.addTextArea(4, "<a href='event:close_menu'>                                                          \n                                                       ", name, 461, 39, 56, 48, 0x000000, 0x000000, 1, true)
        ui.addTextArea(9, "<font size='43'><b>" .. os.date("%H") .. ":" .. os.date("%M"), name , 308, 116, 147, 89, 0x000000, 0x000000, 1, true)
    elseif command == "staff" then
        tfm.exec.chatMessage("<v> Staff List : </v>\n<ch>«Developer»</ch><font color='#CD0000'> «Mapper» </font> <v> Aron#6810 </v>\n<bv>«Hoster»</bv><font color='#CD0000'> «Mapper» </font> <v> King_seniru#5890 </v> ")
    elseif command == "points" then
        if players[name] then
            tfm.exec.chatMessage("<fc>[Module] : </fc><n> You have : </n><fc>" .. players[name].score .. " " .. "points !",name)
        end
    elseif command == "profile" then
        community = string.upper(tfm.get.room.playerList[name].community)
        ui.removeTextArea(0,name)
        ui.addImage(1,"1745db5868e.png",":1",195,11,name)
        ui.addTextArea(1, tran(name,"died"), name, 254, 132, 132, 28, 0x152d30, 0x152d30, 1, true)
        ui.addTextArea(2, tran(name,"wins"), name, 255, 194, 132, 28, 0x152d30, 0x152d30, 1, true)
        ui.addTextArea(3, tran(name,"communitys"), name, 255, 250, 144, 28, 0x152d30, 0x152d30, 1, true)
        ui.addTextArea(4, "<font size='19'><p align='center'><v>" .. name, name, 279, 60, 192, 27, 0x152d30, 0x152d30, 1, true)
        ui.addTextArea(5, "<font size='19'><b><j>"..players[name].dead.." ", name, 411, 129, 89, 28, 0x152d30, 0x152d30, 1, true)
        ui.addTextArea(6, "<font size='19'><b><j>"..players[name].wins.." ", name, 412, 193, 88, 28, 0x152d30, 0x152d30, 1, true)
        ui.addTextArea(7, "<font size='19'><b><j>"..community.." ", name, 411, 249, 88, 28, 0x152d30, 0x152d30, 1, true)
        ui.addTextArea(8, "<a href='event:close'>                                            \n                                           ", name, 494, 52, 55, 50, 0x000000, 0x000000, 1, true)
    end
end

function eventPlayerWon(name)
    local alive = 0
    for name, player in next, tfm.get.room.playerList do
        if not player.isDead then
            alive = alive + 1
        end
    end
    if alive == 0 then
        mapIndx = math.random(#maps)
        tfm.exec.newGame(maps[mapIndx].map)
    end
    if players[name] and players[name].score then
        players[name].score = players[name].score + 4
        tfm.exec.setPlayerScore(name,players[name].score)
    end
    if players[name] and players[name].wins then
        players[name].wins = players[name].wins + 1
    end
end

function eventPlayerDied(name)
    local alive = 0
    for name, player in next, tfm.get.room.playerList do
        if not player.isDead then
            alive = alive + 1
        end
    end
    if alive == 0 then
        mapIndx = math.random(#maps)
        tfm.exec.newGame(maps[mapIndx].map)
    end
    if players[name] and players[name].score then
        players[name].score = players[name].score + 1
        tfm.exec.setPlayerScore(name,players[name].score)
    end
    if players[name] and players[name].dead then
        players[name].dead = players[name].dead + 1
    end
end


function eventTextAreaCallback(id,name,callback)
    if callback == "close_menu" then
        date = false
        ui.removeImage(1,name)
        for _,menu_bar in next,{0,1,2,3,4,7,8,9} do
            ui.removeTextArea(menu_bar,name)
        end
    elseif callback == "powers" then
        ui.addImage(1,"17455b29524.png",":1",143,65,name) -- powers image
        ui.removeTextArea(9,name) -- explosion power
        ui.removeTextArea(7,name)
        ui.removeTextArea(8,name)
        ui.addTextArea(0, "<font size='14'><b> Fly power ! - Status : <r>You can't use it", name, 238, 125, 359, 29, 0x000000, 0x000000, 1, true)
        ui.addTextArea(1, "<font size='11'><b> You need 10 point to use this powers !", name, 238, 157, 360, 29, 0x000000, 0x000000, 1, true)
        ui.addTextArea(2, "<font size='14'><b> Meep power ! - Status : <r>You can't use it", name, 238, 246, 360, 29, 0x000000, 0x000000, 1, true)
        ui.addTextArea(3, "<font size='11'><b> You need 15 point to use this powers !", name, 238, 280, 360, 28, 0x000000, 0x000000, 1, true)
        ui.addTextArea(4, "<p align='center'><font size='17'><b> Powers shop", name, 321, 88, 148, 28, 0x000000, 0x000000, 1, true)
        ui.addTextArea(6, "<a href='event:page2'>                                            \n                                       ", name, 592, 316, 44, 23, 0x000000, 0x000000, 1, true)
        ui.addTextArea(5, "<a href='event:close'>                                            \n                                       ", name, 619, 77, 66, 56, 0x000000, 0x000000, 1, true)
        if players[name].score >= 10 then
            ui.addTextArea(0, "<font size='14'><b> Fly power ! - Status : <vp>Press F", name, 238, 125, 359, 29, 0x000000, 0x000000, 1, true)
        end
        if players[name].score >= 15 then
            ui.addTextArea(2, "<font size='14'><b> Meep power ! - Status : <vp>Press Space", name, 238, 246, 360, 29, 0x000000, 0x000000, 1, true)
        end
    elseif callback == "page2" then
        for _,desc in next,{0,2} do
            ui.removeTextArea(desc,name)
        end
        ui.addImage(1,"17455d7cef9.png",":1",143,65,name) -- page2 image_powers
        ui.addTextArea(1, "<font size='11'><b> You need 20 point to use this powers !", name, 238, 157, 360, 29, 0x000000, 0x000000, 1, true)
        ui.addTextArea(3, "<font size='11'><b> You need 50 point to use this powers !", name, 238, 280, 360, 28, 0x000000, 0x000000, 1, true)
        ui.addTextArea(4, "<p align='center'><font size='17'><b> Powers shop", name, 321, 88, 148, 28, 0x000000, 0x000000, 1, true)
        ui.addTextArea(5, "<a href='event:close'>                                            \n                                       ", name, 619, 77, 66, 56, 0x000000, 0x000000, 1, true)
        ui.addTextArea(6, "<a href='event:page3'>                                            \n                                       ", name, 592, 316, 44, 23, 0x000000, 0x000000, 1, true)
        ui.addTextArea(7, "<font size='14'><b> Speed power ! - Status : <r>You can't use it", name, 238, 125, 359, 29, 0x000000, 0x000000, 1, true)
        ui.addTextArea(8, "<font size='14'><b> Cheese power ! - Status : <r>You can't use it", name, 238, 246, 360, 29, 0x000000, 0x000000, 1, true)
        ui.addTextArea(9, "<a href='event:powers'>                                            \n                                       ", name, 166, 316, 44, 23, 0x000000, 0x000000, 1, true)
        if players[name].score >= 20 then
            ui.addTextArea(7, "<font size='14'><b> Speed power ! - Status : <vp>Press G", name, 238, 125, 359, 29, 0x000000, 0x000000, 1, true)
        end
        if players[name].score >= 50 then
            ui.addTextArea(8, "<font size='14'><b> Cheese power ! - Status : <vp>Press E", name, 238, 246, 360, 29, 0x000000, 0x000000, 1, true)
        end
    elseif callback == "page3" then
        for _,desc_page2 in next,{7,8,1} do
            ui.removeTextArea(desc_page2,name)
        end
        ui.removeTextArea(9,name)
        ui.addImage(1,"17455cde0b8.png",":1",143,65,name) -- page3 image_powers
        ui.addTextArea(3, "<font size='11'><b> You need </font><font size='11' color='#A900DF'>40 points </font> to use this powers !", name, 262, 209, 360, 28, 0x000000, 0x000000, 1, true)
        ui.addTextArea(4, "<p align='center'><font size='17'><b> Powers shop", name, 321, 88, 148, 28, 0x000000, 0x000000, 1, true)
        ui.addTextArea(5, "<a href='event:close'>                                            \n                                       ", name, 619, 77, 66, 56, 0x000000, 0x000000, 1, true)
        ui.addTextArea(8, "<a href='event:page2'>                                                                    \n                                    ", name, 167, 319, 65, 31, 0x000000, 0x000000, 1, true)
        ui.addTextArea(9, "<font size='14' color='#A900DF'><b> Explosion power ! </font><font size='10'> - Status : <r>You can't use it", name, 262, 168, 435, 29, 0x000000, 0x000000, 1, true)
        if players[name].score >= 40 then
            ui.addTextArea(9, "<font size='14' color='#A900DF'><b> Explosion power ! </font><font size='14'> - Status : <vp>Press B", name, 262, 168, 335, 29, 0x000000, 0x000000, 1, true)
        end
    elseif callback == "close" then
        for _,every_uis in next,{0,1,2,3,4,5,6,7,8,9} do
            ui.removeTextArea(every_uis,name)
        end
        ui.removeImage(1,name)
    elseif callback == "help" then
        for _,re in next,{0,3,4,9} do
            ui.removeTextArea(re,name)
        end
        ui.addImage(1,"1745ad5c8be.png",":1",143,65,name)
        ui.addTextArea(1, tran(name,"help"), name, 168, 83, 489, 259, 0x000000, 0x000000, 1, true)
        ui.addTextArea(2, "<a href='event:close'>                                                                  \n                                        ", name, 672, 72, 52, 49, 0x000000, 0x000000, 1, true)
    elseif callback == "commands" then
        for _,re_commands in next,{0,4,5,6,7,8,9} do
            ui.removeTextArea(re_commands,name)
        end
        ui.addImage(1,"1745ad5c8be.png",":1",143,65,name)
        ui.addTextArea(1, tran(name,"commands_part1"), name, 168, 90, 489, 242, 0x000000, 0x000000, 1, true)
        ui.addTextArea(2, tran(name,"commands_part2"), name, 399, 132, 209, 198, 0x000000, 0x000000, 1, true)
        ui.addTextArea(3, "<a href='event:close'>                                                                  \n                                        ", name, 672, 72, 52, 49, 0x000000, 0x000000, 1, true)
    elseif callback == "top5" then
        tfm.exec.chatMessage("<fc>[Lavarun] : </fc><n>You can't open it :( </n>",name)
    end
end

table.foreach(tfm.get.room.playerList, eventNewPlayer)
