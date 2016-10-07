local redis = (loadfile "./libs/redis.lua")()
local token = arg[1] or "271857798:AAHd7vqHLuKsatSqMAtElNF71Tu0rTJ1nbQ"
local bot, extension = require("lua-bot-api").configure(token)
extension.onInlineQueryReceive = function (qmsg)
	local photo1_url = 'http://uupload.ir/files/k3sv_sd.png'
	local qresult = {}
	qresult.id= qmsg.id
	qresult.title='لینک شما'
	qresult.type = 'article'
	qresult.description = 'فرستادن لینک دعوت شما...'
	qresult.thumb_url = photo1_url
	qresult.message_text = ("🚫 شما هنوز در ربات عضو نیستید برای عضویت در pv ربات start/ را ارسال کنید @Sphero_Ch")
	local chash = 'cuser:'..qmsg.from.id
	local hash = 'juser:'..qmsg.from.id
	if redis:get(hash) then
	if redis:get(chash) then
    qresult.message_text = "💢لینک معرفی:\nhttps://telegram.me/SpheroFreeBot?start="..qmsg.from.id.."\n\n💢 اعتبار:"..redis:get(chash).."\n\nوقتی که ۱۵ نفر توسط شما دعوت بشن میتونی گروه رایگانتو هر زمانی که بخوای بسازی\n\nدر ضمن هروقت یه نفر توسط شما دعوت بشه منم بهت همون موقع اطلاع میدم❗️زود باش لینک رو به دوستات بده...\n\nحتما باید ۱۵ نفر با لینک تو داخل ربات عضو بشن(فقط ارسال به ۱۵ نفر کافی نیست)\nکانال ما ; @Sphero_Ch"
	else
	redis:set(chash,0)
	qresult.message_text = "💢لینک معرفی:\nhttps://telegram.me/SpheroFreeBot?start="..qmsg.from.id.."\n\n💢 اعتبار:"..redis:get(chash).."\n\nوقتی که ۱۵ نفر توسط شما دعوت بشن میتونی گروه رایگانتو هر زمانی که بخوای بسازی\n\nدر ضمن هروقت یه نفر توسط شما دعوت بشه منم بهت همون موقع اطلاع میدم❗️زود باش لینک رو به دوستات بده...\n\nحتما باید ۱۵ نفر با لینک تو داخل ربات عضو بشن(فقط ارسال به ۱۵ نفر کافی نیست)\nکانال ما ; @Sphero_Ch"
end
end
    local res = bot.answerInlineQuery(qmsg.id, qresult)
    end
-- override onMessageReceive function so it does what we want
extension.onMessageReceive = function (msg)
	print("پیام تازه از طرف: " .. msg.from.first_name.."\nپیام:\n"..msg.text)
		if string.match(msg.text, "^/start (.*)$") then
		local hash = 'juser:'..msg.from.id
		local fhash = 'juser:'..string.sub(msg.text, 8)
		local fchash = 'cuser:'..string.sub(msg.text, 8)
		local chash = 'cuser:'..msg.from.id
		if not redis:get(hash) then
    	redis:set(hash,true)
    	redis:set(chash,0)
 local ahash = 'tiagoh:users'
        redis:hset(ahash, msg.from.id, 'newuser')
    	bot.sendMessage(msg.chat.id, "سلام "..msg.from.first_name.."\nبا من میتونی بی نهایت گروه رایگان ضداسپم و ضدلینک بگیری\n\nهیچ کاری نداره، تو فقط باید این لینکی رو که پایین میدم رو به دوستات بدی تا من با اونها از طریق تو آشنا شم.\n\n💢لینک معرفی:\nhttps://telegram.me/SpheroFreeBot?start="..msg.from.id.."\n\n🔥وقتی که ۱۵ نفر توسط شما دعوت بشن میتونی گروه رایگانتو هر زمانی که بخوای بسازی🔥\n\nدر ضمن هروقت یه نفر توسط شما دعوت بشه منم بهت همون موقع اطلاع میدم\n\n💥لیست دستورات اصلی:\n/creategp name - ساخت گروه\n/mylink - نمایش لینک معرفی شما\n\n❗️زود باش لینک رو به دوستات بده...\n\nحتما باید ۱۵ نفر با لینک تو داخل ربات عضو بشن(فقط ارسال به ۱۵ نفر کافی نیست)\nکانال ما ; @Sphero_Ch")
    	if redis:get(fhash) then
    	redis:incr(fchash)
    	bot.sendMessage(msg.chat.id, " به دوست شما برای ورود شما یک امتیاز داده شد :|")
    	bot.sendMessage(string.sub(msg.text, 8) , "تبریک،یک نفر از طرف شما وارد ربات شد و به اعتبار شما یک عضو افزوده شد")
	else 
		bot.sendMessage(msg.chat.id, "کد دعوت واردشده اشتباه است ولی به هرحال برای شما مشکلی وجود ندارد:)")
	end
else
			bot.sendMessage(msg.chat.id, "⁉️شما فقط میتوانید یک نفر را دعوت کنید")
end
elseif string.match(msg.text, "^[!/#]users$") then
		 if msg.from.username == 'MrBlackLife' then
 local ahash = 'tiagoh:users'
local names = redis:hkeys(ahash)
    local text = 'لیست کاربران بات :\n\n'
    for i=1, #names do
      text = text..'> '..names[i]..'\n'
    end
    	bot.sendMessage(msg.from.id, text)
end
	elseif string.match(msg.text, "^[!/#]adduser$") then
		 if msg.from.username == 'MrBlackLife' then
			redis:hset(ahash, msg.from.id, 'newuser')
			bot.sendMessage(msg.from.id, '1 نفر به لیستت اضافه شد)
				end
	elseif string.match(msg.text, "^[!/#]mylink$") or msg.text == 'لینک من' then
		local chash = 'cuser:'..msg.from.id
		local hash = 'juser:'..msg.from.id
		if redis:get(hash) then
		if redis:get(chash) then
    	bot.sendMessage(msg.chat.id, "💢لینک معرفی:\nhttps://telegram.me/SpheroFreeBot?start="..msg.from.id.."\n\n💢 اعتبار:"..redis:get(chash).."\n\nوقتی که ۱۵ نفر توسط شما دعوت بشن میتونی گروه رایگانتو هر زمانی که بخوای بسازی\n\nدر ضمن هروقت یه نفر توسط شما دعوت بشه منم بهت همون موقع اطلاع میدم❗️زود باش لینک رو به دوستات بده...\n\nحتما باید ۱۵ نفر با لینک تو داخل ربات عضو بشن(فقط ارسال به ۱۵ نفر کافی نیست)\n@Sphero_Ch")
	    else
		redis:set(chash,0)
		bot.sendMessage(msg.chat.id, "💢لینک معرفی:\nhttps://telegram.me/SpheroFreeBot?start="..msg.from.id.."\n\n💢 اعتبار:"..redis:get(chash).."\n\nوقتی که ۱۵ نفر توسط شما دعوت بشن میتونی گروه رایگانتو هر زمانی که بخوای بسازی\n\nدر ضمن هروقت یه نفر توسط شما دعوت بشه منم بهت همون موقع اطلاع میدم❗️زود باش لینک رو به دوستات بده...\n\nحتما باید ۱۵ نفر با لینک تو داخل ربات عضو بشن(فقط ارسال به ۱۵ نفر کافی نیست)\n@Sphero_Ch")
		end
		end
    	elseif string.match(msg.text, "^[!/#]start$") then
		local hash = 'juser:'..msg.from.id
		local chash = 'cuser:'..msg.from.id
		if not redis:get(hash) then
    	redis:set(hash,true)
    	redis:set(chash,0)
local ahash = 'tiagoh:users'
    redis:hset(ahash, msg.from.id, 'newuser')
    	bot.sendMessage(msg.chat.id, "سلام "..msg.from.first_name.." \nبا من میتونی تعداد نامحدود گروه ضد اسپم با ربات  دریافت کنی\n\nهیچ کاری نداره، تو فقط باید این لینکی رو که پایین میدم رو به دوستات بدی تا من با اونها از طریق تو آشنا شم.\n\n💢لینک معرفی:\nhttps://telegram.me/SpheroFreeBot?start="..msg.from.id.."\n\nوقتی 15 نفر آوردی میتونی هر وقت خواستی گروه رایگانتو بگیری\n\nدر ضمن هروقت یه نفر توسط شما دعوت بشه منم بهت همون موقع اطلاع میدم\n\n💥لیست دستورات اصلی:\n/creategp - ساخت گروه\n/mylink - نمایش لینک معرفی شما\n\n❗️زود باش لینک رو به دوستات بده...\n\nحتما باید ۱۵ نفر با لینک تو داخل ربات عضو بشن(فقط ارسال به ۱۵ نفر کافی نیست)\nکانال ما ; @Sphero_Ch")
	    else
		bot.sendMessage(msg.chat.id, "سلام "..msg.from.first_name.."\nقبلا یکبار عضو شدی ها☹️")
	end
		elseif string.match(msg.text, "^[!#/]creategp (.*)$") then
		local chash = 'cuser:'..msg.from.id
		local hash = 'juser:'..msg.from.id
		if redis:get(hash) then
			if tonumber(redis:get(chash)) >= 15 then
		redis:set(chash,tonumber(redis:get(chash)) - 15)
		bot.sendMessage(196009168, "creategroup "..msg.from.id.."."..string.sub(msg.text, 11))
		bot.sendMessage(msg.chat.id, '👏گروه "'..string.sub(msg.text, 11)..'" ساخته شد و 15 عضو از اعتبار شما کسر شد و شما با موفقیت در ان عضو شده به صاحب گروه ارتقا پیدا کردید\n‼️اگر مشکلی در هنگام کار پیش امد لطفا از صفحه اسکرین شات گرفته و به:\n@MrBlackLife👈\nبفرستید🤗')
			else
		bot.sendMessage(msg.chat.id,"🚫 شما اعتبار کافی ندارید\n\n💢لینک معرفی:\nhttps://telegram.me/SpheroFreeBot?start="..msg.from.id.."\n\n💢 اعتبار:"..redis:get(chash).."\n\n🔥وقتی که ۱۵ نفر توسط شما دعوت بشن میتونی گروه رایگانتو هر زمانی که بخوای بسازی🔥\n\nدر ضمن هروقت یه نفر توسط شما دعوت بشه منم بهت همون موقع اطلاع میدم❗️زود باش لینک رو به دوستات بده...\n\nحتما باید ۱۵ نفر با لینک تو داخل ربات عضو بشن(فقط ارسال به ۱۵ نفر کافی نیست )@Sphero_Ch")
	end
	end
		elseif string.match(msg.text, "^[!#/]creategp$") then
		bot.sendMessage(msg.chat.id, "🚫 !creategp name\nاسم گروه لطفا اسم گروه را  به درستي وارد نماييد.")
	end
end

-- This runs the internal update and callback handler
-- you can even override run()
extension.run()
