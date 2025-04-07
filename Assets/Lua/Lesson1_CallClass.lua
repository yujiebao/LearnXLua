print("**********Lua调用C#类的相关知识**************")
--lua中使用C#的类非常简单
--固定套路
--CS.命名空间.类名
--Unity的类比如 GameObject Transform等等   ————CS.UnityEngine.类名

--通过C#中的类 实例化一个对象 Lua中没有new 所以我们直接 类名括号就是实例化对象
--默认调用的 相当于就是无参构造
-- local gameObject = CS.UnityEngine.GameObject()
local gameObject2 = CS.UnityEngine.GameObject("test")   --重载函数

--为了方便使用 并且节约性能  定义全局变量存储 C#中的类
Gameobject = CS.UnityEngine.GameObject
-- local gameObject3 = Gameobject("全局变量实例化")

--类中的静态对象 可以直接使用.来调用
local gameObject4 = Gameobject.Find("test")

--得到对象中的成员变量直接对象.即可
-- print(gameObject4.transform.position)     --Lua打印
CS.UnityEngine.Debug.Log(gameObject4.transform.position)   --C#打印

Vector3 = CS.UnityEngine.Vector3
--通过要使用对象中的成员方法  一定要使用:
gameObject4.transform:Translate(Vector3.right)

--自己定义的类
local t = CS.Test()
t:Speak("speak")
local t2 = CS.SelfSpace.Test2()
t:Speak("speak")

--继承了Mono的类  --不能直接new
local gameObject5 = Gameobject("测试添加脚本")
--通过AddComponent添加脚本   Lua没有泛型
--XLua提供了一个重要方法 typeof 可以得到类的Type
--XLua中不支持无参泛型函数 所以我们要使用另一个重载
gameObject5:AddComponent(typeof(CS.LuaCallCSharp))