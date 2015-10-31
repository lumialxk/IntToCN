# IntToCN
IntToCN help you transform int to chinese characters,including simple and complex(simple for daily life,complex for finance usage)

1 class funtion available
class func intToCN(int: Int?, complex: Bool) -> String
you can also use this in Objective-C(import "bundleName-Swift" needed)


中国用户:
  只用调用class func intToCN(int: Int?, complex: Bool) -> String,即可将数字转为中文数字(包括大写的),complex为false时返回的是大写
数字,最多13位.
