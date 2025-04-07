print("****************Lua调用C#数组 list dictionary相关知识点****************")
print("***************Lua调用C#数组相关知识点***************")
local obj = CS.Lesson3()

--Lua使用C#数组相关知识
--长度 userdata
--C#怎么用 lua就怎么用 不能使用#去获取长度
print(obj.array.Length)

--遍历要注意 虽然lua中索引从1开始
--但是数组是C#那边的规则 所以 还是得按c#的来
--最大值减1
for i=0,obj.array.Length-1 do
    print(obj.array[i])
end

--Lua中创建一个C#的数组  Lua中表示数组和List可以用表
local array2 = CS.System.Array.CreateInstance(typeof(CS.System.Int32), 10)
-- print(type(array2))   userdata类型
-- print(array2.Length)
-- for i=0,array2.Length-1 do
--     print(array2[i])
-- end

print("***************Lua调用C# List相关知识点***************")
-- local listdate = obj.list
-- listdate:Add(1)
-- listdate:Add(2)
-- listdate:Add(3)
-- listdate:Add(4)
-- print(listdate.Count)


-- local  a = obj.list
-- a:Add(1)
-- a:Add(2)
-- a:Add(3)
-- a:Add(4)
-- print(a.Count)
-- for i = 0,a.Count-1 do
--     print(a[i])
-- end

obj.list:Add(3)
obj.list:Add(5)
obj.list:Add(7)
obj.list:Add(4)
print(obj.list.Count)
for i = 0,obj.list.Count-1 do
    print(obj.list[i])
end

--在Lua中创建一个C#的List对象
--老版本
-- local list2 = CS.System.Collections.Generic["List`1[System.String]"]()
-- list2:Add("123")
-- print(list2[0])
--新版本
list_String = CS.System.Collections.Generic.List(typeof(CS.System.String))   --指定类型
list2 = list_String()   --实例化
list2:Add("123")
print(list2[0])

print("***************Lua调用C# Dictionary相关知识点***************")
obj.dict:Add(1,"123")
print(obj.dict)
print(obj.dict[1])   --[key]

--遍历
for k,v in pairs (obj.dict) do
    print(k,v)
end

--在Lua中创建一个字典
local Dic_String_Vector3 = CS.System.Collections.Generic.Dictionary(typeof(CS.System.String),typeof(CS.UnityEngine.Vector3))
dic = Dic_String_Vector3()
dic:Add("123",CS.UnityEngine.Vector3(1,2,3))
dic:Add("124",CS.UnityEngine.Vector3(1,2,3))

-- print(dic["123"])  直接通过[]是nil
-- 如果要通过键获取值 要通过这个固定方法
print(dic:get_Item("123"))
-- print(dic:TryGetValue("123",CS.UnityEngine.Vector3()))   --Unity中的方法
--设置值
dic:set_Item("123",CS.UnityEngine.Vector3(2,3,4))
print(dic:get_Item("123"))

for k,v in pairs (dic) do
    print(k,v)
end