*** Keywords ***
Click Element When Ready
    [Arguments]     ${Element}
    Wait Until Element Is Visible      ${Element}
    FOR    ${index}    IN RANGE    1    10
        ${result_msg}=      Run Keyword And Ignore Error    Click Element       ${Element}
        ${err_msg}=         Convert To String       ${result_msg[1]}
        ${is_success}=                  Run Keyword And Return Status    Should Be Equal    ${err_msg}      None
        ${is_not_loading_error}=        Run Keyword And Return Status    Should Not Contain    ${err_msg}    Other element would receive the click:
        ${is_not_loading_error_js}=     Run Keyword And Return Status    Should Not Contain    ${err_msg}    JavascriptException: Message: javascript error: Error is not a constructor
        ${result}=  Evaluate    ${is_not_loading_error} and ${is_not_loading_error_js}
        Exit For Loop If        ${is_success} or ${result}
        Sleep   3s
    END
    Should Be True      ${is_success}   msg=Unable to click the element after 10 retry


Input Text To Element When Ready
    [Arguments]     ${location}     ${text}     ${clear}=false
    Wait Until Element Is Visible    ${location}
    FOR    ${index}    IN RANGE    1    10
        ${result_msg}=      Run Keyword And Ignore Error    Input Text      ${location}     ${text}     clear=${clear}
        ${err_msg}=         Convert To String       ${result_msg[1]}
        ${is_success}=                  Run Keyword And Return Status    Should Be Equal        ${err_msg}      None
        ${is_not_loading_error}=        Run Keyword And Return Status    Should Not Contain     ${err_msg}      invalid element state
        Exit For Loop If        ${is_success} or ${is_not_loading_error}
    END
    Should Be True      ${is_success}   msg=Unable to input text to element after 10 retry         


Clear Text When Ready
    [Documentation]    Clear text in element when element is visible
    [Arguments]        ${locator}
    Wait Until Element Is Visible    ${locator}    ${TIME_WAIT}
    Press Keys                       ${locator}    CTRL+a+BACKSPACE


Get Text From Element When Ready
    [Arguments]     ${element_locator}
    Log     ${element_locator}
    Wait Until Page Contains Element        ${element_locator}
    Sleep   2s
    Run Keyword And Ignore Error    Scroll Element Into View        ${element_locator}
    Wait Until Element Is Visible           ${element_locator}
    ${text}=    Get Text                    ${element_locator}
    [Return]    ${text}


Get Value From Element When Ready
    [Arguments]     ${element_locator}
    Log     ${element_locator}
    Wait Until Page Contains Element        ${element_locator}
    Sleep   2s
    Run Keyword And Ignore Error    Scroll Element Into View                ${element_locator}
    Wait Until Element Is Visible           ${element_locator}
    ${value}=    Get Value                   ${element_locator}
    [Return]    ${value}