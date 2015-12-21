#include <stdio.h>
#include "../libparse/list.h"
#include "../libparse/parse.h"

int main() {
    Page *page = pageFetch("http://www.cs.columbia.edu/~sedwards/");
    //NODE *child_list;
    NODE *first = pageFind(page, "#titlebar");
    Element *e = listHead(first);
    char *s = elementAttr(e, "id");
    fprintf(stdout, "id:  %s\n", s);
    /*s = elementText(e);
    print(stdout, "text:  %s\n", s);
    s = elementType(e);
    print(stdout, "type:  %s\n\n\n", s);

    child_list = elementChildren(page, e);
    child_list = listTail(child_list);
    e = listHead(child_list);

    s = elementText(e);
    print(stdout, "text first child:  %s\n", s);
    s = elementType(e);
    print(stdout, "type first child:  %s\n", s);
    s = elementAttr(e, "id");
    print(stdout,"id first child:  %s\n", s);  */

    return 0;
}

