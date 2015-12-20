#include <stdio.h>
#include "parse.h"

int main(int argc, char *argv[]) {
    Page *page = fetch("http://www.cs.columbia.edu/~sedwards/");
    printf("%s\n", page->url);
    printf("%s\n", page->html);

    Element **elm_list = find(page, "img");
    printf("%s\n", elm_list[0]->html);
    printf("%s\n", elm_list[0]->path);


    char * attr = NULL;
    attr = elementAttr(elm_list[0], "alt");

    printf("%s\n", elm_list[1]->html);
    printf("%s\n", elm_list[1]->path);
    return 0;
}