
package:
	mvn package

clean:
	mvn clean
	rm -rf ccc-*.* log-*.* web-*.* main-*.* *.main-*.* *~ target


test: package
	java -jar target/CopInfoTransformer-*-fat.jar cop-example.xml ccc 0.0.0-a01 false
	java -jar target/CopInfoTransformer-*-fat.jar cop-example.xml log 0.0.0-a01 false
	java -jar target/CopInfoTransformer-*-fat.jar cop-example.xml web 0.0.0-a01 false
	java -jar target/CopInfoTransformer-*-fat.jar cop-example.xml main 0.0.0-a01 false

test-encrypt: package
	java -jar target/CopInfoTransformer-*-fat.jar cop-example.xml ccc 0.0.0-a01 true
	java -jar target/CopInfoTransformer-*-fat.jar cop-example.xml log 0.0.0-a01 true
	java -jar target/CopInfoTransformer-*-fat.jar cop-example.xml web 0.0.0-a01 true
	java -jar target/CopInfoTransformer-*-fat.jar cop-example.xml main 0.0.0-a01 true
