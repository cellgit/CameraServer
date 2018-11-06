---
title: Leaf of Vapor Server Side 
---


###### Sun, Oct 27, 2018, ShaHe University Park, BeiJing : 北京昌平沙河高教园
######Device: macOS Mojave and Version: 10.14 Beta (18A371a)

`注`: 在项目创建Leaf过程中出现报错,提示 : 已经有一个相同地址的项目在运行中,解决方法: 暴力解决(关机重启)

1. 在`.package`文件添加依赖:依赖
```
.package(url: "https://github.com/vapor/leaf.git", from: "3.0.0-rc"),
```
如下图:
![image.png](https://upload-images.jianshu.io/upload_images/2553151-e7f53304a2f10625.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2. 终端切换到项目所在的文件夹目录:如下图
![image.png](https://upload-images.jianshu.io/upload_images/2553151-2a0f7da95c1a41aa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3. 执行 `vapor update`
如下图:
![image.png](https://upload-images.jianshu.io/upload_images/2553151-b892a1aba3c52a46.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4. 根据提示第一个输入选择:`y`


5.在`configure`设置写入以下图示代码:
```
try services.register(LeafProvider())

config.prefer(LeafRenderer.self, for: ViewRenderer.self)
```

![image.png](https://upload-images.jianshu.io/upload_images/2553151-8f6373ac382af6b4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

6. 创建`Resources`->`Views`文件夹
1). 
![image.png](https://upload-images.jianshu.io/upload_images/2553151-94d03fc12fcd2903.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
2). 
![image.png](https://upload-images.jianshu.io/upload_images/2553151-8c063c35a35d78bc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



7. 在Resources`->`Views` 创建一个NewFile: `index.leaf`文件
如下图:
![image.png](https://upload-images.jianshu.io/upload_images/2553151-85cbf7347bd4a51b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/2553151-a8f6c4225ab3beec.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

8. 在`index.leaf`中写入以下代码并转换成html文件,如下图:
```
<html>

<head></head>

<body>
<h1>Welcome to Side Swift Using Vapor</h1>
</body>

</html>
```
![image.png](https://upload-images.jianshu.io/upload_images/2553151-803a9f0915381ed8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/2553151-a11e485b05ee5f36.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

9. 在`routes`文件写入以下代码:
```
router.get("hello") { req in
        return try req.view().render("index")
    }
```

![image.png](https://upload-images.jianshu.io/upload_images/2553151-07bf839556dd1189.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


10. `command + R` 运行并在浏览器打开:
`http://localhost:8080/hello`
效果如下:
![image.png](https://upload-images.jianshu.io/upload_images/2553151-ad97c62e5218cc1b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)