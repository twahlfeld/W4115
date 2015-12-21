#include <stdio.h>
#include "parse.h"

int main(int argc, char *argv[]) {



    Page *page = fetch("http://www.cs.columbia.edu/~sedwards/");
//    printf("%s\n", page->url);
//    printf("%s\n", page->html);

    Element **elm_list = find(page, "#titlebar");
    printf("id:  %s\n",elementAttr(elm_list[0],"id"));
    printf("text:  %s\n",elementText(elm_list[0]));
    printf("type:  %s\n",elementType(elm_list[0]));

    Element **child_list = elementChildren(page, elm_list[0]);
    printf("id first child:  %s\n",elementAttr(child_list[1],"id"));
    printf("text first child:  %s\n",elementText(child_list[1]));
    printf("type first child:  %s\n",elementType(child_list[1]));

    return 0;
}