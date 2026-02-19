
#!/bin/bash

# ---- TERMINAL 1 ----
gnome-terminal -- bash -c "
sudo apt update && sudo apt install locales

sudo apt install software-properties-common

sudo add-apt-repository universe

sudo apt update && sudo apt install curl -y

sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update && sudo apt install ros-dev-tools

sudo apt upgrade -y

sudo apt install ros-jazzy-desktop

echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc

source ~/.bashrc

printenv ROS_DISTRO

env | grep ROS

echo $ROS_DISTRO

sudo rosdep init

rosdep update

sudo apt-get install python3 python3-pip -y

sudo apt-get install ros-${ROS_DISTRO}-ros-gz -y

sudo apt-get install python3-numpy

exec bash
"

# ---- TERMINAL 2 ----
gnome-terminal -- bash -c "

ros2 launch ros_gz_sim gz_sim.launch.py gz_args:="shapes.sdf"

exec bash
"