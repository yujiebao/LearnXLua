print("******************Lua调用 C#委托和事件相关******************")
Lesson7 = CS.Lesson7
local obj = Lesson7()

print("******************Lua调用 C#委托******************")
--委托就是用来装函数
--使用C#中的委托  就是用来装Lua函数的
local fun= function ()
    print("Lua Call delegate")
end

local fun2 = function ()
    print("Lua Call delegate2")
end

--Lua中没有复合运算符 不能+=
--如果第一次向委托中添加函数直接赋值 先让变量确定类型
obj.del = fun
--向del中以多播的形式再添加函数  不建议直接添加function(类似匿名函数)不好管理 移除不了
obj.del = obj.del + fun2
-- obj.del = obj.del + function ()
--     print("Lua Call delegate3 不建议使用")
-- end
obj.del()
--移除函数
print("移除函数")
obj.del = obj.del - fun2
-- obj.del = nil    全部清空
obj.del()

print("******************Lua调用 C#事件******************")
local fun3 = function ()
    print("Lua Call event")
end
--事件加减和委托非常不一样
obj:eventAction("+",fun)
obj:eventAction("+",fun2)
obj:eventAction("+",fun3)
obj:DoEvent()
obj:eventAction("-",fun2)
obj:DoEvent()
--事件清除  不能直接nil
obj:ClearEvent()
obj:DoEvent()