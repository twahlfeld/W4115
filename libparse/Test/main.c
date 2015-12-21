#include <stdio.h>
#include "list.h"
#include "parse.h"

int main(int argc, char *argv[]) {
    Page *page = pageFetch("http://www.cs.columbia.edu/~sedwards/");

    NODE * first = pageFind(page, "#titlebar");


    printf("id:  %s\n",elementAttr((Element*)listHead(first), "id"));
    printf("text:  %s\n",elementText((Element*)listHead(first)));
    printf("type:  %s\n\n\n",elementType((Element*)listHead(first)));

    NODE *child_list = elementChildren(page, (Element*)listHead(first));
    Element * e = (Element*)listHead(listTail(child_list));

    printf("text first child:  %s\n",elementText(e));
    printf("type first child:  %s\n",elementType(e));
    printf("id first child:  %s\n",elementAttr(e,"id"));

    return 0;
}

