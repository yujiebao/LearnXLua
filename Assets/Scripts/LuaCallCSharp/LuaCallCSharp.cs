using System.Collections;
using System.Collections.Generic;
using Unity.Android.Types;
using UnityEngine;

#region 第一次课 调用类函数
public class Test{
    public void Speak(string str)
    {
        Debug.Log("Test"+str);
    }
}

namespace SelfSpace{
    public class Test2{
        public void Speak(string str)
        {
            Debug.Log("Test2"+str);
        }
    }
}

#endregion

#region 第二次课 调用枚举类型
/// <summary>
/// 自定义测试枚举
/// </summary> <summary>
public enum E_MyEnum
{
    Idle,
    Move,
    Attack,
    Die
}
#endregion

#region 第三次课 调用数组 字典
public class Lesson3
{
    public int[] array = new int[5]{1,2,3,4,5};

    public List<int> list = new List<int>();
    public Dictionary<int,string> dict = new Dictionary<int, string>();
}
#endregion

#region 第四次课 拓展方法
public class Lesson4
{
    public string name = "Lesson4";

    public void Speak()
    {
        Debug.Log("Speak:"+name);
    }
    public static void Eat()
    {
        Debug.Log("吃东西");

    }
}

//想要在Lua中使用拓展方法 一定要在工具类前面加上特定
//建议 Lua中要使用的类 都加上该特性 可以提升性能
//如果不加该特性 除了拓展方法对应的类 其它类的使用 都不会报错
//但是Lua是通过反射的机制去调用的c#类 效率较低
[XLua.LuaCallCSharp]
public static class Tool
{
    public static void Move(this Lesson4 lesson4)
    {
        Debug.Log(lesson4.name + "移动");
    }
}
#endregion

#region 第五次课 ref和out
public class Lesson5
{
    public int RefFun(int a ,ref int b,ref int c,int d)
    {
        b = a + d;
        c = a - d;
        return b*c;
    }

    public int OutFun(int a,out int b,out int c,int d)
    {
        b = a + d;
        c = a - d;
        return b*c;
    }

    public int RefOutFun(int a,ref int b,out int c,int d)
    {
        b = a + d;
        c = a - d;
        return b*c;
    }
}
#endregion

#region 第六次课 函数重载
public class Lesson6
{
    public int Calc()
    {
        return 1;
    }

    public int Calc(int a , int b)
    {
        return a + b;
    }

    public int Calc(int a)
    {
        return a;
    }

    public float Calc(float a , float b)
    {
        return a + b ;
    }
    
}
#endregion
public class LuaCallCSharp : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
