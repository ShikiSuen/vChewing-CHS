// Copyright (c) 2021 and onwards The vChewing Project (MIT-NTL License).
/*
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and
to permit persons to whom the Software is furnished to do so, subject to the following conditions:

1. The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

2. No trademark license is granted to use the trade names, trademarks, service marks, or product names of Contributor,
   except as required to fulfill notice requirements above.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Cocoa

// 這個模組果然還是要用 Regex 轉換會比較爽。
// 為防止與其他模組彼此發生可能的衝突，這段 String 擴展就用 private 開頭來私有化。
private extension String {
    mutating func regReplace(pattern: String, replaceWith: String = "") {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let range = NSRange(location: 0, length: count)
            self = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replaceWith)
        } catch { return }
    }
}

@objc class vChewingKanjiConverter: NSObject {
    @objc class func cnvTradToKangXi(_ strProcessed: String) -> String {
        var strProcessed = strProcessed
        strProcessed.regReplace(pattern: "偽", replaceWith: "僞")
        strProcessed.regReplace(pattern: "啟", replaceWith: "啓")
        strProcessed.regReplace(pattern: "吃", replaceWith: "喫")
        strProcessed.regReplace(pattern: "嫻", replaceWith: "嫺")
        strProcessed.regReplace(pattern: "媯", replaceWith: "嬀")
        strProcessed.regReplace(pattern: "峰", replaceWith: "峯")
        strProcessed.regReplace(pattern: "么", replaceWith: "幺")
        strProcessed.regReplace(pattern: "抬", replaceWith: "擡")
        strProcessed.regReplace(pattern: "稜", replaceWith: "棱")
        strProcessed.regReplace(pattern: "簷", replaceWith: "檐")
        strProcessed.regReplace(pattern: "汙", replaceWith: "污")
        strProcessed.regReplace(pattern: "洩", replaceWith: "泄")
        strProcessed.regReplace(pattern: "溈", replaceWith: "潙")
        strProcessed.regReplace(pattern: "潀", replaceWith: "潨")
        strProcessed.regReplace(pattern: "為", replaceWith: "爲")
        strProcessed.regReplace(pattern: "床", replaceWith: "牀")
        strProcessed.regReplace(pattern: "痺", replaceWith: "痹")
        strProcessed.regReplace(pattern: "痴", replaceWith: "癡")
        strProcessed.regReplace(pattern: "皂", replaceWith: "皁")
        strProcessed.regReplace(pattern: "著", replaceWith: "着")
        strProcessed.regReplace(pattern: "睪", replaceWith: "睾")
        strProcessed.regReplace(pattern: "秘", replaceWith: "祕")
        strProcessed.regReplace(pattern: "灶", replaceWith: "竈")
        strProcessed.regReplace(pattern: "粽", replaceWith: "糉")
        strProcessed.regReplace(pattern: "韁", replaceWith: "繮")
        strProcessed.regReplace(pattern: "才", replaceWith: "纔")
        strProcessed.regReplace(pattern: "群", replaceWith: "羣")
        strProcessed.regReplace(pattern: "唇", replaceWith: "脣")
        strProcessed.regReplace(pattern: "參", replaceWith: "蔘")
        strProcessed.regReplace(pattern: "蒍", replaceWith: "蔿")
        strProcessed.regReplace(pattern: "眾", replaceWith: "衆")
        strProcessed.regReplace(pattern: "裡", replaceWith: "裏")
        strProcessed.regReplace(pattern: "核", replaceWith: "覈")
        strProcessed.regReplace(pattern: "踴", replaceWith: "踊")
        strProcessed.regReplace(pattern: "缽", replaceWith: "鉢")
        strProcessed.regReplace(pattern: "針", replaceWith: "鍼")
        strProcessed.regReplace(pattern: "鯰", replaceWith: "鮎")
        strProcessed.regReplace(pattern: "麵", replaceWith: "麪")
        strProcessed.regReplace(pattern: "顎", replaceWith: "齶")
        strProcessed.regReplace(pattern: "口喫", replaceWith: "口吃")
        strProcessed.regReplace(pattern: "合着", replaceWith: "合著")
        strProcessed.regReplace(pattern: "名着", replaceWith: "名著")
        strProcessed.regReplace(pattern: "巨着", replaceWith: "巨著")
        strProcessed.regReplace(pattern: "鉅着", replaceWith: "鉅著")
        strProcessed.regReplace(pattern: "昭着", replaceWith: "昭著")
        strProcessed.regReplace(pattern: "所着", replaceWith: "所著")
        strProcessed.regReplace(pattern: "遺着", replaceWith: "遺著")
        strProcessed.regReplace(pattern: "顯着", replaceWith: "顯著")
        strProcessed.regReplace(pattern: "土着", replaceWith: "土著")
        strProcessed.regReplace(pattern: "着作", replaceWith: "著作")
        strProcessed.regReplace(pattern: "着名", replaceWith: "著名")
        strProcessed.regReplace(pattern: "着式", replaceWith: "著式")
        strProcessed.regReplace(pattern: "着志", replaceWith: "著志")
        strProcessed.regReplace(pattern: "着於", replaceWith: "著於")
        strProcessed.regReplace(pattern: "着書", replaceWith: "著書")
        strProcessed.regReplace(pattern: "着白", replaceWith: "著白")
        strProcessed.regReplace(pattern: "着稱", replaceWith: "著稱")
        strProcessed.regReplace(pattern: "着者", replaceWith: "著者")
        strProcessed.regReplace(pattern: "着述", replaceWith: "著述")
        strProcessed.regReplace(pattern: "着錄", replaceWith: "著錄")
        strProcessed.regReplace(pattern: "蹇喫", replaceWith: "蹇吃")
        strProcessed.regReplace(pattern: "大着", replaceWith: "大著")
        strProcessed.regReplace(pattern: "刊着", replaceWith: "刊著")
        strProcessed.regReplace(pattern: "玄着", replaceWith: "玄著")
        strProcessed.regReplace(pattern: "白着", replaceWith: "白著")
        strProcessed.regReplace(pattern: "住着", replaceWith: "住著")
        strProcessed.regReplace(pattern: "刻着", replaceWith: "刻著")
        strProcessed.regReplace(pattern: "卓着", replaceWith: "卓著")
        strProcessed.regReplace(pattern: "拙着", replaceWith: "拙著")
        strProcessed.regReplace(pattern: "查着", replaceWith: "查著")
        strProcessed.regReplace(pattern: "炳着", replaceWith: "炳著")
        strProcessed.regReplace(pattern: "原着", replaceWith: "原著")
        strProcessed.regReplace(pattern: "專着", replaceWith: "專著")
        strProcessed.regReplace(pattern: "焯着", replaceWith: "焯著")
        strProcessed.regReplace(pattern: "着論", replaceWith: "著論")
        strProcessed.regReplace(pattern: "着績", replaceWith: "著績")
        strProcessed.regReplace(pattern: "較着", replaceWith: "較著")
        strProcessed.regReplace(pattern: "彰着", replaceWith: "彰著")
        strProcessed.regReplace(pattern: "撰着", replaceWith: "撰著")
        strProcessed.regReplace(pattern: "編着", replaceWith: "編著")
        strProcessed.regReplace(pattern: "論着", replaceWith: "論著")
        strProcessed.regReplace(pattern: "雜着", replaceWith: "雜著")
        strProcessed.regReplace(pattern: "譯着", replaceWith: "譯著")
        strProcessed.regReplace(pattern: "地覈", replaceWith: "地核")
        strProcessed.regReplace(pattern: "多覈", replaceWith: "多核")
        strProcessed.regReplace(pattern: "氘覈", replaceWith: "氘核")
        strProcessed.regReplace(pattern: "杏覈", replaceWith: "杏核")
        strProcessed.regReplace(pattern: "非覈", replaceWith: "非核")
        strProcessed.regReplace(pattern: "覈三", replaceWith: "核三")
        strProcessed.regReplace(pattern: "覈下", replaceWith: "核下")
        strProcessed.regReplace(pattern: "覈災", replaceWith: "核災")
        strProcessed.regReplace(pattern: "覈武", replaceWith: "核武")
        strProcessed.regReplace(pattern: "覈狀", replaceWith: "核狀")
        strProcessed.regReplace(pattern: "覈桃", replaceWith: "核桃")
        strProcessed.regReplace(pattern: "覈彈", replaceWith: "核彈")
        strProcessed.regReplace(pattern: "覈戰", replaceWith: "核戰")
        strProcessed.regReplace(pattern: "覈糖", replaceWith: "核糖")
        strProcessed.regReplace(pattern: "覈醣", replaceWith: "核醣")
        strProcessed.regReplace(pattern: "晶覈", replaceWith: "晶核")
        strProcessed.regReplace(pattern: "熱覈", replaceWith: "熱核")
        strProcessed.regReplace(pattern: "反覈", replaceWith: "反核")
        strProcessed.regReplace(pattern: "卵覈", replaceWith: "卵核")
        strProcessed.regReplace(pattern: "果覈", replaceWith: "果核")
        strProcessed.regReplace(pattern: "剋覈", replaceWith: "剋核")
        strProcessed.regReplace(pattern: "覈力", replaceWith: "核力")
        strProcessed.regReplace(pattern: "覈子", replaceWith: "核子")
        strProcessed.regReplace(pattern: "覈仁", replaceWith: "核仁")
        strProcessed.regReplace(pattern: "覈心", replaceWith: "核心")
        strProcessed.regReplace(pattern: "覈四", replaceWith: "核四")
        strProcessed.regReplace(pattern: "覈果", replaceWith: "核果")
        strProcessed.regReplace(pattern: "覈型", replaceWith: "核型")
        strProcessed.regReplace(pattern: "覈苷", replaceWith: "核苷")
        strProcessed.regReplace(pattern: "覈能", replaceWith: "核能")
        strProcessed.regReplace(pattern: "覈傘", replaceWith: "核傘")
        strProcessed.regReplace(pattern: "覈發", replaceWith: "核發")
        strProcessed.regReplace(pattern: "覈電", replaceWith: "核電")
        strProcessed.regReplace(pattern: "覈塵", replaceWith: "核塵")
        strProcessed.regReplace(pattern: "覈酸", replaceWith: "核酸")
        strProcessed.regReplace(pattern: "覈膜", replaceWith: "核膜")
        strProcessed.regReplace(pattern: "覈爆", replaceWith: "核爆")
        strProcessed.regReplace(pattern: "痔覈", replaceWith: "痔核")
        strProcessed.regReplace(pattern: "陰覈", replaceWith: "陰核")
        strProcessed.regReplace(pattern: "殽覈", replaceWith: "殽核")
        strProcessed.regReplace(pattern: "結覈", replaceWith: "結核")
        strProcessed.regReplace(pattern: "菌覈", replaceWith: "菌核")
        strProcessed.regReplace(pattern: "煤覈", replaceWith: "煤核")
        strProcessed.regReplace(pattern: "着涎茶", replaceWith: "著涎茶")
        strProcessed.regReplace(pattern: "喫口令", replaceWith: "吃口令")
        strProcessed.regReplace(pattern: "鄧艾喫", replaceWith: "鄧艾吃")
        strProcessed.regReplace(pattern: "杏仁覈", replaceWith: "杏仁核")
        strProcessed.regReplace(pattern: "覈一廠", replaceWith: "核一廠")
        strProcessed.regReplace(pattern: "覈二廠", replaceWith: "核二廠")
        strProcessed.regReplace(pattern: "覈三廠", replaceWith: "核三廠")
        strProcessed.regReplace(pattern: "覈融合", replaceWith: "核融合")
        strProcessed.regReplace(pattern: "覈四廠", replaceWith: "核四廠")
        strProcessed.regReplace(pattern: "覈生化", replaceWith: "核生化")
        strProcessed.regReplace(pattern: "覈災變", replaceWith: "核災變")
        strProcessed.regReplace(pattern: "覈動力", replaceWith: "核動力")
        strProcessed.regReplace(pattern: "覈試爆", replaceWith: "核試爆")
        strProcessed.regReplace(pattern: "杏覈兒", replaceWith: "杏核兒")
        strProcessed.regReplace(pattern: "原子覈", replaceWith: "原子核")
        strProcessed.regReplace(pattern: "覈分裂", replaceWith: "核分裂")
        strProcessed.regReplace(pattern: "覈化學", replaceWith: "核化學")
        strProcessed.regReplace(pattern: "覈反應", replaceWith: "核反應")
        strProcessed.regReplace(pattern: "覈半徑", replaceWith: "核半徑")
        strProcessed.regReplace(pattern: "覈污染", replaceWith: "核污染")
        strProcessed.regReplace(pattern: "覈武器", replaceWith: "核武器")
        strProcessed.regReplace(pattern: "覈苷酸", replaceWith: "核苷酸")
        strProcessed.regReplace(pattern: "覈蛋白", replaceWith: "核蛋白")
        strProcessed.regReplace(pattern: "覈黃疸", replaceWith: "核黃疸")
        strProcessed.regReplace(pattern: "覈黃素", replaceWith: "核黃素")
        strProcessed.regReplace(pattern: "覈裝置", replaceWith: "核裝置")
        strProcessed.regReplace(pattern: "覈電廠", replaceWith: "核電廠")
        strProcessed.regReplace(pattern: "覈廢料", replaceWith: "核廢料")
        strProcessed.regReplace(pattern: "覈彈頭", replaceWith: "核彈頭")
        strProcessed.regReplace(pattern: "覈潛艇", replaceWith: "核潛艇")
        strProcessed.regReplace(pattern: "覈燃料", replaceWith: "核燃料")
        strProcessed.regReplace(pattern: "桃覈雕", replaceWith: "桃核雕")
        strProcessed.regReplace(pattern: "細胞覈", replaceWith: "細胞核")
        strProcessed.regReplace(pattern: "棗覈臉", replaceWith: "棗核臉")
        strProcessed.regReplace(pattern: "以微知着", replaceWith: "以微知著")
        strProcessed.regReplace(pattern: "見微知着", replaceWith: "見微知著")
        strProcessed.regReplace(pattern: "恩威並着", replaceWith: "恩威並著")
        strProcessed.regReplace(pattern: "視微知着", replaceWith: "視微知著")
        strProcessed.regReplace(pattern: "睹微知着", replaceWith: "睹微知著")
        strProcessed.regReplace(pattern: "遐邇着聞", replaceWith: "遐邇著聞")
        strProcessed.regReplace(pattern: "積微成着", replaceWith: "積微成著")
        strProcessed.regReplace(pattern: "地下覈試", replaceWith: "地下核試")
        strProcessed.regReplace(pattern: "地下覈爆", replaceWith: "地下核爆")
        strProcessed.regReplace(pattern: "非覈武區", replaceWith: "非核武區")
        strProcessed.regReplace(pattern: "覈反應器", replaceWith: "核反應器")
        strProcessed.regReplace(pattern: "覈物理學", replaceWith: "核物理學")
        strProcessed.regReplace(pattern: "覈能發電", replaceWith: "核能發電")
        strProcessed.regReplace(pattern: "覈能電廠", replaceWith: "核能電廠")
        strProcessed.regReplace(pattern: "覈能廢料", replaceWith: "核能廢料")
        strProcessed.regReplace(pattern: "覈能潛艇", replaceWith: "核能潛艇")
        strProcessed.regReplace(pattern: "覈磁共振", replaceWith: "核磁共振")
        strProcessed.regReplace(pattern: "熱覈反應", replaceWith: "熱核反應")
        strProcessed.regReplace(pattern: "賣李鑽覈", replaceWith: "賣李鑽核")
        strProcessed.regReplace(pattern: "雙覈都市", replaceWith: "雙核都市")
        strProcessed.regReplace(pattern: "罵人不吐覈", replaceWith: "罵人不吐核")
        return strProcessed
    }

    @objc class func cnvTradToJIS(_ strProcessed: String) -> String {
        let strProcessed = strProcessed
        return strProcessed
    }
}
