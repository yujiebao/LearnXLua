print("***************Lua调用C#  ref和out方法相关知识点***************")
Lesson5 = CS.Lesson5
local obj = Lesson5()

--ref参数 会以多返回值的形式返回给Lua
local a,b,c = obj:RefFun(1,2,3,4)   --传入的参数不够的时候 会自动将后面的补0   为保持一致性 一帮传入值占位
-- a——>返回值  b——>ref参数1  c——>ref参数
print(a,b,c)

--out参数  会以多返回值的形式返回给Lua
--如果函数存在返回值 那么第一个值 就是该返回值
--之后的返回值 就是out的结果 从左到右一一对应
--out参数 不需要传占位置的值
print("*********out*************")
local a,b,c = obj:OutFun(1,4)
print(a,b,c)

--out和ref都包含的参数
print("*********out和ref*************")
local a,b,c = obj:RefOutFun(1,2,4)
print(a,b,c)
--综合使用的时候各自遵循他们的规则 
--ref占位  out不传