#include <stdio.h>
#include "parse.h"
#include "list.h"

void listPrint(NODE *pS);

int main(int argc, char *argv[]) {
//    Page *page = pageFetch("http://www.cs.columbia.edu/~sedwards/");
////    printf("%s\n", page->url);
////    printf("%s\n", page->html);
//
//    Element **elm_list = pageFind(page, "#titlebar");
//    printf("id:  %s\n",elementAttr(elm_list[0], "id"));
//    printf("text:  %s\n",elementText(elm_list[0]));
//    printf("type:  %s\n",elementType(elm_list[0]));
//
//    Element **child_list = elementChildren(page, elm_list[0]);
//    printf("id first child:  %s\n",elementAttr(child_list[1],"id"));
//    printf("text first child:  %s\n",elementText(child_list[1]));
//    printf("type first child:  %s\n",elementType(child_list[1]));


    NODE * first = listNew();
    listAddLast(first, "a");
    listAddLast(first, "b");
    listAddLast(first, "c");
    listAddLast(first, "c");
    listAddLast(first, "d");
    listAddLast(first, "e");
    listPrint(first);
    printf("\n");
    list_remove(first,3);

    listPrint(first);
    printf("\n");

    NODE * newFirst = listNew();
    NODE * f = listAddLast(newFirst, "f");
    listAddAfter(f,"G");
    listAddLast(newFirst, "h");
    listConcate(first,newFirst);
    listPrint(first);
    printf("\n");
    listSet(f,"F Modified");
    listPrint(first);


    printf("should be a: %s\n",listHead(first));
    printf("should be b: %s\n",listHead(listTail(first)));
    return 0;
}

