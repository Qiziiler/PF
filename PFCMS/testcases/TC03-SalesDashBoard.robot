*** Settings ***
Resource          ${CURDIR}/../resources/testdata/testdata.robot
Resource          ${CURDIR}/../resources/variables/variable_config.robot
Resource          ${CURDIR}/../resources/variables/variable_login.robot
Resource          ${CURDIR}/../keywords/common/common_keywords.robot
Suite Teardown    Close All Browsers

*** Test Cases ***
TC01_Login and Verify User Profile
     [Documentation]     เข้าสู่ระบบสำเร็จและตรวจสอบความถูกต้องของ Sales Dashboard
     Open Browser      ${URL}      ${BROWSER}
     Set Window Size    1920   1080        
     Input Text To Element When Ready          ${XPATH_FIELD_USERNAME}       ${EMAIL}           
     Input Text To Element When Ready          ${XPATH_FIELD_PASSWORD}       ${PASSWORD}     
     Click Element When Ready                  ${XPATH_BUTTON_LOGIN}
     sleep                                     3s
     Wait Until Page Contains                  Sales Dashboard
     Capture Page Screenshot

TC02_Test Filter Task Projects 1
     [Documentation]     ทดสอบ Filter โครงการที่ 1
     Click Element When Ready                  //div[@class="MuiSelect-select MuiSelect-standard MuiInput-input MuiInputBase-input css-1midgzg-MuiSelect-select-MuiInputBase-input-MuiInput-input"]
     ${FilterNameChoose}  Get Text From Element When Ready         //li[@class="MuiButtonBase-root MuiListItem-root MuiListItem-gutters MuiListItem-button MuiMenuItem-root css-crmwjc-MuiButtonBase-root-MuiListItem-root-MuiMenuItem-root"][1]
     Click Element When Ready                  //li[@class="MuiButtonBase-root MuiListItem-root MuiListItem-gutters MuiListItem-button MuiMenuItem-root css-crmwjc-MuiButtonBase-root-MuiListItem-root-MuiMenuItem-root"][1]
     ${FilterNameSelect}  Get Text From Element When Ready         //div[@class="MuiSelect-select MuiSelect-standard MuiInput-input MuiInputBase-input css-1midgzg-MuiSelect-select-MuiInputBase-input-MuiInput-input"]
     Should Be Equal                         '${FilterNameChoose}'   '${FilterNameSelect}'
     Capture Page Screenshot

TC03_Test Filter Task Projects 2
     [Documentation]     ทดสอบ Filter โครงการที่ 2
     Click Element When Ready                  //div[@class="MuiSelect-select MuiSelect-standard MuiInput-input MuiInputBase-input css-1midgzg-MuiSelect-select-MuiInputBase-input-MuiInput-input"]
     ${FilterNameChoose}  Get Text From Element When Ready         //li[@class="MuiButtonBase-root MuiListItem-root MuiListItem-gutters MuiListItem-button MuiMenuItem-root css-crmwjc-MuiButtonBase-root-MuiListItem-root-MuiMenuItem-root"][2]
     Click Element When Ready                  //li[@class="MuiButtonBase-root MuiListItem-root MuiListItem-gutters MuiListItem-button MuiMenuItem-root css-crmwjc-MuiButtonBase-root-MuiListItem-root-MuiMenuItem-root"][2]
     ${FilterNameSelect}  Get Text From Element When Ready         //div[@class="MuiSelect-select MuiSelect-standard MuiInput-input MuiInputBase-input css-1midgzg-MuiSelect-select-MuiInputBase-input-MuiInput-input"]
     Should Be Equal                         '${FilterNameChoose}'   '${FilterNameSelect}'
     Capture Page Screenshot

TC04_Test Filter Task Projects 3
     [Documentation]     ทดสอบ Filter โครงการที่ 3
     Click Element When Ready                  //div[@class="MuiSelect-select MuiSelect-standard MuiInput-input MuiInputBase-input css-1midgzg-MuiSelect-select-MuiInputBase-input-MuiInput-input"]
     ${FilterNameChoose}  Get Text From Element When Ready         //li[@class="MuiButtonBase-root MuiListItem-root MuiListItem-gutters MuiListItem-button MuiMenuItem-root css-crmwjc-MuiButtonBase-root-MuiListItem-root-MuiMenuItem-root"][3]
     Click Element When Ready                  //li[@class="MuiButtonBase-root MuiListItem-root MuiListItem-gutters MuiListItem-button MuiMenuItem-root css-crmwjc-MuiButtonBase-root-MuiListItem-root-MuiMenuItem-root"][3]
     ${FilterNameSelect}  Get Text From Element When Ready         //div[@class="MuiSelect-select MuiSelect-standard MuiInput-input MuiInputBase-input css-1midgzg-MuiSelect-select-MuiInputBase-input-MuiInput-input"]
     Should Be Equal                         '${FilterNameChoose}'   '${FilterNameSelect}'
     Capture Page Screenshot

TC05_Test Filter Task All Projects
     [Documentation]     ทดสอบ Filter All
     Click Element When Ready                  //div[@class="MuiSelect-select MuiSelect-standard MuiInput-input MuiInputBase-input css-1midgzg-MuiSelect-select-MuiInputBase-input-MuiInput-input"]
     ${FilterNameChoose}  Get Text From Element When Ready         //li[@class="MuiButtonBase-root MuiListItem-root MuiListItem-gutters MuiListItem-button MuiMenuItem-root css-crmwjc-MuiButtonBase-root-MuiListItem-root-MuiMenuItem-root"]
     Click Element When Ready                  //li[@class="MuiButtonBase-root MuiListItem-root MuiListItem-gutters MuiListItem-button MuiMenuItem-root css-crmwjc-MuiButtonBase-root-MuiListItem-root-MuiMenuItem-root"]
     ${FilterNameSelect}  Get Text From Element When Ready         //div[@class="MuiSelect-select MuiSelect-standard MuiInput-input MuiInputBase-input css-1midgzg-MuiSelect-select-MuiInputBase-input-MuiInput-input"]
     Should Be Equal                         '${FilterNameChoose}'   '${FilterNameSelect}'
     Capture Page Screenshot

TC06_Test Online Sale List Button
     [Documentation]     ทดสอบดู Online Sale List ประกอบไปด้วย No., Pictures, Name-Surname, Project, Tel และ Email
     Click Element When Ready                  //button[@id="btn_sale_list"]
     Wait Until Page Contains                  No.
     Wait Until Page Contains                  Pictures
     Wait Until Page Contains                  Name-Surname
     Wait Until Page Contains                  Project
     Wait Until Page Contains                  Tel
     Wait Until Page Contains                  Email
     Capture Page Screenshot
     Go Back
                              
TC07_Test Should Be Eqaul Top Pending Task and Bot Pending Task
     [Documentation]     ทดสอบเทียบ Task ที่รอดำเนินการ กับ Pending Task
     ${PendingTOP}  Get Text From Element When Ready              //div[contains(@class,"css-1lr8ejy-MuiGrid-root")][2]//div[contains(@class,"MuiPaper-elevation0")]//div[@class="MuiBox-root css-pfbhpp"]//h3
     ${PendingBOT}  Get Text From Element When Ready              //span[contains(@class,"css-oz9zm2-MuiTypography-root")][1]
     Should Be Equal                         '(${PendingTOP})'   '${PendingBOT}'
     Capture Page Screenshot

TC08_Test Should Be Eqaul Top Complete Task and Bot Complete Task
     [Documentation]     ทดสอบเทียบ Task ที่รอดำเนินการ กับ Pending Task
     ${CompleteTOP}  Get Text From Element When Ready              //div[contains(@class,"css-1lr8ejy-MuiGrid-root")][3]//div[contains(@class,"MuiPaper-elevation0")]//div[@class="MuiBox-root css-pfbhpp"]//h3
     ${CompleteBOT}  Get Text From Element When Ready              //div[@class="css-1gnw4iv-Stack-root"]//div[@class="MuiBox-root css-1a8w37c"]//span[contains(@class,"css-oz9zm2-MuiTypography-root")]
     Should Be Equal                         '(${CompleteTOP})'   '${CompleteBOT}'
     Capture Page Screenshot

TC09_Test Search Task List
    [Documentation]      ทดสอบ Search ชื่อลูกค้าใน Task List
    Input Text To Element When Ready         //input[@placeholder="Search..."]         Pichaiyut
    Wait Until Page Contains                 Pichaiyut
    Capture Page Screenshot

TC10_Validate Search Task List
    [Documentation]      ตรวจสอบชื่อลูกค้าที่ไม่ได้ Search ใน Task List
    Wait Until Page Does Not Contain         Supaporn
    Capture Page Screenshot