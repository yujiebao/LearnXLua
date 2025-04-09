print("***************Lua调用C# nil和null比较的相关知识点***************")
GameObject = CS.UnityEngine.GameObject
Rigidbody = CS.UnityEngine.Rigidbody

local obj = GameObject("测试添加脚本 --nil和null的检测")
local rig = obj:GetComponent(typeof(Rigidbody))
print(rig)
--判断是否为空
--nil和null不能 == 比较
--lua中定义全局的IsNull方法
-- if IsNull(rig) then   --定义了IsNull全局方法 包装了Equals方法
--     print("rig为空")
--     rig = obj:AddComponent(typeof(Rigidbody))
-- end
-- print(rig)

--C#中定义IsNull方法
if rig:IsNull() then
    print("rig为空")
    rig = obj:AddComponent(typeof(Rigidbody))
end
print(rig)