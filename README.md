# CollabCopy
Homepage: http://localhost:8080/app/index
Access config browser: http://localhost:8080/app/config-browser/index
Using JAVA 11 for MAVEN compiler: Amazon Corretto jdk11.0.14_10 because 17 produces error [will have to check]

Need to test:
1) Change scroll back buffer to 10000 for debugging (try mvn jetty:run without making this change and you will not be able to see when you made the command in the terminal when you scroll back to the current limit) 
https://stackoverflow.com/questions/39881395/visual-studio-code-scroll-back-buffer
2)
