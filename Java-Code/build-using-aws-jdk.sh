clear
rm ./Main.class

echo "Compiling code using AWSJDK...."
docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER}) awscorrettojdk:8.21 javac ./Main.java

echo " "
echo " "

echo "Running code using AWSJDK ....."
docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER}) awscorrettojdk:8.21 java Main

