//
//  IntToCN.swift
//  Kitchen
//
//  Created by 李现科 on 15/10/29.
//  Copyright © 2015年 深圳创世易明科技有限公司. All rights reserved.
//


class IntToCN: NSObject {
    
    override init() {
        super.init()
    }
    
    // complex: if you need complex version for finance usage(usually false)
    class func intToCN(int: Int, complex:Bool) -> String {
        if int == 0 {
            return "零"
        }
        var zhNumbers = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"]
        var units = ["", "十", "百", "千", "万", "十", "百", "千", "亿", "十","百","千"]
        if complex {
            zhNumbers = ["零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"]
            units = ["", "拾", "佰", "仟", "万", "拾", "佰", "仟", "亿", "拾","佰","仟"]
        }
        var cnInt = ""
        var currentNum = 0
        var beforeNum = 0
        let intLength = Int(floor(log10(Double(int))))
        for index in 0...intLength {
            currentNum = int/Int(pow(10.0,Double(index)))%10
            if index == 0{
                if currentNum != 0 {
                    cnInt = zhNumbers[currentNum]
                    continue
                }
            } else {
                beforeNum = int/Int(pow(10.0,Double(index-1)))%10
            }
            if [1,2,3,5,6,7,9,10,11].contains(index) {
                if currentNum == 1 && [1,5,9].contains(index) && index == intLength {
                    cnInt = units[index] + cnInt
                } else if currentNum != 0 {
                    cnInt = zhNumbers[currentNum] + units[index] + cnInt
                } else if beforeNum != 0 {
                    cnInt = zhNumbers[currentNum] + cnInt
                }
                continue
            }
            if [4,8,12].contains(index) {
                cnInt = units[index] + cnInt
                if (beforeNum != 0 && currentNum == 0) || currentNum != 0 {
                    cnInt = zhNumbers[currentNum] + cnInt
                }
            }
        }
        return cnInt
    }
}
