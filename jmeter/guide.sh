# Install Java
sudo apt install openjdk-11-jdk


# Create directory
mkdir jmeter
cd jmeter

# Fetch Jmeter
wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.6.3.tgz

# Extract JMeter tgz
sudo tar -xvzf apache-jmeter-5.6.3.tgz

# Create 
mkdir /opt/jmeter

# Move jmeter
mv apache-jmeter-5.6.3 /opt/jmeter


# Install library: json-lib
# Install library: jmeter-plugins-cmn-jmeter
# Install plugin: jpgc-graphs-additional 2.0
# Install plugin: jpgc-graphs-dist 2.0
# Install plugin: jpgc-graphs-basic 2.0
# Install plugin: jpgc-graphs-vs 2.0


# Install Lib cmdrunner
wget https://repo1.maven.org/maven2/kg/apc/cmdrunner/2.3/cmdrunner-2.3.jar
mv cmdrunner-2.3.jar /opt/jmeter/lib

# Install Jmeter plugin manager
wget https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.10/jmeter-plugins-manager-1.10.jar
mv jmeter-plugins-manager-1.10.jar /opt/jmeter/lib/ext

# Make PluginsManagerCMD
java -cp /opt/jmeter/lib/ext/jmeter-plugins-manager-1.10.jar org.jmeterplugins.repository.PluginManagerCMDInstaller


# Install plugins
# Windows wsl
./PluginsManagerCMD.sh install-for-jmx /mnt/c/Users/User/Desktop/dosty-jmeter-non-gui.jmx

# Ubuntu
/opt/jmeter/bin/PluginsManagerCMD.sh install-for-jmx /root/jmeter/templates/dosty-jmeter-non-gui.jmx



# Start Benchmark

# Windows wsl
/opt/jmeter/bin/jmeter -n -t /mnt/c/Users/User/Desktop/dosty-jmeter-non-gui.jmx -l /mnt/c/Users/User/Desktop/result.csv

# Ubuntu
/opt/jmeter/bin/jmeter -n -t /root/jmeter/templates/dosty-jmeter-non-gui.jmx -l /root/jmeter/results/result-1.csv


# Generate Dashboard

# Windows wsl
/opt/jmeter/bin/jmeter -g /mnt/c/Users/User/Desktop/result.csv -o /mnt/c/Users/User/Desktop/test/dashboard

# Ubuntu
/opt/jmeter/bin/jmeter -g /root/jmeter/results/result-1.csv -o /root/jmeter/dashboards/result-1


# Compress result dashboard
tar -czvf /root/jmeter/dashboards/result-1.tar.gz /root/jmeter/dashboards/result-1
