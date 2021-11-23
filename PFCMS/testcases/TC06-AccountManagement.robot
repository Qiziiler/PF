*** Settings ***
Resource          ${CURDIR}/../resources/testdata/testdata.robot
Resource          ${CURDIR}/../resources/variables/variable_config.robot
Resource          ${CURDIR}/../resources/variables/variable_login.robot
Resource          ${CURDIR}/../keywords/common/common_keywords.robot
Suite Teardown    Close All Browsers

*** Test Cases ***
TC01_Login and Verify Project Management
     [Documentation]     เข้าสู่ระบบสำเร็จและตรวจสอบความถูกต้องของ Project Management
     Open Browser      ${URL}      ${BROWSER}
     Set Window Size    1920   1080         
     Input Text To Element When Ready          ${XPATH_FIELD_USERNAME}       ${EMAIL}           
     Input Text To Element When Ready          ${XPATH_FIELD_PASSWORD}       ${PASSWORD}     
     Click Element When Ready                  ${XPATH_BUTTON_LOGIN}
     Click Element When Ready                  //span[@class="MuiIconButton-label css-4jkopv-MuiIconButton-label"]
     Click Element When Ready                  //div[@class="MuiListItemText-root css-1450wqh-MuiListItemText-root"][text()="Settings"]
     Click Element When Ready                  //div[@class="MuiListItemText-root css-1450wqh-MuiListItemText-root"][text()="Account Management"]
     Wait Until Page Contains                  Account Management
     Capture Page Screenshot                    

TC02_Validate Project Management
     [Documentation]     ตรวจสอบความถูกต้องขององค์ประกอบหน้า Account Management
     Wait Until Page Contains                  ID
     Wait Until Page Contains                  Name-Surname
     Wait Until Page Contains                  Role
     Wait Until Page Contains                  Position
     Wait Until Page Contains                  Phone number
     Wait Until Page Contains                  Email
     Wait Until Page Contains                  Status
     Capture Page Screenshot 

TC03_Test Filter Role Owner
     [Documentation]     ทดสอบ Filter Role Owner
     Click Element When Ready                  //div[@role="button"][1][@aria-haspopup="listbox"]
     ${FilterRoleChoose}      Get Text From Element When Ready     //li[@data-value="aac3bbf1-73fa-4bf1-9657-2726bf6f50a4"]
     Click Element When Ready                  //li[@data-value="aac3bbf1-73fa-4bf1-9657-2726bf6f50a4"]
     ${FilterRoleSelect}      Get Text From Element When Ready     //div[@role="button"][1][@aria-haspopup="listbox"][text()="Owner"]
     Should Be Equal          "${FilterRoleChoose}"     "${FilterRoleSelect}"
     Capture Page Screenshot

TC04_Test Filter Role Moderator
     [Documentation]     ทดสอบ Filter Role Moderator
     Click Element When Ready                  //div[@role="button"][1][@aria-haspopup="listbox"]
     ${FilterRoleChoose}      Get Text From Element When Ready     //li[@data-value="6ca637a6-4eb3-40db-a3aa-a539fe1abc37"]
     Click Element When Ready                  //li[@data-value="6ca637a6-4eb3-40db-a3aa-a539fe1abc37"]
     ${FilterRoleSelect}      Get Text From Element When Ready     //div[@role="button"][1][@aria-haspopup="listbox"][text()="Moderator"]
     Should Be Equal          "${FilterRoleChoose}"     "${FilterRoleSelect}"
     Capture Page Screenshot

TC05_Test Filter Role Manager
     [Documentation]     ทดสอบ Filter Role Manager
     Click Element When Ready                  //div[@role="button"][1][@aria-haspopup="listbox"]
     ${FilterRoleChoose}      Get Text From Element When Ready     //li[@data-value="c0736097-32b4-426a-b1f2-9cabdac0eadf"]
     Click Element When Ready                  //li[@data-value="c0736097-32b4-426a-b1f2-9cabdac0eadf"]
     ${FilterRoleSelect}      Get Text From Element When Ready     //div[@role="button"][1][@aria-haspopup="listbox"][text()="Manager"]
     Should Be Equal          "${FilterRoleChoose}"     "${FilterRoleSelect}"
     Capture Page Screenshot

TC06_Test Filter Role Sale
     [Documentation]     ทดสอบ Filter Role Sale
     Click Element When Ready                  //div[@role="button"][1][@aria-haspopup="listbox"]
     ${FilterRoleChoose}      Get Text From Element When Ready     //li[@data-value="8dd65f7d-8105-42bc-9300-cf3954a62dfa"]
     Click Element When Ready                  //li[@data-value="8dd65f7d-8105-42bc-9300-cf3954a62dfa"]
     ${FilterRoleSelect}      Get Text From Element When Ready     //div[@role="button"][1][@aria-haspopup="listbox"][text()="Sale"]
     Should Be Equal          "${FilterRoleChoose}"     "${FilterRoleSelect}"
     Capture Page Screenshot

TC07_Test Filter Role Audit
     [Documentation]     ทดสอบ Filter Role Audit
     Click Element When Ready                  //div[@role="button"][1][@aria-haspopup="listbox"]
     ${FilterRoleChoose}      Get Text From Element When Ready     //li[@data-value="b252db50-93d4-4754-a379-bf55d175ef73"]
     Click Element When Ready                  //li[@data-value="b252db50-93d4-4754-a379-bf55d175ef73"]
     ${FilterRoleSelect}      Get Text From Element When Ready     //div[@role="button"][1][@aria-haspopup="listbox"][text()="Audit"]
     Should Be Equal          "${FilterRoleChoose}"     "${FilterRoleSelect}"
     Capture Page Screenshot

TC08_Test Filter All Role
     [Documentation]     ทดสอบ Filter ทุก Role
     Click Element When Ready                  //div[@role="button"][1][@aria-haspopup="listbox"]
     ${FilterRoleChoose}      Get Text From Element When Ready     //li[@data-value=""]
     Click Element When Ready                  //li[@data-value=""]
     ${FilterRoleSelect}      Get Text From Element When Ready     //div[@role="button"][1][@aria-haspopup="listbox"]
     Should Be Equal          "${FilterRoleChoose}"     "${FilterRoleSelect}"
     Capture Page Screenshot

TC09_Test Filter Status Active
     [Documentation]     ทดสอบ Filter Status Active
     Click Element When Ready                  //div[@id="mui-component-select-status"]
     ${FilterStatusChoose}      Get Text From Element When Ready     //li[@data-value="active"]
     Click Element When Ready                  //li[@data-value="active"]
     ${FilterStatusSelect}      Get Text From Element When Ready     //div[@id="mui-component-select-status"]
     Should Be Equal          "${FilterStatusChoose}"     "${FilterStatusSelect}"
     Capture Page Screenshot

TC10_Test Filter Status Inactive
     [Documentation]     ทดสอบ Filter Status Inactive
     Click Element When Ready                  //div[@id="mui-component-select-status"]
     ${FilterStatusChoose}      Get Text From Element When Ready     //li[@data-value="inactive"]
     Click Element When Ready                  //li[@data-value="inactive"]
     ${FilterStatusSelect}      Get Text From Element When Ready     //div[@id="mui-component-select-status"]
     Should Be Equal          "${FilterStatusChoose}"     "${FilterStatusSelect}"
     Capture Page Screenshot

TC11_Test Filter All Status
     [Documentation]     ทดสอบ Filter ทุก Status
     Click Element When Ready                  //div[@id="mui-component-select-status"]
     ${FilterStatusChoose}      Get Text From Element When Ready     //li[@data-value=""]
     Click Element When Ready                  //li[@data-value=""]
     ${FilterStatusSelect}      Get Text From Element When Ready     //div[@id="mui-component-select-status"]
     Should Be Equal          "${FilterStatusChoose}"     "${FilterStatusSelect}"
     Capture Page Screenshot

TC12_Validate Edit Account
     [Documentation]     ตรวจสอบหน้า Edit Account
     Click Element When Ready                  //tr[1]//td[9]//a[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-19fss5u-MuiButtonBase-root-MuiIconButton-root"]/span[@class="MuiIconButton-label css-4jkopv-MuiIconButton-label"]
     Wait Until Page Contains                  Name
     Wait Until Page Contains                  Surname
     Wait Until Page Contains                  Phone number
     Wait Until Page Contains                  Email
     Wait Until Page Contains                  Position
     Wait Until Page Contains                  Role
     Wait Until Page Contains                  Zone
     Wait Until Page Contains                  Type
     Wait Until Page Contains                  Brand
     Wait Until Page Contains                  Location
     Capture Page Screenshot

TC13_Test Edit Name Account
     [Documentation]     ทดสอบ Edit ชื่อ
     ${NameBeforeEdit}      Get Text From Element When Ready        //input[@name="firstname"]
     Input Text To Element When Ready     //input[@name="firstname"]      ${NameBeforeEdit}2
     Click Element When Ready             //span[@class="MuiButton-label css-8xplcm-MuiButton-label"][text()="Save"]
     Wait Until Page Contains             Save Success
     Capture Page Screenshot   

TC14_Test Edit Surname Account
     [Documentation]     ทดสอบ Edit นามสกุล
     ${SurnameBeforeEdit}      Get Text From Element When Ready        //input[@name="lastname"]
     Input Text To Element When Ready     //input[@name="lastname"]      ${SurnameBeforeEdit}2
     Click Element When Ready             //span[@class="MuiButton-label css-8xplcm-MuiButton-label"][text()="Save"]
     Wait Until Page Contains             Save Success
     Capture Page Screenshot

TC15_Test Search By Name & Surname After Edit
     [Documentation]     ทดสอบค้นหาชื่อและนามสกุล ที่ Edit ในช่อง Search
     ${NameAfterEdit}      Get Text From Element When Ready        //input[@name="firstname"]
     ${SurnameAfterEdit}      Get Text From Element When Ready        //input[@name="lastname"]
     Click Element When Ready                  //div[@class="MuiListItemText-root css-1450wqh-MuiListItemText-root"][text()="Account Management"]
     Input Text To Element When Ready          //input[@placeholder="Search..."]     ${NameAfterEdit} ${SurnameAfterEdit}
     Wait Until Page Contains                  ${NameAfterEdit}
     Wait Until Page Contains                  ${SurnameAfterEdit}
     Capture Page Screenshot                   

TC16_Test Edit Name Back to Before Edit
     [Documentation]     ทดสอบ Edit ชื่อกลับไปเป็นเหมือนเดิม
     Click Element When Ready      //tr[1]//td[9]//a[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-19fss5u-MuiButtonBase-root-MuiIconButton-root"]/span[@class="MuiIconButton-label css-4jkopv-MuiIconButton-label"]
     ${NameBeforeEdit}              Get Text From Element When Ready       //input[@name="firstname"]
     ${NameBeforeEdit}      Remove String            ${NameBeforeEdit}             2
     Input Text To Element When Ready     //input[@name="firstname"]        ${NameBeforeEdit}
     Click Element When Ready             //span[@class="MuiButton-label css-8xplcm-MuiButton-label"][text()="Save"]
     Wait Until Page Contains             Save Success
     Capture Page Screenshot

TC17_Test Edit Surname Back to Before Edit
     [Documentation]     ทดสอบ Edit นามสกุลกลับไปเป็นเหมือนเดิม
     ${SurnameBeforeEdit}              Get Text From Element When Ready       //input[@name="lastname"]
     ${SurnameBeforeEdit}      Remove String         ${SurnameBeforeEdit}          2
     Input Text To Element When Ready     //input[@name="lastname"]        ${SurnameBeforeEdit}
     Click Element When Ready             //span[@class="MuiButton-label css-8xplcm-MuiButton-label"][text()="Save"]
     Wait Until Page Contains             Save Success
     Capture Page Screenshot 

TC18_Test Search By Name & Surname Before Edit
     [Documentation]     ทดสอบค้นหาชื่อและนามสกุล ก่อนที่จะ Edit ในช่อง Search
     ${NameBeforeEdit}      Get Text From Element When Ready        //input[@name="firstname"]
     ${SurnameBeforeEdit}      Get Text From Element When Ready        //input[@name="lastname"]
     Click Element When Ready                  //div[@class="MuiListItemText-root css-1450wqh-MuiListItemText-root"][text()="Account Management"]
     Input Text To Element When Ready          //input[@placeholder="Search..."]     ${NameBeforeEdit} ${SurnameBeforeEdit}
     Wait Until Page Contains                  ${NameBeforeEdit}
     Wait Until Page Contains                  ${SurnameBeforeEdit}
     Capture Page Screenshot 

TC19_Test Search By ID
     [Documentation]     ทดสอบค้นหาด้วย ID
     ${ID}      Get Text From Element When Ready        //tr[1]/td[1]
     Input Text To Element When Ready          //input[@placeholder="Search..."]     ${ID}
     Wait Until Page Contains                  ${ID}
     Capture Page Screenshot 

TC20_Test Search By Email
     [Documentation]     ทดสอบค้นหาด้วย Email
     ${Email}      Get Text From Element When Ready        //tr[1]/td[7]
     Input Text To Element When Ready          //input[@placeholder="Search..."]     ${Email}
     Wait Until Page Contains                  ${Email}
     Capture Page Screenshot
