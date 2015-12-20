#include <stdio.h>
#include "parse.h"

int main(int argc, char *argv[]) {
    Page *page = fetch("http://www.google.com");
    printf("%s\n", page->url);
    printf("%s\n", page->html);

    Element **elm_list = find(page, "img");
    printf("%s\n", elm_list[0]->html);
    printf("%s\n", elm_list[0]->path);
    printf("%s\n", elm_list[1]->html);
    printf("%s\n", elm_list[1]->path);
    return 0;
}