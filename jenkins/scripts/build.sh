echo $(java -version)
echo $(./gradlew -v)
rm -rf ./build
./gradlew clean build
ls ./build