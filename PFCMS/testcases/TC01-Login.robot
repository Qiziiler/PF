*** Settings ***
Resource          ${CURDIR}/../resources/testdata/testdata.robot
Resource          ${CURDIR}/../resources/variables/variable_config.robot
Resource          ${CURDIR}/../resources/variables/variable_login.robot
Resource          ${CURDIR}/../keywords/common/common_keywords.robot
Suite Teardown    Close All Browsers


*** Test Cases ***
TC01_Login Success and Verify Homepage
     [Documentation]   เข้าสู่ระบบสำเร็จและตรวจสอบความถูกต้องหน้าแรก
     Open Browser      ${URL}      ${BROWSER}
     Set Window Size    1920   1080            
     Input Text To Element When Ready          ${XPATH_FIELD_USERNAME}       ${EMAIL}           
     Input Text To Element When Ready          ${XPATH_FIELD_PASSWORD}       ${PASSWORD}     
     Click Element When Ready                  ${XPATH_BUTTON_LOGIN}
     Wait Until Page Contains                  Sales Dashboard                               ${TIME_WAIT}  
     Capture Page Screenshot
   

TC02_Sign Out Accounts
     [Documentation]     ออกจากระบบสำเร็จ
     Click Element When Ready                  //div[@class="MuiAvatar-root MuiAvatar-circular css-ze2gcq-MuiAvatar-root"]//img
     Click Element When Ready                 //button[@type="button"]//span[text()="Logout"]
     Wait Until Page Contains                  Login
     Capture Page Screenshot



TC03_Login with correct Username and wrong Password for Verify text massage
     [Documentation]     ทดสอบ Login ด้วย Username ที่ถูก แต่ Password ที่ผิดพร้อมตรวจสอบข้อความแจ้งเตือน Email or password is wrong
     Clear Text When Ready                       ${XPATH_FIELD_USERNAME}
     Clear Text When Ready                       ${XPATH_FIELD_PASSWORD}
     Input Text To Element When Ready            ${XPATH_FIELD_USERNAME}       ${EMAIL}
     Input Text To Element When Ready            ${XPATH_FIELD_PASSWORD}       54654
     Click Element When Ready                    ${XPATH_BUTTON_LOGIN}
     Wait Until Page Contains                    Email or password is wrong                               ${TIME_WAIT}
     Capture Page Screenshot



TC04_Login with wrong Username and correct Password for Verify text massage
     [Documentation]     ทดสอบ Login ด้วย Username ที่ไม่ใช่ format email แต่ Password ที่ถูกพร้อมตรวจสอบข้อความแจ้งเตือน Email invalid
     Clear Text When Ready                       ${XPATH_FIELD_USERNAME}
     Clear Text When Ready                       ${XPATH_FIELD_PASSWORD}
     Input Text To Element When Ready            ${XPATH_FIELD_USERNAME}       EiEiAuAu
     Input Text To Element When Ready            ${XPATH_FIELD_PASSWORD}       ${PASSWORD}
     Click Element When Ready                    ${XPATH_BUTTON_LOGIN}
     Wait Until Page Contains                    Email invalid                               ${TIME_WAIT}
     Capture Page Screenshot


TC05_Verify Forgot password?
     [Documentation]     ตรวจสอบหน้า Forgot password
     Click Element When Ready                   //*[@href="/forgot-password"]  
     Wait Until Page Contains                   Forgot your password?
     Capture Page Screenshot

TC06_Test input Empty Email in text box and click Reset Password
     [Documentation]     ทดสอบไม่กรอก Email แล้วกด Reset Password พร้อมตรวจสอบข้อความแจ้งเตือน Email is required
     Clear Text When Ready                       ${XPATH_FIELD_USERNAME}
     Click Element When Ready                    //button[@type="submit"]                                  
     Wait Until Page Contains                    Email is required
     Capture Page Screenshot

TC07_Test input Text (not format Email) in text box and click Reset Password 
     [Documentation]     ทดสอบกรอกข้อความที่ไม่ใช่ Email แล้วกด Reset Password พร้อมตรวจสอบข้อความแจ้งเตือน Enter a valid email
     Clear Text When Ready                       ${XPATH_FIELD_USERNAME}
     Input Text To Element When Ready            ${XPATH_FIELD_USERNAME}       EiEiAuAu
     Click Element When Ready                    //button[@type="submit"] 
     Wait Until Page Contains                    Enter a valid email
     Capture Page Screenshot

TC08_Test input wrong Email in text box and click Reset Password 
     [Documentation]     ทดสอบกรอก Email ที่ไม่มีในระบบแล้วกด Reset Password พร้อมตรวจสอบข้อความแจ้งเตือน Account not found
     Clear Text When Ready                       ${XPATH_FIELD_USERNAME}
     Input Text To Element When Ready            ${XPATH_FIELD_USERNAME}       EiEiAuAu@gmail.com
     Click Element When Ready                    //button[@type="submit"] 
     Wait Until Page Contains                    Account not found
     Capture Page Screenshot

TC09_Test input correct Email in text box and click Reset Password 
     [Documentation]     ทดสอบกรอก Email ที่ถูกต้องแล้วกด Reset Password พร้อมตรวจสอบหน้า Reset your password
     Clear Text When Ready                       ${XPATH_FIELD_USERNAME}
     Input Text To Element When Ready            ${XPATH_FIELD_USERNAME}       ${EMAIL}
     Click Element When Ready                    //button[@type="submit"] 
     Wait Until Page Contains                    Reset your password
     Capture Page Screenshot

TC10_Test send code via email
     [Documentation]     ทดสอบส่ง otp ไปที่ email ของ User ผู้ใช้งานเพื่อทำการเปลี่ยน password
     Click Element When Ready                    //button[@type="submit"]
     Wait Until Page Contains                    Please check your email!
     Capture Page Screenshot

TC11_Test send code via SMS
     [Documentation]     ทดสอบส่ง otp ไปที่ email ของ User ผู้ใช้งานเพื่อทำการเปลี่ยน password
     Click Element When Ready                    //span[@class="MuiButton-startIcon MuiButton-iconSizeSmall css-y6rp3m-MuiButton-startIcon"]
     Click Element When Ready                    //span[@class="MuiTypography-root MuiTypography-body1 MuiFormControlLabel-label css-20av09-MuiTypography-root"][text()="Send code via sms +66 *****0003"]
     Click Element When Ready                    //button[@type="submit"]
     Wait Until Page Contains                    Please check your SMS!
     Capture Page Screenshot