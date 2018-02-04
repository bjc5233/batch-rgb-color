# batch-rgb-color

## 说明
> 动态修改当前字体颜色槽为指定的RGB颜色


## 调用参数
* mode [R] [G] [B]
* mode - 模式[0\color] [1\random] [2\desk] [3\default] 默认值为1
* &emsp;&emsp;&emsp;&emsp;0\color - specifiedColor需要指定RGB值
* &emsp;&emsp;&emsp;&emsp;1\random - randomColor随机颜色
* &emsp;&emsp;&emsp;&emsp;2\desk - deskWallpaperColor桌面壁纸主色调
* &emsp;&emsp;&emsp;&emsp;3\default - defaultColor重置默认颜色
* R - 红色代码[0-255], mode值为0时传递, 无则自动生成随机值
* G - 绿色代码[0-255], mode值为0时传递, 无则自动生成随机值
* B - 蓝色代码[0-255], mode值为0时传递, 无则自动生成随机值



## 更新
* 2018-01-15 23:12:24 增加mode参数设置RGB颜色来源


## 预览
<div align=center><img src="https://github.com/bjc5233/batch-rgb-color/raw/master/resources/colorTable.png"/></div>
<div align=center><img src="https://github.com/bjc5233/batch-rgb-color/raw/master/resources/demo.png"/></div>