print("主Lua脚本")
GameObject = CS.UnityEngine.GameObject
function IsNull(obj)
    if obj == nil or obj:Equals(nil) then
        return true
    end
    return false
end
--Unity中写lua执行
--xlua帮我们处理
--只要是执行lua脚本 都会自动的进入我们的重定向函数中找文件  unity中定义的loader
-- require("test")
-- require("Lesson1_CallClass")
-- require("Lesson2_CallEnum")
-- require("Lesson3_CallListDic")
-- require("Lesson4_CallFunction")
-- require("Lesson5_CallFunction")
-- require("Lesson6_CallFunction")
-- require("Lesson7_CalDelegate")
-- require("Lesson8_Special")
-- require("Lesson9_Special")
-- require("Lesson10_Special")
-- require("Lesson11_Coroutine")
require("Lesson12_T")