echo $(java -version)
echo $(./gradlew -v)
./gradlew clean compileJava compileTestJava --info