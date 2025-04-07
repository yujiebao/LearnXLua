print("*************Lua调用C# 重载函数相关知识点**************")
Lesson6 = CS.Lesson6
local obj = Lesson6()
--Lua不支持  但是Lua支持调用C#的重载函数
print(obj:Calc())
print(obj:Calc(1))
print(obj:Calc(1,2))
--Lua虽然支持调用C#重载函数
--但是因为Lua中的数值类型 只有Number  --->对C#中的多精度的重载函数 支持不好  傻傻分不清
--可能会引起问题  
print(obj:Calc(1.5,2.6))

--解决重载函数含糊的问题
--xlua提供了解决方案 反射机制
--这种方法只做了解 尽量别用  尽量不使用精度来进行重载(int float double)
--Type是反射的关键类
--得到指定函数的相关信息
local m1 =  typeof(CS.Lesson6):GetMethod("Calc",{typeof(CS.System.Single),typeof(CS.System.Single)})
local f1 = xlua.tofunction(m1)
print(f1(obj,1.5,2.6))
