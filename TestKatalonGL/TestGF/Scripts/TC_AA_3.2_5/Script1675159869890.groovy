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

WebUI.maximizeWindow()

WebUI.navigateToUrl('http://localhost:8080/GreenLeaf_war_exploded/login.jsp')

WebUI.setText(findTestObject('Object Repository/TC_AA_3.2_5/Page_Login/input_Login_email'), 'test@gmail.com')

WebUI.setEncryptedText(findTestObject('Object Repository/TC_AA_3.2_5/Page_Login/input_Login_password'), 'HeCM15nHKBI=')

WebUI.click(findTestObject('Object Repository/TC_AA_3.2_5/Page_Login/input'))

WebUI.click(findTestObject('Object Repository/TC_AA_3.2_5/Page_Sezione utente/a_Adotta'))

WebUI.click(findTestObject('Object Repository/TC_AA_3.2_5/Page_Catalogo/a_Aggiungi al carrello'))

WebUI.click(findTestObject('Object Repository/TC_AA_3.2_5/Page_Catalogo/header_Home        Adotta        Monitoragg_ffeb68'))

WebUI.click(findTestObject('Object Repository/TC_AA_3.2_5/Page_Catalogo/i_Calcolo CO2_fa-solid fa-cart-shopping'))

WebUI.switchToWindowTitle('Carrello')

WebUI.click(findTestObject('Object Repository/TC_AA_3.2_5/Page_Carrello/img_Il modo rapido e sicuro per pagare_paypal-logo paypal-logo-paypal paypal-logo-color-white'))

WebUI.switchToWindowTitle('Accedi al tuo conto PayPal')

WebUI.setText(findTestObject('Object Repository/TC_AA_3.2_5/Page_Accedi al tuo conto PayPal/input_IT_login_email'), 'sb-pb0zp24909961@personal.example.com')

WebUI.click(findTestObject('Object Repository/TC_AA_3.2_5/Page_Accedi al tuo conto PayPal/button_Avanti'))

WebUI.setEncryptedText(findTestObject('Object Repository/TC_AA_3.2_5/Page_Accedi al tuo conto PayPal/input_Avanti_login_password'), 
    'hu8YtsgpM+zFrPTy89jjVA==')

WebUI.click(findTestObject('Object Repository/TC_AA_3.2_5/Page_Accedi al tuo conto PayPal/button_Accedi'))

WebUI.click(findTestObject('Object Repository/TC_AA_3.2_5/Page_PayPal Checkout/button_Completa lacquisto'))

WebUI.switchToWindowTitle('Homepage')

WebUI.verifyElementPresent(findTestObject('Object Repository/TC_AA_3.2_5/Page_Homepage/input_Calcolo CO2_1'), 0)

WebUI.closeBrowser()

