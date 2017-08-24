#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
int main() {
    int fp = -1;
    //char *buffer_access = "/sys/devices/platform/80860F41:00/i2c-0/i2c-SMO8A90:00/iio:device1/scan_elements/in_accel_x_en";
    char *buffer_access = "/sys/bus/iio/devices/iio:device1/scan_elements/in_accel_x_en";
	/* Attempt to open non blocking the access dev */
    fp = open(buffer_access, O_RDONLY | O_NONBLOCK);
    if (fp == -1) { /* TODO: If it isn't there make the node */
        fprintf(stderr, "Failed to open %s\n", buffer_access);
    } else
        close(fp);

    printf("done!!!\n");
}
