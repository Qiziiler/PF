*** Settings ***
Resource          ${CURDIR}/../resources/testdata/testdata.robot
Resource          ${CURDIR}/../resources/variables/variable_config.robot
Resource          ${CURDIR}/../resources/variables/variable_login.robot
Resource          ${CURDIR}/../keywords/common/common_keywords.robot
Suite Teardown    Close All Browsers

*** Test Cases ***
TC01_Login and Verify Customers
     [Documentation]     เข้าสู่ระบบสำเร็จและตรวจสอบความถูกต้องของ Customers
     Open Browser      ${URL}      ${BROWSER}
     Set Window Size    1920   1080         
     Input Text To Element When Ready          ${XPATH_FIELD_USERNAME}       ${EMAIL}           
     Input Text To Element When Ready          ${XPATH_FIELD_PASSWORD}       ${PASSWORD}     
     Click Element When Ready                  ${XPATH_BUTTON_LOGIN}
     Click Element When Ready                  //span[@class="MuiIconButton-label css-4jkopv-MuiIconButton-label"]
     Click Element When Ready                  //div[@class="MuiButtonBase-root MuiListItem-root MuiListItem-button css-qqtiy0-MuiButtonBase-root-MuiListItem-root"]//div[@class="MuiListItemText-root css-1450wqh-MuiListItemText-root"][text()="Customers"]
     Wait Until Page Contains                  Customers
     Capture Page Screenshot                    


TC02_Validate Customers
     [Documentation]     ตรวจสอบความถูกต้องขององค์ประกอบหน้า Customers
     Wait Until Page Contains                  Pictures
     Wait Until Page Contains                  Name
     Wait Until Page Contains                  Surname
     Wait Until Page Contains                  Tel
     Wait Until Page Contains                  Project
     Wait Until Page Contains                  Status
     Wait Until Page Contains                  Reason
     Wait Until Page Contains                  Sale
     Wait Until Page Contains                  Last Actived
     Capture Page Screenshot 

TC03_Test Filter Zone 1
     [Documentation]     ทดสอบ Filter Zone 1 ชนิด
     Click Element When Ready                  //div[@id="mui-component-select-product_tag_id_zone"]
     ${FilterZoneChoose}      Get Text From Element When Ready     //li[@data-value="7"]
     Click Element When Ready                  //li[@data-value="7"]
     ${FilterZoneSelect}      Get Text From Element When Ready     //div[@id="mui-component-select-product_tag_id_zone"]
     Should Be Equal          "${FilterZoneChoose}"     "${FilterZoneSelect}"
     Capture Page Screenshot

TC04_Test Filter Zone All
     [Documentation]     ทดสอบ Filter Zone ทุกชนิด
     Click Element When Ready                  //div[@id="mui-component-select-product_tag_id_zone"]
     ${FilterZoneChoose}      Get Text From Element When Ready     //li[@data-value=""]
     Click Element When Ready                  //li[@data-value=""]
     ${FilterZoneSelect}      Get Text From Element When Ready     //div[@id="mui-component-select-product_tag_id_zone"]
     Should Be Equal          "${FilterZoneChoose}"     "${FilterZoneSelect}"
     Capture Page Screenshot

TC05_Test Filter Type 1
     [Documentation]     ทดสอบ Filter Type 1 ชนิด
     Click Element When Ready                  //div[@id="mui-component-select-product_tag_id_type"]
     ${FilterTypeChoose}      Get Text From Element When Ready     //li[@data-value="9"]
     Click Element When Ready                  //li[@data-value="9"]
     ${FilterTypeSelect}      Get Text From Element When Ready     //div[@id="mui-component-select-product_tag_id_type"]
     Should Be Equal          "${FilterTypeChoose}"     "${FilterTypeSelect}"
     Capture Page Screenshot     

TC06_Test Filter Type All
     [Documentation]     ทดสอบ Filter Type ทุกชนิด
     Click Element When Ready                  //div[@id="mui-component-select-product_tag_id_type"]
     ${FilterTypeChoose}      Get Text From Element When Ready     //li[@data-value=""]
     Click Element When Ready                  //li[@data-value=""]
     ${FilterTypeSelect}      Get Text From Element When Ready     //div[@id="mui-component-select-product_tag_id_type"]
     Should Be Equal          "${FilterTypeChoose}"     "${FilterTypeSelect}"
     Capture Page Screenshot 

TC07_Test Filter Brand 1
     [Documentation]     ทดสอบ Filter Brand 1 ชนิด
     Click Element When Ready                  //div[@id="mui-component-select-product_category_id"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value="8"]
     Click Element When Ready                  //li[@data-value="8"]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@id="mui-component-select-product_category_id"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC08_Test Filter Brand All
     [Documentation]     ทดสอบ Filter Brand ทุกชนิด
     Click Element When Ready                  //div[@id="mui-component-select-product_category_id"]
     ${FilterBrandChoose}      Get Text From Element When Ready     //li[@data-value=""]
     Click Element When Ready                  //li[@data-value=""]
     ${FilterBrandSelect}      Get Text From Element When Ready     //div[@id="mui-component-select-product_category_id"]
     ${FilterBrandSelect}      Remove String     ${FilterBrandSelect}     Brand\n
     Should Be Equal          "${FilterBrandChoose}"     "${FilterBrandSelect}"
     Capture Page Screenshot

TC09_Test Filter Status 1
     [Documentation]     ทดสอบ Filter Status 1 ชนิด
     Click Element When Ready                  //div[@id="mui-component-select-pipeline_id"]
     ${FilterStatusChoose}      Get Text From Element When Ready     //li[@data-value="3"]
     Click Element When Ready                  //li[@data-value="3"]
     ${FilterStatusSelect}      Get Text From Element When Ready     //div[@id="mui-component-select-pipeline_id"]
     Should Be Equal          "${FilterStatusChoose}"     "${FilterStatusSelect}"
     Capture Page Screenshot

TC10_Test Filter Status All
     [Documentation]     ทดสอบ Filter Status ทุกชนิด
     Click Element When Ready                  //div[@id="mui-component-select-pipeline_id"]
     ${FilterStatusChoose}      Get Text From Element When Ready     //li[@data-value=""]
     Click Element When Ready                  //li[@data-value=""]
     ${FilterStatusSelect}      Get Text From Element When Ready     //div[@id="mui-component-select-pipeline_id"]
     Should Be Equal          "${FilterStatusChoose}"     "${FilterStatusSelect}"
     Capture Page Screenshot        
     
TC11_Test Search Name Customers
     [Documentation]     ทดสอบ Search ชื่อ Customer
     ${NameCustomerBeforeSearch}      Get Text From Element When Ready       //tr[2]//td[2]
     Input Text To Element When Ready     //input[@placeholder="Search..."]      ${NameCustomerBeforeSearch}
     Sleep                 3s
     ${NameCustomerAfterSearch}      Get Text From Element When Ready        //tr//td[2]
     Should Be Equal          ${NameCustomerBeforeSearch}        ${NameCustomerAfterSearch}
     Capture Page Screenshot

TC12_Validate Search Name Customers
     [Documentation]     ตรวจาสอบชื่ออื่นนอกเหนือจากที่ Search
     Wait Until Page Does Not Contain        ทศพร
     Capture Page Screenshot

TC13_Test Search Surname Customers
     [Documentation]     ทดสอบ Search นามสกุล Customer
     Clear Text When Ready    //input[@placeholder="Search..."]
     ${SurnameCustomerBeforeSearch}      Get Text From Element When Ready       //tr[2]//td[3]
     Input Text To Element When Ready     //input[@placeholder="Search..."]      ${SurnameCustomerBeforeSearch}
     Sleep                 3s
     ${SurnameCustomerAfterSearch}      Get Text From Element When Ready        //tr//td[3]
     Should Be Equal          ${SurnameCustomerBeforeSearch}        ${SurnameCustomerAfterSearch}
     Capture Page Screenshot

TC14_Validate Search Surname Customers
     [Documentation]     ตรวจสอบนามสกุลอื่นนอกเหนือจากที่ Search
     Wait Until Page Does Not Contain        สุทธิวิลัย
     Capture Page Screenshot

TC15_Test Search Tel Customers
     [Documentation]     ทดสอบ Search เบอร์โทรศัพท์ Customer
     Clear Text When Ready    //input[@placeholder="Search..."]
     ${TelCustomerBeforeSearch}      Get Text From Element When Ready       //tr[2]//td[4]
     Input Text To Element When Ready     //input[@placeholder="Search..."]      ${TelCustomerBeforeSearch}
     Sleep                 3s
     ${TelCustomerAfterSearch}      Get Text From Element When Ready        //tr//td[4]
     Should Be Equal          ${TelCustomerBeforeSearch}        ${TelCustomerAfterSearch}
     Capture Page Screenshot

TC16_Validate Search Tel Customers
     [Documentation]     ตรวจสอบเบอร์โทรศัพท์อื่นนอกเหนือจากที่ Search
     Wait Until Page Does Not Contain        096-774-4996
     Capture Page Screenshot

TC17_Validate Customers Profile
     [Documentation]     ตรวจสอบ Customer Profile แสดงชื่อลูกค้า Tab Activity, About และ Projects
     Clear Text When Ready    //input[@placeholder="Search..."]
     ${NameCustomer}      Get Text From Element When Ready       //tr[2]//td[2]
     Input Text To Element When Ready     //input[@placeholder="Search..."]      ${NameCustomer}
     Sleep                 3s
     Click Element When Ready                //tr[1]//td[2]
     Wait Until Page Contains      ${NameCustomer}
     Wait Until Page Contains      Activity
     Wait Until Page Contains      About
     Wait Until Page Contains      Projects
     Capture Page Screenshot

TC18_Validate Customers Profile Tab Activity
     [Documentation]     ตรวจสอบ Customer Profile Tab Activity
     Wait Until Page Contains      Activity
     Wait Until Page Contains      Filter
     Wait Until Page Contains      Website Register
     Wait Until Page Contains      Auto Matching
     Wait Until Page Contains      Status Updated
     Capture Page Screenshot

TC19_Validate Customers Profile Tab About
     [Documentation]     ตรวจสอบ Customer Profile Tab About
     Click Element When Ready      //span[@class="MuiTab-wrapper css-5vyc69-MuiTab-wrapper"][text()="About"]
     Wait Until Page Contains      Contact Information
     Wait Until Page Contains      Edit
     Wait Until Page Contains      ชื่อ:
     Wait Until Page Contains      นามสกุล:
     Wait Until Page Contains      เพศ:
     Wait Until Page Contains      วันเกิด:
     Wait Until Page Contains      ช่องทางการติดต่อครั้งแรก:
     Wait Until Page Contains      ช่วงเวลาที่สะดวกให้ติดต่อ (วันลงทะเบียน):
     Wait Until Page Contains      เบอร์โทรศัพท์:
     Wait Until Page Contains      อีเมลล์:
     Wait Until Page Contains      Facebook name:
     Wait Until Page Contains      LINE ID:
     Wait Until Page Contains      เริ่มเป็นสมาชิกวันที่:
     Capture Page Screenshot

TC20_Validate Customers Profile Tab Projects
     [Documentation]     ตรวจสอบ Customer Profile Tab Projects
     Click Element When Ready      //span[@class="MuiTab-wrapper css-5vyc69-MuiTab-wrapper"][text()="Projects"]
     Wait Until Page Contains      Your Project
     Wait Until Page Contains      Other Project
     Wait Until Page Contains      ลงทะเบียน
     Wait Until Page Contains      ติดต่อแล้ว
     Wait Until Page Contains      เยี่ยมชม
     Wait Until Page Contains      ตกลงราคา
     Wait Until Page Contains      จอง
     Capture Page Screenshot