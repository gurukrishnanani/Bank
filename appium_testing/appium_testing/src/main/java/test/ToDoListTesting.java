package test;

import java.net.MalformedURLException;
import java.net.URL;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.remote.MobileCapabilityType;

public class ToDoListTesting {

    public static void main(String[] args)  {

       // AndroidDriver<AndroidElement> driver;

        // Setup desired capabilities
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability(MobileCapabilityType.PLATFORM_NAME, "Android");
        caps.setCapability(MobileCapabilityType.DEVICE_NAME, "Medium Phone Api 35");
        caps.setCapability("appPackage", "com.example.todolist");
        caps.setCapability("appActivity", "com.example.todolist.MainActivity");
        caps.setCapability(MobileCapabilityType.AUTOMATION_NAME, "UiAutomator2");

        try {
            // Initialize the Appium driver
        	 AppiumDriver driver = new AndroidDriver(new URL("http://127.0.0.1:4723"), caps);

            // Perform addition operation
        	 WebElement addButton = driver.findElement(By.id("com.example.todolist:id/fab_add"));
             addButton.click();
             
        	 WebElement num1Field = driver.findElement(By.id("com.example.todolist:id/edit_text_task"));
        	 System.out.println("Task : "+num1Field);
              num1Field.sendKeys("appium");

              WebElement num2Field = driver.findElement(By.id("com.example.todolist:id/edit_text_task_desc"));
              num2Field.sendKeys("it is automationtesting");

              //WebElement addButton = driver.findElement(By.id("com.example.todolistapp:id/btn_add_task"));
            //addButton.click();

            // Navigate to the second screen
            WebElement navigateButton = driver.findElement(By.id("com.example.todolist:id/btn_add_task"));
            navigateButton.click();
            
           
            WebElement taskText = driver.findElement(By.xpath("//android.widget.TextView[contains(@text,'appium')]"));
            WebElement descText = driver.findElement(By.xpath("//android.widget.TextView[contains(@text,'it is automationtesting')]"));

            if (taskText.isDisplayed() && descText.isDisplayed()) {
            	System.out.println("Successfully navigated to AddTaskFragment!!!");
                System.out.println("Elements added Successfully!");
            } else {
                System.out.println("Task or Description was NOT added.");
            }

            driver.quit();

        }
        catch (MalformedURLException e) {
            e.printStackTrace();}
        
    }
}