print("***************Lua调用C#枚举相关知识点***************")
--枚举调用

--调用Unity当中的枚举
--枚举的调用规则 和 类的调用规则是一样的
--CS.命名空间.枚举名.枚举成员
PrimitiveType = CS.UnityEngine.PrimitiveType
GameObject = CS.UnityEngine.GameObject
local obj = GameObject.CreatePrimitive(PrimitiveType.Cube)     -- 枚举矩形

--自定义枚举
--存储枚举类型
E_MyEnum = CS.E_MyEnum
local myEnum = E_MyEnum.Idle
print(myEnum)

--枚举转换相关
--数值转枚举      --->__CastFrom
local myEnum2 = E_MyEnum.__CastFrom(1)
print(myEnum2)
--字符串转枚举
local myEnum3 = E_MyEnum.__CastFrom("Die")
print(myEnum3)
