print("**************Lua调用C# 泛型函数相关的知识点*************")

Lesson12 = CS.Lesson12
local obj = Lesson12()

local son = Lesson12.TestSon()
local father = Lesson12.TestFather()
obj:TestFun(son,father)
obj:TestFun(father,son)

--Lua中不支持没有约束的泛型函数
-- obj:TestFun2(son,father)

--Lua中不支持有约束但是没有参数的泛型函数
-- obj:TestFun3()

--Lua中不支持非class的约束
-- obj:TestFun4(son)


--有一定的使用限制
--Mono打包 这种方式支持使用
---il2cpp打包  如果泛型参数是引用类型才可以使用
---il2cpp打包  如果泛型参数是值类型，除非C#那边已经调用过了 同类型的泛型参数 lua中才能够被使用
---
--补充知识 让上面 不支持使用的泛型函数  变得能用
-- 得到通用函数
-- 设置泛型类型再使用
--xlua.get_generic_method(类名,函数名)
local testFunc2 = xlua.get_generic_method(Lesson12,"TestFun2")
local testFunc2_R = testFunc2(CS.System.Int32)
--调用泛型函数
--成员方法  第一个参数 传调函数的对象
--静态方法 不用传
testFunc2_R(obj,1)