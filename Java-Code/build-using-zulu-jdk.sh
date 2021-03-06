clear
rm ./Main.class

echo "Compiling code using ZuluJDK...."
docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER}) zulujdk:12.0.1 javac ./Main.java

echo " "
echo "Running code using ZuluJDK....."
echo " "

docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER}) zulujdk:12.0.1 java Main

