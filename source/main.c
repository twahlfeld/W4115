//
//  main.c
//  TED_INTERFACE
//
//  Created by Gideon Mendels on 11/30/15.
//  Copyright © 2015 Gideon Mendels. All rights reserved.
//

#include <stdio.h>

typedef struct{
    void * key;
    void * val;
} Pair;

typedef struct{
    
    void * next;
    void * data;
} Node;


typedef struct
{
    int response;
    char * url;
    char * html;
    Node * first_child;
} Page;


typedef struct
{
    char * id;
    char * class;
    char * html;
    char * text;
    char * type;
    Node * attrs;
    Node * first_child;
} Element;


Page get(char * url, char * userAgent);
Node* find(Page* page, char * query);

int main(int argc, const char * argv[]) {
    
    
    Page p = get("something","something");
    Node* n = find (&p,"something");
    printf("first child html: %s", ((Element*)n->data)->html);
    
    return 0;
}



Node* find(Page* page, char * query){

    return (page)->first_child;
    
}

Page get(char * url, char * userAgent){
    
    /**
     <html>
     <body>
     <div class="aClass" id="aId" style="float:left"> text </div>
     </body>
     <html>
     */
    
    //build basic children
    Pair p1 = {"class","aClass"};
    Pair p2 = {"id","aId"};
    Pair p3 = {"style","float:left"};
    Node n3 = {NULL,&p3};
    Node n2 = {&n3,&p2};
    Node n1 = {&n2,&p1};
    
    Element div = {"aId","aClass","<div class=\"aClass\" id=\"aId\" style=\"float:left\"> text </div>","text","div",&n1,NULL};
    Node bodyChild = {NULL,&div};
    Element body = {NULL,NULL,"<body><div class=\"aClass\" id=\"aId\" style=\"float:left\"> text </div></body>",NULL,"body",NULL,&bodyChild};
    Node htmlChild = {NULL,&body};
    Element html = {NULL,NULL,"<html><body><div class=\"aClass\" id=\"aId\" style=\"float:left\"> text </div></body></html>",NULL,"html",NULL,&htmlChild};
    Node pageChild = {NULL,&html};
    Page p = {200, url, html.html, &pageChild};
    
    return p;
}



