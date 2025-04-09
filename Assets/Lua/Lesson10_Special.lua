UI = CS.UnityEngine.UI

local sider = GameObject.Find("Slider")
print(sider)
local sliderScript = sider:GetComponent(typeof(UI.Slider))
print(sliderScript)
sliderScript.onValueChanged:AddListener(function(value)
    print("当前进度为：" .. value)
end)   --直接传入函数会报错 AddListener的参数是unity自带的委托类型此处相当于要把Lua的function传入C#中用于UnityAction委托 
       -- 而UnityAction，没有CSharpCallLua的特性  需要再C#中做相应处理
