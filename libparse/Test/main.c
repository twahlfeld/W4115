#include <stdio.h>
#include "parse.h"

int main(int argc, char *argv[]) {
    char *title = get_title("http://www.findmine.us/");
    printf("%s", title);
    return 0;
}