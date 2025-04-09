print("*********Lua调用C#协程相关知识点*********")
-- 一定需要执行了(require)了才能使用
util = require("xlua.util")
--C#中协程后动都是通过继承了Mono的类 通过里面的启动数startcoroutine
WaitForSeconds = CS.UnityEngine.WaitForSeconds
--在场景中新建空物体  挂载脚本
local obj = GameObject("Coroutine")
local mono = obj:AddComponent(typeof(CS.LuaCallCSharp))

--想要开启的协程函数
fun = function  ()
    local a = 1
    while true do
        coroutine.yield(WaitForSeconds(1))
        print("协程执行中"..a)
        a = a + 1
        if a >10 then
            mono:StopCoroutine(b)
        end
    end
end

--我们不能直接将 lua函数传到开始协程中
--如果要把lua函数当做协程函数传入
--必须 先调用 xlua.util中的cs_generator(lua函数)
b = mono:StartCoroutine(util.cs_generator(fun))
