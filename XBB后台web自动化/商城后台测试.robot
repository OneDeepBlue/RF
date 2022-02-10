*** Settings ***
Resource          公共库/浏览器操作.txt
Library           Selenium2Library
Resource          公共库/打开菜单.txt
Resource          各菜单界面操作/商品管理/商品管理.txt
Resource          各菜单界面操作/商品管理/待审核商品.txt
Resource          各菜单界面操作/公共/用户相关.txt
Resource          公共库/关键字大全.txt

*** Test Cases ***
商品管理
    [Setup]
    浏览器操作.打开浏览器    http://test.zonemall.xbbang.cn/
    ${reg}    登录    lingy    123456
    Run Keyword And Continue On Failure    Should Be Equal    ${reg}    登录成功！    #断言失败了也继续后续操作
    商品管理.打开菜单
    商品管理.查询条件    苹果    辣条    毛巾
    商品管理.查询
    商品管理.重置查询条件
    商品管理.查询商品状态切换    1
    商品管理.查询商品状态切换    0
    商品管理.重置查询条件
    ${date}    Get Time    #获取当前时间戳
    Comment    发布商品    洗发水    \    洗发水${date}
    商品管理.数据操作    测试多规格    查看
    列表界面.翻页    商品管理    30    3    4
    sleep    3
    退出登录
    [Teardown]    浏览器操作.关闭浏览器

待审核商品
    打开浏览器    http://test.zonemall.xbbang.cn/
    ${reg}    登录    lingy    123456
    Run Keyword And Continue On Failure    Should Be Equal    ${reg}    登录成功！    #断言失败了也继续后续操作
    待审核商品.打开菜单
    ${yyyy}    ${mm}    ${dd}    GET TIME    year,month,day
    待审核商品.查询条件    洗发水    \    \    ${yyyy}-${mm}-${dd}    ${yyyy}-${mm}-${dd}
    待审核商品.查询
    待审核商品.数据操作    洗发水    查看
    待审核商品.商品审核    审核通过
    [Teardown]    关闭浏览器

调试
    浏览器操作.打开浏览器    https://www.vvvdj.com/
    Click Element    //a[@title="好听"]
    选择窗口    好听dj舞曲,好听的dj歌曲,好听的dj大全-清风DJ音乐网 www.vvvdj.com
    ${aa}    获取元素文本    //td[@width="55"]
    log    ${aa}
