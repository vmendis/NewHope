# Build: 
# Run: docker run --rm -p 8181:8080 calculator
# Access: Access the web app at http://localhost:8181/api/calculator/ping in browser.

FROM zulujdk:12.0.1

WORKDIR /
ADD target/my-app-1.0-SNAPSHOT.jar my-app.jar

EXPOSE 8080

CMD java -jar my-app.jar


