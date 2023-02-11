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

WebUI.navigateToUrl('http://localhost:8080/GreenLeaf_war_exploded/monitoraggio.jsp')

WebUI.click(findTestObject('Object Repository/TC_S_2.4_3/Page_Monitoraggio/input_Calcolo CO2_anno'))

WebUI.click(findTestObject('Object Repository/TC_S_2.4_3/Page_Monitoraggio/div_2024'))

WebUI.click(findTestObject('Object Repository/TC_S_2.4_3/Page_Monitoraggio/div_Cerca'))

WebUI.verifyElementNotVisible(findTestObject('Object Repository/TC_S_2.4_4/Page_Monitoraggio/div_Campania                    Percentuale_b1a66c'))

WebUI.closeBrowser()

