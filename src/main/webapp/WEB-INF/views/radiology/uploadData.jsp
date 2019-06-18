<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

const {Builder, By, until} = require('selenium-webdriver');
const test = require('selenium-webdriver/testing');

describe('Google Search', function() {
  let driver;

  test.before(function() {
    driver = new Builder().forBrowser('firefox').build();
  });

  test.it('example', function theTestFunction() {
    driver.get('http://www.google.com/ncr');                          // (1)
    driver.findElement(By.name('q')).sendKeys('webdriver');           // (2)
    driver.findElement(By.name('btnK')).click();                      // (3)
    driver.wait(until.titleIs('webdriver - Google Search'), 1000);    // (4)
  });

  test.after(function() {
    driver.quit();
  });
});

</script>

</body>
</html>