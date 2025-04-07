print("************Lua调用C# 拓展方法相关知识点*************")
Lesson4 = CS.Lesson4
Lesson4.Eat();   --静态方法  属于类  用.就行  只有一个类

local obj = Lesson4()
--成员方法  一定要使用:  确定是哪个对象调用的
obj:Speak("你好")
--该方法为拓展方法
--需要再使用的C#脚本加上Lua调用C#的特性
obj:Move()   