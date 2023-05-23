// (c) 2022 and onwards The vChewing Project (MIT-NTL License).
// ====================
// This code is released under the MIT license (SPDX-License-Identifier: MIT)
// ... with NTL restriction stating that:
// No trademark license is granted to use the trade names, trademarks, service
// marks, or product names of Contributor, except as required to fulfill notice
// requirements defined in MIT License.

import XCTest

@testable import Tekkon

extension TekkonTestsKeyboardArrangments {
  func testHsuKeysTaigi() throws {
    var c = Tekkon.Composer(arrange: .ofHsu)
    XCTAssertEqual(c.cS2RC("kek"), "ㄎㄧㄤ")
    XCTAssertEqual(c.cS2RC("gewd"), "ㄍㄧㄠˊ")
    XCTAssertEqual(c.cS2RC("gen"), "ㄍㄧㄣ")
  }

  func testHsuKeysA() throws {
    var c = Tekkon.Composer(arrange: .ofHsu)
    XCTAssertEqual(c.cS2RC("bekd"), "ㄅㄧㄤˊ")
    XCTAssertEqual(c.cS2RC("bekj"), "ㄅㄧㄤˋ")
    XCTAssertEqual(c.cS2RC("dxk"), "ㄉㄨㄤ")
    XCTAssertEqual(c.cS2RC("by"), "ㄅㄚ")
    XCTAssertEqual(c.cS2RC("byd"), "ㄅㄚˊ")
    XCTAssertEqual(c.cS2RC("byf"), "ㄅㄚˇ")
    XCTAssertEqual(c.cS2RC("byj"), "ㄅㄚˋ")
    XCTAssertEqual(c.cS2RC("bys"), "ㄅㄚ˙")
    XCTAssertEqual(c.cS2RC("bh"), "ㄅㄛ")
    XCTAssertEqual(c.cS2RC("bhd"), "ㄅㄛˊ")
    XCTAssertEqual(c.cS2RC("bhf"), "ㄅㄛˇ")
    XCTAssertEqual(c.cS2RC("bhj"), "ㄅㄛˋ")
    XCTAssertEqual(c.cS2RC("bhs"), "ㄅㄛ˙")
    XCTAssertEqual(c.cS2RC("bi"), "ㄅㄞ")
    XCTAssertEqual(c.cS2RC("bid"), "ㄅㄞˊ")
    XCTAssertEqual(c.cS2RC("bif"), "ㄅㄞˇ")
    XCTAssertEqual(c.cS2RC("bij"), "ㄅㄞˋ")
    XCTAssertEqual(c.cS2RC("bis"), "ㄅㄞ˙")
    XCTAssertEqual(c.cS2RC("ba"), "ㄅㄟ")
    XCTAssertEqual(c.cS2RC("baf"), "ㄅㄟˇ")
    XCTAssertEqual(c.cS2RC("baj"), "ㄅㄟˋ")
    XCTAssertEqual(c.cS2RC("bas"), "ㄅㄟ˙")
    XCTAssertEqual(c.cS2RC("bw"), "ㄅㄠ")
    XCTAssertEqual(c.cS2RC("bwd"), "ㄅㄠˊ")
    XCTAssertEqual(c.cS2RC("bwf"), "ㄅㄠˇ")
    XCTAssertEqual(c.cS2RC("bwj"), "ㄅㄠˋ")
    XCTAssertEqual(c.cS2RC("bm"), "ㄅㄢ")
    XCTAssertEqual(c.cS2RC("bmf"), "ㄅㄢˇ")
    XCTAssertEqual(c.cS2RC("bmj"), "ㄅㄢˋ")
    XCTAssertEqual(c.cS2RC("bn"), "ㄅㄣ")
    XCTAssertEqual(c.cS2RC("bnf"), "ㄅㄣˇ")
    XCTAssertEqual(c.cS2RC("bnj"), "ㄅㄣˋ")
    XCTAssertEqual(c.cS2RC("bk"), "ㄅㄤ")
    XCTAssertEqual(c.cS2RC("bkf"), "ㄅㄤˇ")
    XCTAssertEqual(c.cS2RC("bkj"), "ㄅㄤˋ")
    XCTAssertEqual(c.cS2RC("bl"), "ㄅㄥ")
    XCTAssertEqual(c.cS2RC("bld"), "ㄅㄥˊ")
    XCTAssertEqual(c.cS2RC("blf"), "ㄅㄥˇ")
    XCTAssertEqual(c.cS2RC("blj"), "ㄅㄥˋ")
    XCTAssertEqual(c.cS2RC("be"), "ㄅㄧ")
    XCTAssertEqual(c.cS2RC("bed"), "ㄅㄧˊ")
    XCTAssertEqual(c.cS2RC("bef"), "ㄅㄧˇ")
    XCTAssertEqual(c.cS2RC("bej"), "ㄅㄧˋ")
    XCTAssertEqual(c.cS2RC("bee"), "ㄅㄧㄝ")
    XCTAssertEqual(c.cS2RC("beed"), "ㄅㄧㄝˊ")
    XCTAssertEqual(c.cS2RC("beef"), "ㄅㄧㄝˇ")
    XCTAssertEqual(c.cS2RC("beej"), "ㄅㄧㄝˋ")
    XCTAssertEqual(c.cS2RC("bew"), "ㄅㄧㄠ")
    XCTAssertEqual(c.cS2RC("bewf"), "ㄅㄧㄠˇ")
    XCTAssertEqual(c.cS2RC("bewj"), "ㄅㄧㄠˋ")
    XCTAssertEqual(c.cS2RC("bem"), "ㄅㄧㄢ")
    XCTAssertEqual(c.cS2RC("bemd"), "ㄅㄧㄢˊ")
    XCTAssertEqual(c.cS2RC("bemf"), "ㄅㄧㄢˇ")
    XCTAssertEqual(c.cS2RC("bemj"), "ㄅㄧㄢˋ")
    XCTAssertEqual(c.cS2RC("ben"), "ㄅㄧㄣ")
    XCTAssertEqual(c.cS2RC("benf"), "ㄅㄧㄣˇ")
    XCTAssertEqual(c.cS2RC("benj"), "ㄅㄧㄣˋ")
    XCTAssertEqual(c.cS2RC("bel"), "ㄅㄧㄥ")
    XCTAssertEqual(c.cS2RC("belf"), "ㄅㄧㄥˇ")
    XCTAssertEqual(c.cS2RC("belj"), "ㄅㄧㄥˋ")
    XCTAssertEqual(c.cS2RC("bx"), "ㄅㄨ")
    XCTAssertEqual(c.cS2RC("bxd"), "ㄅㄨˊ")
    XCTAssertEqual(c.cS2RC("bxf"), "ㄅㄨˇ")
    XCTAssertEqual(c.cS2RC("bxj"), "ㄅㄨˋ")
    XCTAssertEqual(c.cS2RC("py"), "ㄆㄚ")
    XCTAssertEqual(c.cS2RC("pyd"), "ㄆㄚˊ")
    XCTAssertEqual(c.cS2RC("pyf"), "ㄆㄚˇ")
    XCTAssertEqual(c.cS2RC("pyj"), "ㄆㄚˋ")
    XCTAssertEqual(c.cS2RC("pys"), "ㄆㄚ˙")
    XCTAssertEqual(c.cS2RC("ph"), "ㄆㄛ")
    XCTAssertEqual(c.cS2RC("phd"), "ㄆㄛˊ")
    XCTAssertEqual(c.cS2RC("phf"), "ㄆㄛˇ")
    XCTAssertEqual(c.cS2RC("phj"), "ㄆㄛˋ")
    XCTAssertEqual(c.cS2RC("pi"), "ㄆㄞ")
    XCTAssertEqual(c.cS2RC("pid"), "ㄆㄞˊ")
    XCTAssertEqual(c.cS2RC("pif"), "ㄆㄞˇ")
    XCTAssertEqual(c.cS2RC("pij"), "ㄆㄞˋ")
    XCTAssertEqual(c.cS2RC("pa"), "ㄆㄟ")
    XCTAssertEqual(c.cS2RC("pad"), "ㄆㄟˊ")
    XCTAssertEqual(c.cS2RC("paf"), "ㄆㄟˇ")
    XCTAssertEqual(c.cS2RC("paj"), "ㄆㄟˋ")
    XCTAssertEqual(c.cS2RC("pw"), "ㄆㄠ")
    XCTAssertEqual(c.cS2RC("pwd"), "ㄆㄠˊ")
    XCTAssertEqual(c.cS2RC("pwf"), "ㄆㄠˇ")
    XCTAssertEqual(c.cS2RC("pwj"), "ㄆㄠˋ")
    XCTAssertEqual(c.cS2RC("po"), "ㄆㄡ")
    XCTAssertEqual(c.cS2RC("pod"), "ㄆㄡˊ")
    XCTAssertEqual(c.cS2RC("pof"), "ㄆㄡˇ")
    XCTAssertEqual(c.cS2RC("poj"), "ㄆㄡˋ")
    XCTAssertEqual(c.cS2RC("pm"), "ㄆㄢ")
    XCTAssertEqual(c.cS2RC("pmd"), "ㄆㄢˊ")
    XCTAssertEqual(c.cS2RC("pmf"), "ㄆㄢˇ")
    XCTAssertEqual(c.cS2RC("pmj"), "ㄆㄢˋ")
    XCTAssertEqual(c.cS2RC("pn"), "ㄆㄣ")
    XCTAssertEqual(c.cS2RC("pnd"), "ㄆㄣˊ")
    XCTAssertEqual(c.cS2RC("pnf"), "ㄆㄣˇ")
    XCTAssertEqual(c.cS2RC("pnj"), "ㄆㄣˋ")
    XCTAssertEqual(c.cS2RC("pk"), "ㄆㄤ")
    XCTAssertEqual(c.cS2RC("pkd"), "ㄆㄤˊ")
    XCTAssertEqual(c.cS2RC("pkf"), "ㄆㄤˇ")
    XCTAssertEqual(c.cS2RC("pkj"), "ㄆㄤˋ")
    XCTAssertEqual(c.cS2RC("pl"), "ㄆㄥ")
    XCTAssertEqual(c.cS2RC("pld"), "ㄆㄥˊ")
    XCTAssertEqual(c.cS2RC("plf"), "ㄆㄥˇ")
    XCTAssertEqual(c.cS2RC("plj"), "ㄆㄥˋ")
    XCTAssertEqual(c.cS2RC("pe"), "ㄆㄧ")
    XCTAssertEqual(c.cS2RC("ped"), "ㄆㄧˊ")
    XCTAssertEqual(c.cS2RC("pef"), "ㄆㄧˇ")
    XCTAssertEqual(c.cS2RC("pej"), "ㄆㄧˋ")
    XCTAssertEqual(c.cS2RC("pey"), "ㄆㄧㄚ")
    XCTAssertEqual(c.cS2RC("pee"), "ㄆㄧㄝ")
    XCTAssertEqual(c.cS2RC("peef"), "ㄆㄧㄝˇ")
    XCTAssertEqual(c.cS2RC("peej"), "ㄆㄧㄝˋ")
    XCTAssertEqual(c.cS2RC("pew"), "ㄆㄧㄠ")
    XCTAssertEqual(c.cS2RC("pewd"), "ㄆㄧㄠˊ")
    XCTAssertEqual(c.cS2RC("pewf"), "ㄆㄧㄠˇ")
    XCTAssertEqual(c.cS2RC("pewj"), "ㄆㄧㄠˋ")
    XCTAssertEqual(c.cS2RC("pem"), "ㄆㄧㄢ")
    XCTAssertEqual(c.cS2RC("pemd"), "ㄆㄧㄢˊ")
    XCTAssertEqual(c.cS2RC("pemf"), "ㄆㄧㄢˇ")
    XCTAssertEqual(c.cS2RC("pemj"), "ㄆㄧㄢˋ")
    XCTAssertEqual(c.cS2RC("pen"), "ㄆㄧㄣ")
    XCTAssertEqual(c.cS2RC("pend"), "ㄆㄧㄣˊ")
    XCTAssertEqual(c.cS2RC("penf"), "ㄆㄧㄣˇ")
    XCTAssertEqual(c.cS2RC("penj"), "ㄆㄧㄣˋ")
    XCTAssertEqual(c.cS2RC("pel"), "ㄆㄧㄥ")
    XCTAssertEqual(c.cS2RC("peld"), "ㄆㄧㄥˊ")
    XCTAssertEqual(c.cS2RC("pelf"), "ㄆㄧㄥˇ")
    XCTAssertEqual(c.cS2RC("pelj"), "ㄆㄧㄥˋ")
    XCTAssertEqual(c.cS2RC("px"), "ㄆㄨ")
    XCTAssertEqual(c.cS2RC("pxd"), "ㄆㄨˊ")
    XCTAssertEqual(c.cS2RC("pxf"), "ㄆㄨˇ")
    XCTAssertEqual(c.cS2RC("pxj"), "ㄆㄨˋ")
    XCTAssertEqual(c.cS2RC("my"), "ㄇㄚ")
    XCTAssertEqual(c.cS2RC("myd"), "ㄇㄚˊ")
    XCTAssertEqual(c.cS2RC("myf"), "ㄇㄚˇ")
    XCTAssertEqual(c.cS2RC("myj"), "ㄇㄚˋ")
    XCTAssertEqual(c.cS2RC("mys"), "ㄇㄚ˙")
    XCTAssertEqual(c.cS2RC("mh"), "ㄇㄛ")
    XCTAssertEqual(c.cS2RC("mhd"), "ㄇㄛˊ")
    XCTAssertEqual(c.cS2RC("mhf"), "ㄇㄛˇ")
    XCTAssertEqual(c.cS2RC("mhj"), "ㄇㄛˋ")
    XCTAssertEqual(c.cS2RC("mhs"), "ㄇㄛ˙")
    XCTAssertEqual(c.cS2RC("mg"), "ㄇㄜ")
    XCTAssertEqual(c.cS2RC("mgj"), "ㄇㄜˋ")
    XCTAssertEqual(c.cS2RC("mgs"), "ㄇㄜ˙")
    XCTAssertEqual(c.cS2RC("mi"), "ㄇㄞ")
    XCTAssertEqual(c.cS2RC("mid"), "ㄇㄞˊ")
    XCTAssertEqual(c.cS2RC("mif"), "ㄇㄞˇ")
    XCTAssertEqual(c.cS2RC("mij"), "ㄇㄞˋ")
    XCTAssertEqual(c.cS2RC("mad"), "ㄇㄟˊ")
    XCTAssertEqual(c.cS2RC("maf"), "ㄇㄟˇ")
    XCTAssertEqual(c.cS2RC("maj"), "ㄇㄟˋ")
    XCTAssertEqual(c.cS2RC("mw"), "ㄇㄠ")
    XCTAssertEqual(c.cS2RC("mwd"), "ㄇㄠˊ")
    XCTAssertEqual(c.cS2RC("mwf"), "ㄇㄠˇ")
    XCTAssertEqual(c.cS2RC("mwj"), "ㄇㄠˋ")
    XCTAssertEqual(c.cS2RC("mod"), "ㄇㄡˊ")
    XCTAssertEqual(c.cS2RC("mof"), "ㄇㄡˇ")
    XCTAssertEqual(c.cS2RC("moj"), "ㄇㄡˋ")
    XCTAssertEqual(c.cS2RC("mm"), "ㄇㄢ")
    XCTAssertEqual(c.cS2RC("mmd"), "ㄇㄢˊ")
    XCTAssertEqual(c.cS2RC("mmf"), "ㄇㄢˇ")
    XCTAssertEqual(c.cS2RC("mmj"), "ㄇㄢˋ")
    XCTAssertEqual(c.cS2RC("mn"), "ㄇㄣ")
    XCTAssertEqual(c.cS2RC("mnd"), "ㄇㄣˊ")
    XCTAssertEqual(c.cS2RC("mnf"), "ㄇㄣˇ")
    XCTAssertEqual(c.cS2RC("mnj"), "ㄇㄣˋ")
    XCTAssertEqual(c.cS2RC("mns"), "ㄇㄣ˙")
    XCTAssertEqual(c.cS2RC("mk"), "ㄇㄤ")
    XCTAssertEqual(c.cS2RC("mkd"), "ㄇㄤˊ")
    XCTAssertEqual(c.cS2RC("mkf"), "ㄇㄤˇ")
    XCTAssertEqual(c.cS2RC("mkj"), "ㄇㄤˋ")
    XCTAssertEqual(c.cS2RC("ml"), "ㄇㄥ")
    XCTAssertEqual(c.cS2RC("mld"), "ㄇㄥˊ")
    XCTAssertEqual(c.cS2RC("mlf"), "ㄇㄥˇ")
    XCTAssertEqual(c.cS2RC("mlj"), "ㄇㄥˋ")
    XCTAssertEqual(c.cS2RC("me"), "ㄇㄧ")
    XCTAssertEqual(c.cS2RC("med"), "ㄇㄧˊ")
    XCTAssertEqual(c.cS2RC("mef"), "ㄇㄧˇ")
    XCTAssertEqual(c.cS2RC("mej"), "ㄇㄧˋ")
    XCTAssertEqual(c.cS2RC("mee"), "ㄇㄧㄝ")
    XCTAssertEqual(c.cS2RC("meed"), "ㄇㄧㄝˊ")
    XCTAssertEqual(c.cS2RC("meej"), "ㄇㄧㄝˋ")
    XCTAssertEqual(c.cS2RC("mew"), "ㄇㄧㄠ")
    XCTAssertEqual(c.cS2RC("mewd"), "ㄇㄧㄠˊ")
    XCTAssertEqual(c.cS2RC("mewf"), "ㄇㄧㄠˇ")
    XCTAssertEqual(c.cS2RC("mewj"), "ㄇㄧㄠˋ")
    XCTAssertEqual(c.cS2RC("meod"), "ㄇㄧㄡˊ")
    XCTAssertEqual(c.cS2RC("meof"), "ㄇㄧㄡˇ")
    XCTAssertEqual(c.cS2RC("meoj"), "ㄇㄧㄡˋ")
    XCTAssertEqual(c.cS2RC("mem"), "ㄇㄧㄢ")
    XCTAssertEqual(c.cS2RC("memd"), "ㄇㄧㄢˊ")
    XCTAssertEqual(c.cS2RC("memf"), "ㄇㄧㄢˇ")
    XCTAssertEqual(c.cS2RC("memj"), "ㄇㄧㄢˋ")
    XCTAssertEqual(c.cS2RC("men"), "ㄇㄧㄣ")
    XCTAssertEqual(c.cS2RC("mend"), "ㄇㄧㄣˊ")
    XCTAssertEqual(c.cS2RC("menf"), "ㄇㄧㄣˇ")
    XCTAssertEqual(c.cS2RC("meld"), "ㄇㄧㄥˊ")
    XCTAssertEqual(c.cS2RC("melf"), "ㄇㄧㄥˇ")
    XCTAssertEqual(c.cS2RC("melj"), "ㄇㄧㄥˋ")
    XCTAssertEqual(c.cS2RC("mxd"), "ㄇㄨˊ")
    XCTAssertEqual(c.cS2RC("mxf"), "ㄇㄨˇ")
    XCTAssertEqual(c.cS2RC("mxj"), "ㄇㄨˋ")
    XCTAssertEqual(c.cS2RC("fy"), "ㄈㄚ")
    XCTAssertEqual(c.cS2RC("fyd"), "ㄈㄚˊ")
    XCTAssertEqual(c.cS2RC("fyf"), "ㄈㄚˇ")
    XCTAssertEqual(c.cS2RC("fyj"), "ㄈㄚˋ")
    XCTAssertEqual(c.cS2RC("fhd"), "ㄈㄛˊ")
    XCTAssertEqual(c.cS2RC("fa"), "ㄈㄟ")
    XCTAssertEqual(c.cS2RC("fad"), "ㄈㄟˊ")
    XCTAssertEqual(c.cS2RC("faf"), "ㄈㄟˇ")
    XCTAssertEqual(c.cS2RC("faj"), "ㄈㄟˋ")
    XCTAssertEqual(c.cS2RC("fo"), "ㄈㄡ")
    XCTAssertEqual(c.cS2RC("fod"), "ㄈㄡˊ")
    XCTAssertEqual(c.cS2RC("fof"), "ㄈㄡˇ")
    XCTAssertEqual(c.cS2RC("foj"), "ㄈㄡˋ")
    XCTAssertEqual(c.cS2RC("fm"), "ㄈㄢ")
    XCTAssertEqual(c.cS2RC("fmd"), "ㄈㄢˊ")
    XCTAssertEqual(c.cS2RC("fmf"), "ㄈㄢˇ")
    XCTAssertEqual(c.cS2RC("fmj"), "ㄈㄢˋ")
    XCTAssertEqual(c.cS2RC("fn"), "ㄈㄣ")
    XCTAssertEqual(c.cS2RC("fnd"), "ㄈㄣˊ")
    XCTAssertEqual(c.cS2RC("fnf"), "ㄈㄣˇ")
    XCTAssertEqual(c.cS2RC("fnj"), "ㄈㄣˋ")
    XCTAssertEqual(c.cS2RC("fns"), "ㄈㄣ˙")
    XCTAssertEqual(c.cS2RC("fk"), "ㄈㄤ")
    XCTAssertEqual(c.cS2RC("fkd"), "ㄈㄤˊ")
    XCTAssertEqual(c.cS2RC("fkf"), "ㄈㄤˇ")
    XCTAssertEqual(c.cS2RC("fkj"), "ㄈㄤˋ")
    XCTAssertEqual(c.cS2RC("fl"), "ㄈㄥ")
    XCTAssertEqual(c.cS2RC("fld"), "ㄈㄥˊ")
    XCTAssertEqual(c.cS2RC("flf"), "ㄈㄥˇ")
    XCTAssertEqual(c.cS2RC("flj"), "ㄈㄥˋ")
    XCTAssertEqual(c.cS2RC("fewj"), "ㄈㄧㄠˋ")
    XCTAssertEqual(c.cS2RC("fx"), "ㄈㄨ")
    XCTAssertEqual(c.cS2RC("fxd"), "ㄈㄨˊ")
    XCTAssertEqual(c.cS2RC("fxf"), "ㄈㄨˇ")
    XCTAssertEqual(c.cS2RC("fxj"), "ㄈㄨˋ")
    XCTAssertEqual(c.cS2RC("dy"), "ㄉㄚ")
    XCTAssertEqual(c.cS2RC("dyd"), "ㄉㄚˊ")
    XCTAssertEqual(c.cS2RC("dyf"), "ㄉㄚˇ")
    XCTAssertEqual(c.cS2RC("dyj"), "ㄉㄚˋ")
    XCTAssertEqual(c.cS2RC("dys"), "ㄉㄚ˙")
    XCTAssertEqual(c.cS2RC("dg"), "ㄉㄜ")
    XCTAssertEqual(c.cS2RC("dgd"), "ㄉㄜˊ")
    XCTAssertEqual(c.cS2RC("dgs"), "ㄉㄜ˙")
    XCTAssertEqual(c.cS2RC("di"), "ㄉㄞ")
    XCTAssertEqual(c.cS2RC("dif"), "ㄉㄞˇ")
    XCTAssertEqual(c.cS2RC("dij"), "ㄉㄞˋ")
    XCTAssertEqual(c.cS2RC("daf"), "ㄉㄟˇ")
    XCTAssertEqual(c.cS2RC("dw"), "ㄉㄠ")
    XCTAssertEqual(c.cS2RC("dwd"), "ㄉㄠˊ")
    XCTAssertEqual(c.cS2RC("dwf"), "ㄉㄠˇ")
    XCTAssertEqual(c.cS2RC("dwj"), "ㄉㄠˋ")
    XCTAssertEqual(c.cS2RC("do"), "ㄉㄡ")
    XCTAssertEqual(c.cS2RC("dod"), "ㄉㄡˊ")
    XCTAssertEqual(c.cS2RC("dof"), "ㄉㄡˇ")
    XCTAssertEqual(c.cS2RC("doj"), "ㄉㄡˋ")
    XCTAssertEqual(c.cS2RC("dm"), "ㄉㄢ")
    XCTAssertEqual(c.cS2RC("dmf"), "ㄉㄢˇ")
    XCTAssertEqual(c.cS2RC("dmj"), "ㄉㄢˋ")
    XCTAssertEqual(c.cS2RC("dnj"), "ㄉㄣˋ")
    XCTAssertEqual(c.cS2RC("dk"), "ㄉㄤ")
    XCTAssertEqual(c.cS2RC("dkf"), "ㄉㄤˇ")
    XCTAssertEqual(c.cS2RC("dkj"), "ㄉㄤˋ")
    XCTAssertEqual(c.cS2RC("dl"), "ㄉㄥ")
    XCTAssertEqual(c.cS2RC("dlf"), "ㄉㄥˇ")
    XCTAssertEqual(c.cS2RC("dlj"), "ㄉㄥˋ")
    XCTAssertEqual(c.cS2RC("de"), "ㄉㄧ")
    XCTAssertEqual(c.cS2RC("ded"), "ㄉㄧˊ")
    XCTAssertEqual(c.cS2RC("def"), "ㄉㄧˇ")
    XCTAssertEqual(c.cS2RC("dej"), "ㄉㄧˋ")
    XCTAssertEqual(c.cS2RC("deyf"), "ㄉㄧㄚˇ")
    XCTAssertEqual(c.cS2RC("dee"), "ㄉㄧㄝ")
    XCTAssertEqual(c.cS2RC("deed"), "ㄉㄧㄝˊ")
    XCTAssertEqual(c.cS2RC("deef"), "ㄉㄧㄝˇ")
    XCTAssertEqual(c.cS2RC("deej"), "ㄉㄧㄝˋ")
    XCTAssertEqual(c.cS2RC("dew"), "ㄉㄧㄠ")
    XCTAssertEqual(c.cS2RC("dewf"), "ㄉㄧㄠˇ")
    XCTAssertEqual(c.cS2RC("dewj"), "ㄉㄧㄠˋ")
    XCTAssertEqual(c.cS2RC("deo"), "ㄉㄧㄡ")
    XCTAssertEqual(c.cS2RC("dem"), "ㄉㄧㄢ")
    XCTAssertEqual(c.cS2RC("demd"), "ㄉㄧㄢˊ")
    XCTAssertEqual(c.cS2RC("demf"), "ㄉㄧㄢˇ")
    XCTAssertEqual(c.cS2RC("demj"), "ㄉㄧㄢˋ")
    XCTAssertEqual(c.cS2RC("del"), "ㄉㄧㄥ")
    XCTAssertEqual(c.cS2RC("deld"), "ㄉㄧㄥˊ")
    XCTAssertEqual(c.cS2RC("delf"), "ㄉㄧㄥˇ")
    XCTAssertEqual(c.cS2RC("delj"), "ㄉㄧㄥˋ")
    XCTAssertEqual(c.cS2RC("dx"), "ㄉㄨ")
    XCTAssertEqual(c.cS2RC("dxd"), "ㄉㄨˊ")
    XCTAssertEqual(c.cS2RC("dxf"), "ㄉㄨˇ")
    XCTAssertEqual(c.cS2RC("dxj"), "ㄉㄨˋ")
    XCTAssertEqual(c.cS2RC("dxh"), "ㄉㄨㄛ")
    XCTAssertEqual(c.cS2RC("dxhd"), "ㄉㄨㄛˊ")
    XCTAssertEqual(c.cS2RC("dxhf"), "ㄉㄨㄛˇ")
    XCTAssertEqual(c.cS2RC("dxhj"), "ㄉㄨㄛˋ")
    XCTAssertEqual(c.cS2RC("dxhs"), "ㄉㄨㄛ˙")
    XCTAssertEqual(c.cS2RC("dxa"), "ㄉㄨㄟ")
    XCTAssertEqual(c.cS2RC("dxaf"), "ㄉㄨㄟˇ")
    XCTAssertEqual(c.cS2RC("dxaj"), "ㄉㄨㄟˋ")
    XCTAssertEqual(c.cS2RC("dxm"), "ㄉㄨㄢ")
    XCTAssertEqual(c.cS2RC("dxmf"), "ㄉㄨㄢˇ")
    XCTAssertEqual(c.cS2RC("dxmj"), "ㄉㄨㄢˋ")
    XCTAssertEqual(c.cS2RC("dxn"), "ㄉㄨㄣ")
    XCTAssertEqual(c.cS2RC("dxnf"), "ㄉㄨㄣˇ")
    XCTAssertEqual(c.cS2RC("dxnj"), "ㄉㄨㄣˋ")
    XCTAssertEqual(c.cS2RC("dxl"), "ㄉㄨㄥ")
    XCTAssertEqual(c.cS2RC("dxlf"), "ㄉㄨㄥˇ")
    XCTAssertEqual(c.cS2RC("dxlj"), "ㄉㄨㄥˋ")
    XCTAssertEqual(c.cS2RC("ty"), "ㄊㄚ")
    XCTAssertEqual(c.cS2RC("tyf"), "ㄊㄚˇ")
    XCTAssertEqual(c.cS2RC("tyj"), "ㄊㄚˋ")
    XCTAssertEqual(c.cS2RC("tgj"), "ㄊㄜˋ")
    XCTAssertEqual(c.cS2RC("ti"), "ㄊㄞ")
    XCTAssertEqual(c.cS2RC("tid"), "ㄊㄞˊ")
    XCTAssertEqual(c.cS2RC("tif"), "ㄊㄞˇ")
    XCTAssertEqual(c.cS2RC("tij"), "ㄊㄞˋ")
    XCTAssertEqual(c.cS2RC("tis"), "ㄊㄞ˙")
    XCTAssertEqual(c.cS2RC("tw"), "ㄊㄠ")
    XCTAssertEqual(c.cS2RC("twd"), "ㄊㄠˊ")
    XCTAssertEqual(c.cS2RC("twf"), "ㄊㄠˇ")
    XCTAssertEqual(c.cS2RC("twj"), "ㄊㄠˋ")
    XCTAssertEqual(c.cS2RC("tws"), "ㄊㄠ˙")
    XCTAssertEqual(c.cS2RC("to"), "ㄊㄡ")
    XCTAssertEqual(c.cS2RC("tod"), "ㄊㄡˊ")
    XCTAssertEqual(c.cS2RC("tof"), "ㄊㄡˇ")
    XCTAssertEqual(c.cS2RC("toj"), "ㄊㄡˋ")
    XCTAssertEqual(c.cS2RC("tos"), "ㄊㄡ˙")
    XCTAssertEqual(c.cS2RC("tm"), "ㄊㄢ")
    XCTAssertEqual(c.cS2RC("tmd"), "ㄊㄢˊ")
    XCTAssertEqual(c.cS2RC("tmf"), "ㄊㄢˇ")
    XCTAssertEqual(c.cS2RC("tmj"), "ㄊㄢˋ")
    XCTAssertEqual(c.cS2RC("tk"), "ㄊㄤ")
    XCTAssertEqual(c.cS2RC("tkd"), "ㄊㄤˊ")
    XCTAssertEqual(c.cS2RC("tkf"), "ㄊㄤˇ")
    XCTAssertEqual(c.cS2RC("tkj"), "ㄊㄤˋ")
    XCTAssertEqual(c.cS2RC("tl"), "ㄊㄥ")
    XCTAssertEqual(c.cS2RC("tld"), "ㄊㄥˊ")
    XCTAssertEqual(c.cS2RC("tlj"), "ㄊㄥˋ")
    XCTAssertEqual(c.cS2RC("te"), "ㄊㄧ")
    XCTAssertEqual(c.cS2RC("ted"), "ㄊㄧˊ")
    XCTAssertEqual(c.cS2RC("tef"), "ㄊㄧˇ")
    XCTAssertEqual(c.cS2RC("tej"), "ㄊㄧˋ")
    XCTAssertEqual(c.cS2RC("tee"), "ㄊㄧㄝ")
    XCTAssertEqual(c.cS2RC("teed"), "ㄊㄧㄝˊ")
    XCTAssertEqual(c.cS2RC("teef"), "ㄊㄧㄝˇ")
    XCTAssertEqual(c.cS2RC("teej"), "ㄊㄧㄝˋ")
    XCTAssertEqual(c.cS2RC("tew"), "ㄊㄧㄠ")
    XCTAssertEqual(c.cS2RC("tewd"), "ㄊㄧㄠˊ")
    XCTAssertEqual(c.cS2RC("tewf"), "ㄊㄧㄠˇ")
    XCTAssertEqual(c.cS2RC("tewj"), "ㄊㄧㄠˋ")
    XCTAssertEqual(c.cS2RC("tem"), "ㄊㄧㄢ")
    XCTAssertEqual(c.cS2RC("temd"), "ㄊㄧㄢˊ")
    XCTAssertEqual(c.cS2RC("temf"), "ㄊㄧㄢˇ")
    XCTAssertEqual(c.cS2RC("temj"), "ㄊㄧㄢˋ")
    XCTAssertEqual(c.cS2RC("tel"), "ㄊㄧㄥ")
    XCTAssertEqual(c.cS2RC("teld"), "ㄊㄧㄥˊ")
    XCTAssertEqual(c.cS2RC("telf"), "ㄊㄧㄥˇ")
    XCTAssertEqual(c.cS2RC("telj"), "ㄊㄧㄥˋ")
    XCTAssertEqual(c.cS2RC("tx"), "ㄊㄨ")
    XCTAssertEqual(c.cS2RC("txd"), "ㄊㄨˊ")
    XCTAssertEqual(c.cS2RC("txf"), "ㄊㄨˇ")
    XCTAssertEqual(c.cS2RC("txj"), "ㄊㄨˋ")
    XCTAssertEqual(c.cS2RC("txh"), "ㄊㄨㄛ")
    XCTAssertEqual(c.cS2RC("txhd"), "ㄊㄨㄛˊ")
    XCTAssertEqual(c.cS2RC("txhf"), "ㄊㄨㄛˇ")
    XCTAssertEqual(c.cS2RC("txhj"), "ㄊㄨㄛˋ")
    XCTAssertEqual(c.cS2RC("txa"), "ㄊㄨㄟ")
    XCTAssertEqual(c.cS2RC("txad"), "ㄊㄨㄟˊ")
    XCTAssertEqual(c.cS2RC("txaf"), "ㄊㄨㄟˇ")
    XCTAssertEqual(c.cS2RC("txaj"), "ㄊㄨㄟˋ")
    XCTAssertEqual(c.cS2RC("txm"), "ㄊㄨㄢ")
    XCTAssertEqual(c.cS2RC("txmd"), "ㄊㄨㄢˊ")
    XCTAssertEqual(c.cS2RC("txmf"), "ㄊㄨㄢˇ")
    XCTAssertEqual(c.cS2RC("txmj"), "ㄊㄨㄢˋ")
    XCTAssertEqual(c.cS2RC("txn"), "ㄊㄨㄣ")
    XCTAssertEqual(c.cS2RC("txnd"), "ㄊㄨㄣˊ")
    XCTAssertEqual(c.cS2RC("txnf"), "ㄊㄨㄣˇ")
    XCTAssertEqual(c.cS2RC("txnj"), "ㄊㄨㄣˋ")
    XCTAssertEqual(c.cS2RC("txl"), "ㄊㄨㄥ")
    XCTAssertEqual(c.cS2RC("txld"), "ㄊㄨㄥˊ")
    XCTAssertEqual(c.cS2RC("txlf"), "ㄊㄨㄥˇ")
    XCTAssertEqual(c.cS2RC("txlj"), "ㄊㄨㄥˋ")
    XCTAssertEqual(c.cS2RC("ny"), "ㄋㄚ")
    XCTAssertEqual(c.cS2RC("nyd"), "ㄋㄚˊ")
    XCTAssertEqual(c.cS2RC("nyf"), "ㄋㄚˇ")
    XCTAssertEqual(c.cS2RC("nyj"), "ㄋㄚˋ")
    XCTAssertEqual(c.cS2RC("nys"), "ㄋㄚ˙")
    XCTAssertEqual(c.cS2RC("ngj"), "ㄋㄜˋ")
    XCTAssertEqual(c.cS2RC("ngs"), "ㄋㄜ˙")
    XCTAssertEqual(c.cS2RC("nid"), "ㄋㄞˊ")
    XCTAssertEqual(c.cS2RC("nif"), "ㄋㄞˇ")
    XCTAssertEqual(c.cS2RC("nij"), "ㄋㄞˋ")
    XCTAssertEqual(c.cS2RC("nad"), "ㄋㄟˊ")
    XCTAssertEqual(c.cS2RC("naf"), "ㄋㄟˇ")
    XCTAssertEqual(c.cS2RC("naj"), "ㄋㄟˋ")
    XCTAssertEqual(c.cS2RC("nw"), "ㄋㄠ")
    XCTAssertEqual(c.cS2RC("nwd"), "ㄋㄠˊ")
    XCTAssertEqual(c.cS2RC("nwf"), "ㄋㄠˇ")
    XCTAssertEqual(c.cS2RC("nwj"), "ㄋㄠˋ")
    XCTAssertEqual(c.cS2RC("nod"), "ㄋㄡˊ")
    XCTAssertEqual(c.cS2RC("nof"), "ㄋㄡˇ")
    XCTAssertEqual(c.cS2RC("noj"), "ㄋㄡˋ")
    XCTAssertEqual(c.cS2RC("nm"), "ㄋㄢ")
    XCTAssertEqual(c.cS2RC("nmd"), "ㄋㄢˊ")
    XCTAssertEqual(c.cS2RC("nmf"), "ㄋㄢˇ")
    XCTAssertEqual(c.cS2RC("nmj"), "ㄋㄢˋ")
    XCTAssertEqual(c.cS2RC("nnf"), "ㄋㄣˇ")
    XCTAssertEqual(c.cS2RC("nnj"), "ㄋㄣˋ")
    XCTAssertEqual(c.cS2RC("nk"), "ㄋㄤ")
    XCTAssertEqual(c.cS2RC("nkd"), "ㄋㄤˊ")
    XCTAssertEqual(c.cS2RC("nkf"), "ㄋㄤˇ")
    XCTAssertEqual(c.cS2RC("nkj"), "ㄋㄤˋ")
    XCTAssertEqual(c.cS2RC("nks"), "ㄋㄤ˙")
    XCTAssertEqual(c.cS2RC("nld"), "ㄋㄥˊ")
    XCTAssertEqual(c.cS2RC("nlf"), "ㄋㄥˇ")
    XCTAssertEqual(c.cS2RC("ne"), "ㄋㄧ")
    XCTAssertEqual(c.cS2RC("ned"), "ㄋㄧˊ")
    XCTAssertEqual(c.cS2RC("nef"), "ㄋㄧˇ")
    XCTAssertEqual(c.cS2RC("nej"), "ㄋㄧˋ")
    XCTAssertEqual(c.cS2RC("nee"), "ㄋㄧㄝ")
    XCTAssertEqual(c.cS2RC("need"), "ㄋㄧㄝˊ")
    XCTAssertEqual(c.cS2RC("neej"), "ㄋㄧㄝˋ")
    XCTAssertEqual(c.cS2RC("newf"), "ㄋㄧㄠˇ")
    XCTAssertEqual(c.cS2RC("newj"), "ㄋㄧㄠˋ")
    XCTAssertEqual(c.cS2RC("neo"), "ㄋㄧㄡ")
    XCTAssertEqual(c.cS2RC("neod"), "ㄋㄧㄡˊ")
    XCTAssertEqual(c.cS2RC("neof"), "ㄋㄧㄡˇ")
    XCTAssertEqual(c.cS2RC("neoj"), "ㄋㄧㄡˋ")
    XCTAssertEqual(c.cS2RC("nem"), "ㄋㄧㄢ")
    XCTAssertEqual(c.cS2RC("nemd"), "ㄋㄧㄢˊ")
    XCTAssertEqual(c.cS2RC("nemf"), "ㄋㄧㄢˇ")
    XCTAssertEqual(c.cS2RC("nemj"), "ㄋㄧㄢˋ")
    XCTAssertEqual(c.cS2RC("nen"), "ㄋㄧㄣ")
    XCTAssertEqual(c.cS2RC("nend"), "ㄋㄧㄣˊ")
    XCTAssertEqual(c.cS2RC("nenf"), "ㄋㄧㄣˇ")
    XCTAssertEqual(c.cS2RC("nenj"), "ㄋㄧㄣˋ")
    XCTAssertEqual(c.cS2RC("nekd"), "ㄋㄧㄤˊ")
    XCTAssertEqual(c.cS2RC("nekf"), "ㄋㄧㄤˇ")
    XCTAssertEqual(c.cS2RC("nekj"), "ㄋㄧㄤˋ")
    XCTAssertEqual(c.cS2RC("neld"), "ㄋㄧㄥˊ")
    XCTAssertEqual(c.cS2RC("nelf"), "ㄋㄧㄥˇ")
    XCTAssertEqual(c.cS2RC("nelj"), "ㄋㄧㄥˋ")
    XCTAssertEqual(c.cS2RC("nxd"), "ㄋㄨˊ")
    XCTAssertEqual(c.cS2RC("nxf"), "ㄋㄨˇ")
    XCTAssertEqual(c.cS2RC("nxj"), "ㄋㄨˋ")
    XCTAssertEqual(c.cS2RC("nxhd"), "ㄋㄨㄛˊ")
    XCTAssertEqual(c.cS2RC("nxhf"), "ㄋㄨㄛˇ")
    XCTAssertEqual(c.cS2RC("nxhj"), "ㄋㄨㄛˋ")
    XCTAssertEqual(c.cS2RC("nxad"), "ㄋㄨㄟˊ")
    XCTAssertEqual(c.cS2RC("nxmd"), "ㄋㄨㄢˊ")
    XCTAssertEqual(c.cS2RC("nxmf"), "ㄋㄨㄢˇ")
    XCTAssertEqual(c.cS2RC("nxmj"), "ㄋㄨㄢˋ")
    XCTAssertEqual(c.cS2RC("nxnd"), "ㄋㄨㄣˊ")
    XCTAssertEqual(c.cS2RC("nxld"), "ㄋㄨㄥˊ")
    XCTAssertEqual(c.cS2RC("nxlf"), "ㄋㄨㄥˇ")
    XCTAssertEqual(c.cS2RC("nxlj"), "ㄋㄨㄥˋ")
    XCTAssertEqual(c.cS2RC("nud"), "ㄋㄩˊ")
    XCTAssertEqual(c.cS2RC("nuf"), "ㄋㄩˇ")
    XCTAssertEqual(c.cS2RC("nuj"), "ㄋㄩˋ")
    XCTAssertEqual(c.cS2RC("nuej"), "ㄋㄩㄝˋ")
    XCTAssertEqual(c.cS2RC("ly"), "ㄌㄚ")
    XCTAssertEqual(c.cS2RC("lyd"), "ㄌㄚˊ")
    XCTAssertEqual(c.cS2RC("lyf"), "ㄌㄚˇ")
    XCTAssertEqual(c.cS2RC("lyj"), "ㄌㄚˋ")
    XCTAssertEqual(c.cS2RC("lys"), "ㄌㄚ˙")
    XCTAssertEqual(c.cS2RC("lh"), "ㄌㄛ")
    XCTAssertEqual(c.cS2RC("lhs"), "ㄌㄛ˙")
    XCTAssertEqual(c.cS2RC("lg"), "ㄌㄜ")
    XCTAssertEqual(c.cS2RC("lgd"), "ㄌㄜˊ")
    XCTAssertEqual(c.cS2RC("lgj"), "ㄌㄜˋ")
    XCTAssertEqual(c.cS2RC("lgs"), "ㄌㄜ˙")
    XCTAssertEqual(c.cS2RC("lid"), "ㄌㄞˊ")
    XCTAssertEqual(c.cS2RC("lif"), "ㄌㄞˇ")
    XCTAssertEqual(c.cS2RC("lij"), "ㄌㄞˋ")
    XCTAssertEqual(c.cS2RC("la"), "ㄌㄟ")
    XCTAssertEqual(c.cS2RC("lad"), "ㄌㄟˊ")
    XCTAssertEqual(c.cS2RC("laf"), "ㄌㄟˇ")
  }
}
