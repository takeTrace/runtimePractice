# runtimePractice
对 runtime 的常用方法使用

## 目的
加深理解 runtime 机制

## 常见使用方法:
``` C
objc_msgSend(p, @selector(eat));
lang -rewrite-objc main.m 重新生成 c++代码查看最终生成代码
objc_msgSend([Person class], @selector(eat));
Method imageWithName = class_getClassMethod(类, @selector(方法));
method_exchangeImplementations(方法1, 方法2);
class_addMethod(self, @selector(eat), eat, "v@:");
objc_getAssociatedObject(self, key);
objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
Ivar *ivarList = class_copyIvarList(self, &count)
Ivar ivar = ivarList[i];
ivar_getName(ivar)
ivar_getTypeEncoding(ivar)
```

更多详细的使用请看[我博客](http://taketrace.coding.me/2016/10/27/runtime/)