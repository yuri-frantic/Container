# Начнём с базового образа ROS (замените humble на желаемую версию, если это необходимо)
FROM osrf/ros:humble-desktop
# Задаём переменную окружения, чтобы пользователь не участвовал в установке (выбор клавиатуры и прочее)
ENV DEBIAN_FRONTEND=noninteractive
#Копируем мой скрипт
COPY ./script.sh ./app/my_script.sh

# Установим необходимые пакеты
RUN apt update && apt install -y \
xpra \
xterm \
netcat \
net-tools \
nano \
ros-$ROS_DISTRO-turtlebot3* \
ros-humble-rmw-cyclonedds-cpp
# Добавим настройки переменных окружения в .bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc \
&& echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> ~/.bashrc \
&& echo "export TURTLEBOT3_MODEL=waffle" >> ~/.bashrc
# Зададим стартовую команду для контейнера
CMD ["bash"]

