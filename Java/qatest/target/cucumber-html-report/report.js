$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("SmokeTest.feature");
formatter.feature({
  "line": 1,
  "name": "Access seleniumframework.com website",
  "description": "Use selenium java with cucumber-jvm and navigate to website",
  "id": "access-seleniumframework.com-website",
  "keyword": "Feature"
});
formatter.before({
  "duration": 2968795880,
  "status": "passed"
});
formatter.scenario({
  "line": 4,
  "name": "Print title, url",
  "description": "",
  "id": "access-seleniumframework.com-website;print-title,-url",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 5,
  "name": "I open seleniumframework website",
  "keyword": "When "
});
formatter.step({
  "line": 6,
  "name": "I validate title and URL",
  "keyword": "Then "
});
formatter.match({
  "location": "SmokeTestSteps.i_open_seleniumframework_website()"
});
formatter.result({
  "duration": 5422152313,
  "status": "passed"
});
formatter.match({
  "location": "SmokeTestSteps.i_print_title_and_URL()"
});
formatter.result({
  "duration": 12682024,
  "status": "passed"
});
formatter.after({
  "duration": 134460569,
  "status": "passed"
});
});