/* Tool to read values from a modbus device and print every byte read to stdout
 *
 * To compile execute cc `pkg-config --cflags --libs libmodbus` readModbus.c -o readModbus
 *
 * @param d Device to open, default /dev/ttyr00
 * @param f globalArgs.function (0x01: read coil status, 0x02: read input status, 0x03: read holding registers, 0x04: read input registers
 * @param a globalArgs.address to read
 * @param s globalArgs.size to read in bytes
 * (c) 2013 Matthias Fechner <idefix@fechner.net>
 */

#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <modbus.h>
#include <string.h>

#include <mylib.h>
struct globalArgs_t globalArgs;

int convertBigArrayToString(char *returnValue, int type, uint16_t *value) {
    switch(type) {
    case FLOAT:
        if(globalArgs.verbose) printf("Found FLOAT\n");
        int total;
        float real;
        total=((value[1] << 16) + value[0]);
        real=*((float*)&total);

        snprintf(returnValue, 20, "%f", real);
        return 0;
    case DATETIME:
        if(globalArgs.verbose) printf("Found DATETIME\n");
        snprintf(returnValue, 20, "%04d-%02d-%02d %02d:%02d:%02d", value[5]+1900, value[4]+1, value[3], value[2], value[1], value[0]);
        return 0;
    case INT:
        if(globalArgs.verbose) printf("Found INT\n");
        snprintf(returnValue, 20, "%d", value[0]);
        return 0;
    case TIME:
        if(globalArgs.verbose) printf("Found TIME\n");
        snprintf(returnValue, 6, "%02d:%02d", value[0]>>8, value[0]&0xFF);
        return 0;
    case BYTE:
        if(globalArgs.verbose) printf("Found Byte\n");
        snprintf(returnValue, 2, "%d", value[0]&0xFF);
        return 0;
    case STRING:
        if(globalArgs.verbose) printf("Found String\n");
        int i;
        char tempString[2];
        for (i=0; i<globalArgs.size; i++) {
            snprintf(tempString, 2, "%c", value[i]&0xFF);
            strcat(returnValue, tempString);
            snprintf(tempString, 2, "%c", value[i]>>8);
            strcat(returnValue, tempString);
        }
        return 0;
    }

    return -1;
}

int convertSmallArrayToString(char *returnValue, int type, uint8_t *value) {
    switch(type) {
    case BOOL:
        if(globalArgs.verbose) printf("Found BOOL\n");
        snprintf(returnValue, 20, "%d", value[0]);
        return 0;
    case BITS:
        if(globalArgs.verbose) printf("Found Bits\n");
        int i;
        uint16_t bitValue=0;

        for (i=0;i<globalArgs.size; i++) {
            bitValue |= ((uint16_t)value[i] << i);
        }
        snprintf(returnValue, 8, "%d", bitValue);

        return 0;
    }
    return -1;
}

int main(int argc, char **argv) {
    modbus_t *ctx;
    uint8_t *smallArray;
    uint16_t *bigArray;
    int rc;
    int i;
    char output[40];

    globalArgs.deviceName = "/dev/ttyr00";
    globalArgs.verbose = 0;
    globalArgs.type = 0;
    readParameter(argc, argv);

    if (globalArgs.verbose) {
        printf("Allocate %ld bytes to hold data\n", (20 * sizeof(*smallArray)  + 1) +(20 * sizeof(*bigArray) +1));
    }
    smallArray = (uint8_t *) malloc(sizeof(*smallArray) * 20 + 1);
    if(smallArray == NULL) {
        fprintf(stderr, "Cannot reserve memory to store bytes received\n");
        exit(EXIT_FAILURE);
    }
    bigArray = (uint16_t *) malloc(sizeof(*bigArray) * 20 + 1);
    if(bigArray == NULL) {
        fprintf(stderr, "Cannot reserve memory to store bytes recieved\n");
        free(smallArray);
        exit(EXIT_FAILURE);
    }

    ctx = modbus_new_rtu(globalArgs.deviceName, 9600, 'N', 8, 1);
    if (ctx == NULL) {
        fprintf(stderr, "Unable to create the libmodbus context\n");
        free(smallArray);
        free(bigArray);
        exit(EXIT_FAILURE);
    }
    if (globalArgs.verbose)
        modbus_set_debug(ctx, 1);

    if (modbus_connect(ctx) == -1) {
        fprintf(stderr, "Connection failed: %s\n", modbus_strerror(errno));
        modbus_free(ctx);
        free(smallArray);
        free(bigArray);
        exit(EXIT_FAILURE);
    }

    modbus_set_slave(ctx, 1);

    switch (globalArgs.function) {
    case 0:
        rc = modbus_report_slave_id(ctx, smallArray);
        break;
    case 1:
        rc = modbus_read_bits(ctx, globalArgs.address, globalArgs.size, smallArray);
        break;
    case 2:
        rc = modbus_read_input_bits(ctx, globalArgs.address, globalArgs.size, smallArray);
        break;
    case 3:
        rc = modbus_read_registers(ctx, globalArgs.address, globalArgs.size, bigArray);
        break;
    case 4:
        rc = modbus_read_input_registers(ctx, globalArgs.address, globalArgs.size, bigArray);
        break;
    default:
        fprintf(stderr, "No function defined, do not read anything\n");
        exit(EXIT_FAILURE);
    }

    if (rc == -1) {
        fprintf(stderr, "Read register failed %s\n", modbus_strerror(errno));
        modbus_close(ctx);
        modbus_free(ctx);
        free(smallArray);
        free(bigArray);
        exit(EXIT_FAILURE);
    }

    if (globalArgs.function == 0 || globalArgs.function == 1 || globalArgs.function == 2) {
        for (i = 0; i < rc; i++) {
            if(globalArgs.verbose) printf("reg[%d]=%d (0x%X)\n", i, smallArray[i], smallArray[i]);
        }
        convertSmallArrayToString(output, globalArgs.type, smallArray);
        printf("%s\n", output);

    } else {
        for (i = 0; i < rc; i++) {
            if(globalArgs.verbose) printf("reg[%d]=%d (0x%X)\n", i, bigArray[i], bigArray[i]);
        }
        convertBigArrayToString(output, globalArgs.type, bigArray);
        printf("%s\n", output);
    }

    modbus_close(ctx);
    modbus_free(ctx);
    free(smallArray);
    free(bigArray);
    exit(EXIT_SUCCESS);
}
