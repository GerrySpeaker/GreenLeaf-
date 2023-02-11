import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static com.kms.katalon.core.testobject.ObjectRepository.findWindowsObject
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testng.keyword.TestNGBuiltinKeywords as TestNGKW
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows
import internal.GlobalVariable as GlobalVariable
import org.openqa.selenium.Keys as Keys

WebUI.openBrowser('')

WebUI.navigateToUrl('http://localhost:8080/GreenLeaf_war_exploded/login.jsp')

WebUI.setText(findTestObject('Object Repository/TC_AA_3.2_2/Page_Login/input_Login_email'), 'test@gmail.com')

WebUI.setEncryptedText(findTestObject('Object Repository/TC_AA_3.2_2/Page_Login/input_Login_password'), 'WPm1XOaHeHVZWuJvBKwjwkHx9TkxmmZB')

WebUI.click(findTestObject('Object Repository/TC_AA_3.2_2/Page_Login/input'))

WebUI.verifyElementPresent(findTestObject('Object Repository/TC_AA_3.2_2/Page_Login/p_Credenziali errate, riprova'), 0)

WebUI.closeBrowser()

