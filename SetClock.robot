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
click add alarm
        Click Element                locator=//android.widget.ImageButton[@content-desc="Add alarm"]
click hour number
        Click Element                locator=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="3"]
Click minute number
        click Element                locator=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="0"]

Click OK button
        Click Element                locator=//android.widget.Button[@resource-id="android:id/button1"]
Checked Repeat
        Wait Until Element Is Visible    locator=//android.view.ViewGroup[@content-desc="3:00 PM Alarm"]
        Click Element                locator=//android.widget.CheckBox[@resource-id="com.google.android.deskclock:id/repeat_onoff"]
Click the day
        Click Element                locator=//android.widget.CheckBox[@content-desc="Monday"]
verify new alarm successfully created
        Element Should Be Visible    locator=//android.widget.TextView[@content-desc="3:00 PM"]
        Element Should Be Enabled    locator=//android.widget.CheckBox[@content-desc="Monday"]
Close Applications
        Close Application
*** Test Cases ***
Create new alarm clock
    Open Clock Application
    click add alarm
    click hour number
    Click minute number
    Click Ok button
    Checked Repeat
    Click the day
    verify new alarm successfully created
    Close Applications
