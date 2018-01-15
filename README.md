# batch-rgb-color

## 说明
> 动态修改当前字体颜色槽为指定的RGB颜色


## 调用参数
* [-m mode] R G B 
* mode - 模式 [0-specifiedColor指定RGB] [1-randomColor随机颜色] [2-deskWallpaperColor桌面壁纸主色] [3-defaultColor重置默认颜色], 默认值为1
* R - 红色代码[0-255], mode值为0时传递, 无则自动生成随机值
* G - 绿色代码[0-255], mode值为0时传递, 无则自动生成随机值
* B - 蓝色代码[0-255], mode值为0时传递, 无则自动生成随机值


## 更新
* 2018-01-15 23:12:24 增加mode参数设置RGB颜色来源


## 预览
<div align=center><img src="https://github.com/bjc5233/batch-rgb-color/raw/master/resources/colorTable.png"/></div>
<div align=center><img src="https://github.com/bjc5233/batch-rgb-color/raw/master/resources/demo.png"/></div>