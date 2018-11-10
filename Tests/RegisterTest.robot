# Author: 
#    Filip Pazdera
#
# Requirements covered: 
#    REQ_04_04
#    REQ_05_05
#    REQ_06_06

*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/BrowserKeywords.robot
Resource  ../Settings/LoginSettings.robot
Resource  ../Objects/CSFDObjects.robot
Resource  ../Keywords/CSFDCommon.robot

Test Setup  Open Browser And Maximize Window  ${browser}   ${url}
Test Teardown   Capture Screenshot And Close Browser

*** Test Cases ***

Register Exists Nickname
      Open CSFD Nav Item    ${registerNav}    ${registerUrl}
      Insert Into Text Item Field    ${registerNicknameInput}    ${usr_nickname}
      Insert Into Text Item Field    ${registerEmailInput}    ${non-existing_email}
      Execute Javascript    window.scrollTo(0,document.body.scrollHeight);
      AgreeAndClick    ${registerTandC}    ${registerNext}
      Execute Javascript    window.scrollTo(0,document.body.scrollHeight);
      AgreeAndClick    ${registerGDPR}    ${registerFinish}   
      Verify Message Element Is On Page    ${registerMsg} 
      Wait Until Page Contains    ${registerMsgNickname}  


Register Exists Email
      Open CSFD Nav Item    ${registerNav}    ${registerUrl}
      Insert Into Text Item Field    ${registerNicknameInput}    ${non_existing_nickname}
      Insert Into Text Item Field    ${registerEmailInput}    ${usr_email}
      Execute Javascript    window.scrollTo(0,document.body.scrollHeight);
      AgreeAndClick    ${registerTandC}    ${registerNext}
      Execute Javascript    window.scrollTo(0,document.body.scrollHeight);
      AgreeAndClick    ${registerGDPR}    ${registerFinish}      
      Verify Message Element Is On Page    ${registerMsg} 
      Wait Until Page Contains    ${registerMsgEmail} 

Register Non Valid Date Of Birth
      Open CSFD Nav Item    ${registerNav}    ${registerUrl}
      Insert Into Text Item Field    ${registerNicknameInput}    ${non_existing_nickname}
      Insert Into Text Item Field    ${registerEmailInput}    ${non-existing_email}
      Insert Into Text Item Field    ${registerBirthInput}    ${incorect_birth_date}
      Execute Javascript    window.scrollTo(0,document.body.scrollHeight);
      AgreeAndClick    ${registerTandC}    ${registerNext}
      Execute Javascript    window.scrollTo(0,document.body.scrollHeight);
      AgreeAndClick    ${registerGDPR}    ${registerFinish}     
      Verify Message Element Is On Page    ${registerMsg} 
      Wait Until Page Contains    ${registerMsgBirth}    
    