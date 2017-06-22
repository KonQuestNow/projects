package step_definitions;

import static org.junit.Assert.assertEquals;

import cucumber.api.java.After;
import cucumber.api.java.Before;
import org.openqa.selenium.WebDriver;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.firefox.FirefoxDriver;


public class SmokeTestSteps{

    private WebDriver driver;
    @Before
    public void before() {
        System.setProperty("webdriver.gecko.driver", "/Users/britian.hammond/Local/repos/QA/support/selenium/geckodriver");
        driver = new FirefoxDriver();
        driver.navigate().to("http://en.wikipedia.org");
    }

    @After
    public void after() {
        driver.quit();
    }

    @When("^I open seleniumframework website$")
    public void i_open_seleniumframework_website() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        driver.navigate().to("http://www.seleniumframework.com");
    }

    @Then("^I validate title and URL$")
    public void i_print_title_and_URL() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        assertEquals("Selenium Framework | Selenium, Cucumber, Ruby, Java et al.",driver.getTitle());
        assertEquals("http://www.seleniumframework.com/",driver.getCurrentUrl());
    }

}