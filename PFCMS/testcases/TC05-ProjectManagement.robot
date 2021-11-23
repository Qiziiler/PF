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
     Click Element When Ready                  //div[@class="MuiListItemText-root css-1450wqh-MuiListItemText-root"][text()="Project Management"]
     Wait Until Page Contains                  Project Management
     Capture Page Screenshot                    


TC02_Validate Project Management
     [Documentation]     ตรวจสอบความถูกต้องขององค์ประกอบหน้า Project Management
     Wait Until Page Contains                  Code
     Wait Until Page Contains                  Zone
     Wait Until Page Contains                  Type
     Wait Until Page Contains                  Brand
     Wait Until Page Contains                  Location
     Wait Until Page Contains                  Status
     Capture Page Screenshot 

TC03_Test Filter Type 1
     [Documentation]     ทดสอบ Filter Type รีสอร์ท เรสซิเดนซ์
     Click Element When Ready                  //div[@role="button"][1][@aria-haspopup="listbox"]
     ${FilterTypeChoose}      Get Text From Element When Ready     //li[@value2="รีสอร์ท เรสซิเดนซ์"]
     Click Element When Ready                  //li[@value2="รีสอร์ท เรสซิเดนซ์"]
     ${FilterTypeSelect}      Get Text From Element When Ready     //div[@role="button"][1][@aria-haspopup="listbox"][text()="รีสอร์ท เรสซิเดนซ์"]
     Should Be Equal          "${FilterTypeChoose}"     "${FilterTypeSelect}"
     Capture Page Screenshot

TC04_Test Filter Type 2
     [Documentation]     ทดสอบ Filter Type ทาวน์โฮม
     Click Element When Ready                  //div[@role="button"][1][@aria-haspopup="listbox"]
     ${FilterTypeChoose}      Get Text From Element When Ready     //li[@value2="ทาวน์โฮม"]
     Click Element When Ready                  //li[@value2="ทาวน์โฮม"]
     ${FilterTypeSelect}      Get Text From Element When Ready     //div[@role="button"][1][@aria-haspopup="listbox"][text()="ทาวน์โฮม"]
     Should Be Equal          "${FilterTypeChoose}"     "${FilterTypeSelect}"
     Capture Page Screenshot

TC05_Test Filter Type 3
     [Documentation]     ทดสอบ Filter Type บ้านเดี่ยว
     Click Element When Ready                  //div[@role="button"][1][@aria-haspopup="listbox"]
     ${FilterTypeChoose}      Get Text From Element When Ready     //li[@value2="บ้านเดี่ยว"]
     Click Element When Ready                  //li[@value2="บ้านเดี่ยว"]
     ${FilterTypeSelect}      Get Text From Element When Ready     //div[@role="button"][1][@aria-haspopup="listbox"][text()="บ้านเดี่ยว"]
     Should Be Equal          "${FilterTypeChoose}"     "${FilterTypeSelect}"
     Capture Page Screenshot

TC06_Test Filter Type 4
     [Documentation]     ทดสอบ Filter Type บ้านเดี่ยว
     Click Element When Ready                  //div[@role="button"][1][@aria-haspopup="listbox"]
     ${FilterTypeChoose}      Get Text From Element When Ready     //li[@value2="บ้านเดี่ยว"]
     Click Element When Ready                  //li[@value2="บ้านเดี่ยว"]
     ${FilterTypeSelect}      Get Text From Element When Ready     //div[@role="button"][1][@aria-haspopup="listbox"][text()="บ้านเดี่ยว"]
     Should Be Equal          "${FilterTypeChoose}"     "${FilterTypeSelect}"
     Capture Page Screenshot

TC07_Test Filter Type All
     [Documentation]     ทดสอบ Filter Type ทุกชนิด
     Click Element When Ready                  //div[@role="button"][1][@aria-haspopup="listbox"]
     ${FilterTypeChoose}      Get Text From Element When Ready     //li[@class="MuiButtonBase-root MuiListItem-root MuiListItem-gutters MuiListItem-button MuiMenuItem-root css-crmwjc-MuiButtonBase-root-MuiListItem-root-MuiMenuItem-root"]//em
     Click Element When Ready                  //li[@class="MuiButtonBase-root MuiListItem-root MuiListItem-gutters MuiListItem-button MuiMenuItem-root css-crmwjc-MuiButtonBase-root-MuiListItem-root-MuiMenuItem-root"]//em
     ${FilterTypeSelect}      Get Text From Element When Ready     //div[@role="button"][1][@aria-haspopup="listbox"]//em
     Should Be Equal          "${FilterTypeChoose}"     "${FilterTypeSelect}"
     Capture Page Screenshot

TC08_Test Filter Brand 1
     [Documentation]     ทดสอบ Filter Brand เบลล่า คอสต้า
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="เบลล่า คอสต้า"]
     Click Element When Ready                  //li[@data-value="เบลล่า คอสต้า"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC09_Test Filter Brand 2
     [Documentation]     ทดสอบ Filter Brand เบลล่า เดล มอนเต้
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="เบลล่า เดล มอนเต้"]
     Click Element When Ready                  //li[@data-value="เบลล่า เดล มอนเต้"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC10_Test Filter Brand 3
     [Documentation]     ทดสอบ Filter Brand เดอะ เลค
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="เดอะ เลค"]
     Click Element When Ready                  //li[@data-value="เดอะ เลค"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC11_Test Filter Brand 4
     [Documentation]     ทดสอบ Filter Brand ไอ คอนโด
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="ไอ คอนโด"]
     Click Element When Ready                  //li[@data-value="ไอ คอนโด"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC12_Test Filter Brand 5
     [Documentation]     ทดสอบ Filter Brand เมโทรลักซ์
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="เมโทรลักซ์"]
     Click Element When Ready                  //li[@data-value="เมโทรลักซ์"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC13_Test Filter Brand 6
     [Documentation]     ทดสอบ Filter Brand เมโทร สกาย
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="เมโทร สกาย"]
     Click Element When Ready                  //li[@data-value="เมโทร สกาย"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC14_Test Filter Brand 7
     [Documentation]     ทดสอบ Filter Brand เดอะ สกาย
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="เดอะ สกาย"]
     Click Element When Ready                  //li[@data-value="เดอะ สกาย"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC15_Test Filter Brand 8
     [Documentation]     ทดสอบ Filter Brand เดอะ เมทโทร
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="เดอะ เมทโทร"]
     Click Element When Ready                  //li[@data-value="เดอะ เมทโทร"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC16_Test Filter Brand 9
     [Documentation]     ทดสอบ Filter Brand โมดิ วิลล่า
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="โมดิ วิลล่า"]
     Click Element When Ready                  //li[@data-value="โมดิ วิลล่า"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC17_Test Filter Brand 10
     [Documentation]     ทดสอบ Filter Brand เลค ฟอเรสต์
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="เลค ฟอเรสต์"]
     Click Element When Ready                  //li[@data-value="เลค ฟอเรสต์"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC18_Test Filter Brand 11
     [Documentation]     ทดสอบ Filter Brand เพอร์เฟค พาร์ค
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="เพอร์เฟค พาร์ค"]
     Click Element When Ready                  //li[@data-value="เพอร์เฟค พาร์ค"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC19_Test Filter Brand 12
     [Documentation]     ทดสอบ Filter Brand เพอร์เฟค เพลส
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="เพอร์เฟค เพลส"]
     Click Element When Ready                  //li[@data-value="เพอร์เฟค เพลส"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC20_Test Filter Brand 13
     [Documentation]     ทดสอบ Filter Brand เพอร์เฟค เรสซิเดนซ์
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="เพอร์เฟค เรสซิเดนซ์"]
     Click Element When Ready                  //li[@data-value="เพอร์เฟค เรสซิเดนซ์"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC21_Test Filter Brand 14
     [Documentation]     ทดสอบ Filter Brand เพอร์เฟค มาสเตอร์พีซ
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="เพอร์เฟค มาสเตอร์พีซ"]
     Click Element When Ready                  //li[@data-value="เพอร์เฟค มาสเตอร์พีซ"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC22_Test Filter Brand 15
     [Documentation]     ทดสอบ Filter Brand เลค เลเจนด์
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="เลค เลเจนด์"]
     Click Element When Ready                  //li[@data-value="เลค เลเจนด์"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC23_Test Filter Brand All
     [Documentation]     ทดสอบ Filter Brand ทุกชนิด
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value=""]//em
     Click Element When Ready                  //li[@data-value=""]//em
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][2]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC24_Test Filter Status Active
     [Documentation]     ทดสอบ Filter Status Active
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][3]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterStatusChoose}      Get Text From Element When Ready     //li[@data-value="active"]
     Click Element When Ready                  //li[@data-value="active"]
     ${FilterStatusSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][3]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterStatusSelect}      Remove String     ${FilterStatusSelect}     Status\n
     Should Be Equal          "${FilterStatusChoose}"     "${FilterStatusSelect}"
     Capture Page Screenshot

TC25_Test Filter Status Inactive
     [Documentation]     ทดสอบ Filter Status Inactive
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][3]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterStatusChoose}      Get Text From Element When Ready     //li[@data-value="active"]
     Click Element When Ready                  //li[@data-value="active"]
     ${FilterStatusSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][3]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterStatusSelect}      Remove String     ${FilterStatusSelect}     Status\n
     Should Be Equal          "${FilterStatusChoose}"     "${FilterStatusSelect}"
     Capture Page Screenshot

TC26_Test Filter Status All
     [Documentation]     ทดสอบ Filter Status ทุกชนิด
     Click Element When Ready                  //div[@class="MuiBox-root css-xud9xj"][3]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterStatusChoose}      Get Text From Element When Ready     //li[@data-value=""]
     Click Element When Ready                  //li[@data-value=""]
     ${FilterStatusSelect}      Get Text From Element When Ready     //div[@class="MuiBox-root css-xud9xj"][3]//div[@class="MuiFormControl-root MuiFormControl-fullWidth css-q8hpuo-MuiFormControl-root"]
     ${FilterStatusSelect}      Remove String     ${FilterStatusSelect}     Status\n
     Should Be Equal          "${FilterStatusChoose}"     "${FilterStatusSelect}"
     Capture Page Screenshot

TC27_Validate Edit Project
     [Documentation]     ตรวจสอบหน้า Edit Project
     Click Element When Ready                  //tr[1]//td[7]//a[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-19fss5u-MuiButtonBase-root-MuiIconButton-root"]/span[@class="MuiIconButton-label css-4jkopv-MuiIconButton-label"]
     Wait Until Page Contains                  Code
     Wait Until Page Contains                  Product Name
     Wait Until Page Contains                  Location
     Wait Until Page Contains                  Status
     Capture Page Screenshot

TC28_Test Edit Code Project
     [Documentation]     ทดสอบหน้า Edit Code Project
     ${CodeProjectBeforeEdit}      Get Text From Element When Ready        //input[@name="code"]
     Input Text To Element When Ready     //input[@name="code"]     ${CodeProjectBeforeEdit}2
     Click Element When Ready             //span[@class="MuiButton-label css-8xplcm-MuiButton-label"][text()="Save"]
     Wait Until Page Contains             Save Success
     Capture Page Screenshot   

TC29_Test Search By Code After Edit
     [Documentation]     ทดสอบค้นหา Code ที่ Edit ในช่อง Search
     ${CodeProjectAfterEdit}      Get Text From Element When Ready        //input[@name="code"]
     Click Element When Ready                  //div[@class="MuiListItemText-root css-1450wqh-MuiListItemText-root"][text()="Project Management"]
     Input Text To Element When Ready          //input[@placeholder="Search..."]     ${CodeProjectAfterEdit}
     Wait Until Page Contains                  ${CodeProjectAfterEdit}
     Capture Page Screenshot

TC30_Test Edit Code Project To Before Edit Code
     [Documentation]     ทดสอบหน้า Code Project กลับไปเป็นเหมือนเดิม
     ${CodeProjectBeforeEdit}      Get Text From Element When Ready       //tr[1]//td[1]
     ${CodeProjectBeforeEdit}      Remove String     '${CodeProjectBeforeEdit}'     '2'
     Click Element When Ready                  //tr[1]//td[7]//a[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-19fss5u-MuiButtonBase-root-MuiIconButton-root"]/span[@class="MuiIconButton-label css-4jkopv-MuiIconButton-label"]
     Clear Text When Ready        //input[@name="code"]
     Input Text To Element When Ready     //input[@name="code"]        ${CodeProjectBeforeEdit}
     Click Element When Ready             //span[@class="MuiButton-label css-8xplcm-MuiButton-label"][text()="Save"]
     Wait Until Page Contains             Save Success
     Capture Page Screenshot 

TC31_Test Search By Code Before Edit
     [Documentation]     ทดสอบค้นหา Code ที่ Edit กลับไปเป็นเหมือนเดิมในช่อง Search
     ${CodeProjectBeforeEdit}      Get Text From Element When Ready        //input[@name="code"]
     Click Element When Ready                  //div[@class="MuiListItemText-root css-1450wqh-MuiListItemText-root"][text()="Project Management"]
     Input Text To Element When Ready          //input[@placeholder="Search..."]     ${CodeProjectBeforeEdit}
     Wait Until Page Contains                  ${CodeProjectBeforeEdit}
     Capture Page Screenshot