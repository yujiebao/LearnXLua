-- print("**************Lua调用C# 二维数组相关知识点*************")
Lesson8 = CS.Lesson8
local obj = Lesson8()
print("行："..obj.array:GetLength(0))
print("列："..obj.array:GetLength(1))

--获取元素
--不能通过[0,0]或者[0][0]访问元素  Lua只支持一位数组
for i = 0 , obj.array:GetLength(0)-1 do
    for j = 0 , obj.array:GetLength(1)-1 do
        print(obj.array:GetValue(i,j))
    end
end