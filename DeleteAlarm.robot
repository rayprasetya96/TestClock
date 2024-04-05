*** Settings ***
Library    AppiumLibrary
library    XML
Library    OperatingSystem

*** Variables ***


*** Keywords ***
Open clock Application
        Open Application       remote_url=http://localhost:4723/wd/hub    
        ...                     platformName=android    
        ...                     platformVersion=9.0    
        ...                     deviceName=Pixel 2 XL API 34    
        ...                     appium:apppackage=com.example.myapplication    
        ...                     appium:mainactivity=com.example.myapplication.mainactivity
Click Existing alarm
    Click Element At Coordinates    coordinate_X=833    coordinate_Y=1512
Click delete button
    Click Element                        locator=//android.widget.Button[@resource-id="com.google.android.deskclock:id/delete"]
verify existing alarm is deleted 
    Page Should Not Contain Element      locator=//android.widget.TextView[@content-desc="3:00 PM"]
Close Applications
        Close Application
*** Test Cases ***
Delete Existing alarm clock
    Open Clock Application
    Click Existing alarm
    Click delete button
    verify existing alarm is deleted 
    Close Applications
