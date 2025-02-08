package test;

import java.net.MalformedURLException;
import java.net.URL;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.remote.MobileCapabilityType;

public class VehicleLoginTest {

    public static void main(String[] args) throws InterruptedException {

       // AndroidDriver<AndroidElement> driver;

        // Setup desired capabilities
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability(MobileCapabilityType.PLATFORM_NAME, "Android");
        caps.setCapability(MobileCapabilityType.DEVICE_NAME, "Medium Phone API 35");
        caps.setCapability("appPackage", "com.example.vehicleinsuranceclaimapp");
        caps.setCapability("appActivity", "com.example.vehicleinsuranceclaimapp.LoginActivity");
        caps.setCapability(MobileCapabilityType.AUTOMATION_NAME, "UiAutomator2");

        try {
            // Initialize the Appium driver
        	 AppiumDriver driver = new AndroidDriver(new URL("http://127.0.0.1:4723"), caps);

            // Perform addition operation
        	 WebElement num1Field = driver.findElement(By.id("com.example.vehicleinsuranceclaimapp:id/editTextEmailaddress"));
        	 System.out.println("NumField 1 : "+num1Field);
              num1Field.sendKeys("Basheer");

              WebElement num2Field = driver.findElement(By.id("com.example.vehicleinsuranceclaimapp:id/editTextPassword"));
              num2Field.sendKeys("Ahamed");

              //WebElement addButton = driver.findElement(By.id("com.example.calculatorapp:id/login_button"));
            //addButton.click();

            // Navigate to the second screen
            WebElement navigateButton = driver.findElement(By.id("com.example.vehicleinsuranceclaimapp:id/loginButton"));
            navigateButton.click();
            
            Thread.sleep(2000);
            
            WebElement taskText = driver.findElement(By.xpath("//android.widget.TextView[contains(@text,'Welcome to InsuranceClaimApp')]"));
            
            if (taskText.isDisplayed()) {
            	System.out.println("Successfully navigated to Dashboard Activity");
                System.out.println("Successfully logined into the app");
            } else {
                System.out.println("Not able to navigate!!!.");
            }

            driver.quit();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
    }
}