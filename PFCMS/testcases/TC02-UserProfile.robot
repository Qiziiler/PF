*** Settings ***
Resource          ${CURDIR}/../resources/testdata/testdata.robot
Resource          ${CURDIR}/../resources/variables/variable_config.robot
Resource          ${CURDIR}/../resources/variables/variable_login.robot
Resource          ${CURDIR}/../keywords/common/common_keywords.robot
Suite Teardown    Close All Browsers

*** Test Cases ***
TC01_Login and Verify User Profile
     [Documentation]   เข้าสู่ระบบสำเร็จและตรวจสอบความถูกต้องของ User Profile
     Open Browser      ${URL}      ${BROWSER}
     Set Window Size    1920   1080        
     # Input Text To Element When Ready          ${XPATH_FIELD_USERNAME}       ${EMAIL}           
     # Input Text To Element When Ready          ${XPATH_FIELD_PASSWORD}       ${PASSWORD}     
     # Click Element When Ready                  ${XPATH_BUTTON_LOGIN}
     # ${NameUser}      Get Text From Element When Ready     //p[@class="MuiTypography-root MuiTypography-body1 css-1vcvdqw-MuiTypography-root"]
     # Click Element When Ready                  //p[@class="MuiTypography-root MuiTypography-body1 css-1vcvdqw-MuiTypography-root"]
     # Wait Until Page Contains                  ${NameUser}            ${TIME_WAIT}
     # Capture Page Screenshot

TC02_Edit Name User Profile
     [Documentation]   ทดสอบแก้ไขชื่อ User Profile
     Click Element When Ready                 //li[@id="btn_my_profile"]
     Clear Text When Ready                    //input[@name="firstname"]
     Input Text To Element When Ready         //input[@name="firstname"]      Baboka
     Clear Text When Ready                    //input[@name="lastname"]       
     Input Text To Element When Ready         //input[@name="lastname"]       Bojoka
     Click Element When Ready                 //button[@type="submit"]
     Wait Until Page Contains                 Save Success
     Click Element When Ready                 //p[@class="MuiTypography-root MuiTypography-body1 css-1vcvdqw-MuiTypography-root"]
     ${NAME}  Get Text From Element When Ready         //h6[@class="MuiTypography-root MuiTypography-subtitle1 MuiTypography-noWrap css-zpto7g-MuiTypography-root"]
     Should Be Equal                         '${NAME}'   'Baboka Bojoka'
     Capture Page Screenshot

TC03_Rename back
     [Documentation]   ทดสอบเปลี่ยนชื่อกลับเป็นเหมือนเดิม
     Click Element When Ready                 //li[@id="btn_my_profile"]
     Clear Text When Ready                    //input[@name="firstname"]
     Input Text To Element When Ready         //input[@name="firstname"]      Benjamen
     Clear Text When Ready                    //input[@name="lastname"]       
     Input Text To Element When Ready         //input[@name="lastname"]       Vuitton
     Click Element When Ready                 //button[@type="submit"]
     Wait Until Page Contains                 Save Success
     Click Element When Ready                 //p[@class="MuiTypography-root MuiTypography-body1 css-1vcvdqw-MuiTypography-root"]
     ${NAME}  Get Text From Element When Ready         //h6[@class="MuiTypography-root MuiTypography-subtitle1 MuiTypography-noWrap css-zpto7g-MuiTypography-root"]     
     Should Be Equal                         '${NAME}'   'Benjamen Vuitton'
     Capture Page Screenshot

TC04_Edit Phone Number
     [Documentation]   ทดสอบเปลี่ยนหมายเลขโทรศัพท์
     Click Element When Ready                 //li[@id="btn_my_profile"]
     Press Keys                               //input[@name="mobile"]         BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE
     Input Text To Element When Ready         //input[@name="mobile"]         123456789
     Click Element When Ready                 //button[@type="submit"]
     Wait Until Page Contains                 Save Success
     Capture Page Screenshot

TC05_Edit Empty Name and Surname 
     [Documentation]    ทดสอบไม่กรอกชื่อและนามสกุลและตรวจสอบ Error Message Name is required และ Surname is required
     Click Element When Ready                 //p[@class="MuiTypography-root MuiTypography-body1 css-1vcvdqw-MuiTypography-root"]
     Click Element When Ready                 //li[@id="btn_my_profile"]
     Clear Text When Ready                    //input[@name="firstname"]
     Wait Until Page Contains                 Name is required
     Capture Page Screenshot
     Clear Text When Ready                    //input[@name="lastname"]
     Wait Until Page Contains                 Surname is required
     Capture Page Screenshot

TC06_Edit Wrong Phone Number 
     [Documentation]    ทดสอบแก้ไขหมายเลขโทรศัพท์ที่ผิดและตรวจสอบ Error Message Invalid phone number
     Click Element When Ready                 //p[@class="MuiTypography-root MuiTypography-body1 css-1vcvdqw-MuiTypography-root"]
     Click Element When Ready                 //li[@id="btn_my_profile"]
     sleep                                    3s
     Press Keys                               //input[@name="mobile"]         BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE
     Input Text To Element When Ready         //input[@name="mobile"]         12345678 
     sleep                                    3s   
     Wait Until Page Contains                 Invalid phone number
     Capture Page Screenshot

TC07_Test Change Password 
     [Documentation]    ทดสอบเปลี่ยน Password สำเร็จ
     Click Element When Ready                 //p[@class="MuiTypography-root MuiTypography-body1 css-1vcvdqw-MuiTypography-root"]
     Click Element When Ready                 //li[@id="btn_change_password"]
     sleep                                    3s
     Input Text To Element When Ready         //input[@name="currentPassword"]     jenosize
     Input Text To Element When Ready         //input[@name="newPassword"]     jenosize
     Input Text To Element When Ready         //input[@name="confirmNewPassword"]     jenosize
     Click Element When Ready                 //button[@type="submit"]
     Click Element When Ready                 //span[@class="MuiButton-label css-8xplcm-MuiButton-label"][text()="Confirm"]
     Wait Until Page Contains                 Save Success
     Capture Page Screenshot

TC08_Test Input Empty Password 
     [Documentation]    ทดสอบเปลี่ยน Password โดยใส่ค่าว่างที่ช่อง Current Password, New Password และ Confirm New Password พร้อมตรวจสอบ Error Message Current Password is required, Password must be minimum 8+ และ Password is not match
     Click Element When Ready                 //p[@class="MuiTypography-root MuiTypography-body1 css-1vcvdqw-MuiTypography-root"]
     Click Element When Ready                 //li[@id="btn_change_password"]
     sleep                                    3s
     Clear Text When Ready                    //input[@name="currentPassword"]
     Clear Text When Ready                    //input[@name="newPassword"]
     Clear Text When Ready                    //input[@name="confirmNewPassword"]
     Click Element When Ready                 //button[@type="submit"]
     sleep                                    3s
     Wait Until Page Contains                 Current Password is required          ${TIME_WAIT}
     Wait Until Page Contains                 Password must be minimum 8+           ${TIME_WAIT}
     Wait Until Page Contains                 Password is not match                 ${TIME_WAIT}
     Capture Page Screenshot

TC09_Test Correct Current Password but Wrong New Password & Confirm New Password
     [Documentation]     ทดสอบเปลี่ยน Password โดยใส่ Current Password ถูก แต่ใส่ New Password และ Confirm New Password ผิด พร้อมตรวจสอบ Error Messange Password is not match
     Click Element When Ready                 //p[@class="MuiTypography-root MuiTypography-body1 css-1vcvdqw-MuiTypography-root"]
     Click Element When Ready                 //li[@id="btn_change_password"]
     Input Text To Element When Ready         //input[@name="currentPassword"]     jenosize
     Input Text To Element When Ready         //input[@name="newPassword"]     jenosize03
     Input Text To Element When Ready         //input[@name="confirmNewPassword"]     jenosize04
     sleep                                    3s
     Wait Until Page Contains                 Password is not match                 ${TIME_WAIT}
     Capture Page Screenshot

TC10_Test Wrong Current Password but Correct New Password & Confirm New Password
     [Documentation]     ทดสอบเปลี่ยน Password โดยใส่ Current Password ถูก แต่ใส่ New Password และ Confirm New Password ผิด พร้อมตรวจสอบ Error Messange Password is not match
     Click Element When Ready                 //p[@class="MuiTypography-root MuiTypography-body1 css-1vcvdqw-MuiTypography-root"]
     Click Element When Ready                 //li[@id="btn_change_password"]
     Clear Text When Ready                    //input[@name="currentPassword"]
     Clear Text When Ready                    //input[@name="newPassword"]
     Clear Text When Ready                    //input[@name="confirmNewPassword"]
     Input Text To Element When Ready         //input[@name="currentPassword"]     jenosize03
     Input Text To Element When Ready         //input[@name="newPassword"]     jenosize03
     Input Text To Element When Ready         //input[@name="confirmNewPassword"]     jenosize03
     Click Element When Ready                 //button[@type="submit"]
     Click Element When Ready                 //span[@class="MuiButton-label css-8xplcm-MuiButton-label"][text()="Confirm"]
     Wait Until Page Contains                 Current password invalid              ${TIME_WAIT}
     Capture Page Screenshot

