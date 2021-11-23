*** Settings ***
Library          SeleniumLibrary
Library          String
Library          FakerLibrary

*** Variables ***
${BROWSER}           headlesschrome
# ${BROWSER}           Chrome
${URL}               https://pf.zeus.jenosize.dev/
${TIME_WAIT}         8s
