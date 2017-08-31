#!/bin/bash

for device in device1 device2 device3
do
    if [ -f /sys/bus/iio/devices/iio:$device/scan_elements/in_temp_en ];then
        echo "read from iio sysfs"
        cat /sys/bus/iio/devices/iio:$device/scan_elements/in_temp_en
        echo "read from i2c sysfs"
        cat /sys/devices/platform/80860F41:00/i2c-0/i2c-SMO9210:00/iio:$device/scan_elements/in_temp_en
        echo "write to iio sysfs"
        echo 1 > /sys/bus/iio/devices/iio:$device/scan_elements/in_temp_en
        echo "write to i2c sysfs"
        echo 1 > /sys/devices/platform/80860F41:00/i2c-0/i2c-SMO9210:00/iio:$device/scan_elements/in_temp_en
        break
    fi
done
