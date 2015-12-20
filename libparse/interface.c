//
//  main.c
//  TED_INTERFACE
//
//  Created by Gideon Mendels on 11/30/15.
//  Copyright © 2015 Gideon Mendels. All rights reserved.
//
#include <stdio.h>
#include "cJson.h"
#include <glib.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <float.h>
#include <limits.h>
#include <ctype.h>


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

 const char *ep;


Page get(char * url, char * userAgent);
Node* find(Page* page, char * query);

/* Page */
//uses get first child
//anything else is in memory

/* Element */
char * getID(char * internal_id, char * html);
char * getClass(char * internal_id, char * html);
char * getHtml(char * internal_id, char * html); //inner HTML
char * getText(char * internal_id, char * html);
char * getType(char * internal_id, char * html);
char * getAttribute(char * internal_id, char * html, char * attr_name)
Element * getFirstChild(char * internal_id, char * html)



        int main(int argc, const char * argv[]) {
    
//    char * html = "{\"type\":\"HTML\",\"content\":[{\"type\":\"HEAD\",\"content\":[\"\n\",{\"type\":\"META\",\"attributes\":{\"http-equiv\":\"Content-Type\",\"content\":\"text/html; charset=iso-8859-1\"}},\"\n\",{\"type\":\"TITLE\",\"content\":[\"Prof. Stephen A. Edwards\"]},\"\n\",{\"type\":\"LINK\",\"attributes\":{\"rel\":\"stylesheet\",\"type\":\"text/css\",\"href\":\"sedwards.css\"}},\"\n\"]},\"\n\",{\"type\":\"BODY\",\"content\":[\"\n\",{\"type\":\"DIV\",\"content\":[\"\n\",{\"type\":\"A\",\"content\":[{\"type\":\"IMG\",\"attributes\":{\"src\":\"icons/cscu-logo.png\",\"width\":\"100\",\"height\":\"100\",\"alt\":\"CS@CU Logo\"}}],\"attributes\":{\"href\":\"http://www.cs.columbia.edu/\"}},{\"type\":\"A\",\"content\":[{\"type\":\"H1\",\"content\":[\"Stephen A. Edwards\"]}],\"attributes\":{\"href\":\"index.html\"}},{\"type\":\"H2\",\"content\":[\"Home\"]},\"\n\"],\"attributes\":{\"id\":\"titlebar\"}},\"\n\",{\"type\":\"DIV\",\"content\":[{\"type\":\"UL\",\"content\":[\"\n\",{\"type\":\"LI\",\"content\":[{\"type\":\"A\",\"content\":[\"Home\"],\"attributes\":{\"href\":\"index.html\"}}]},\"\n\",{\"type\":\"LI\",\"content\":[{\"type\":\"A\",\"content\":[\"Publications\"],\"attributes\":{\"href\":\"publications.html\"}}]},\"\n\",{\"type\":\"LI\",\"content\":[{\"type\":\"A\",\"content\":[\"Presentations\"],\"attributes\":{\"href\":\"presentations.html\"}}]},\"\n\",{\"type\":\"LI\",\"content\":[{\"type\":\"A\",\"content\":[\"Software\"],\"attributes\":{\"href\":\"software.html\"}}]},\"\n\",{\"type\":\"LI\",\"content\":[{\"type\":\"A\",\"content\":[\"Classes\"],\"attributes\":{\"href\":\"classes.html\"}}]},\"\n\",{\"type\":\"LI\",\"content\":[{\"type\":\"A\",\"content\":[\"Personal\"],\"attributes\":{\"href\":\"personal.html\"}}]},\"\n\"]}],\"attributes\":{\"id\":\"navigation\"}},\"\n\",{\"type\":\"DIV\",\"content\":[{\"type\":\"TABLE\",\"content\":[{\"type\":\"TBODY\",\"content\":[{\"type\":\"TR\",\"content\":[\"\n\",{\"type\":\"TD\",\"content\":[\"\n\",{\"type\":\"A\",\"content\":[{\"type\":\"IMG\",\"attributes\":{\"src\":\"images/edwards-fishburger-small.jpg\",\"alt\":\"Stephen A. Edwards\",\"width\":\"150\",\"height\":\"218\"}}],\"attributes\":{\"href\":\"photos/mcdonalds-2006/\"}},{\"type\":\"H1\",\"content\":[\"Contact Information\"]},\"\n\",{\"type\":\"P\",\"content\":[{\"type\":\"A\",\"content\":[\"sedwards@cs.columbia.edu\"],\"attributes\":{\"href\":\"mailto:sedwards@cs.columbia.edu\"}}]},\"\n\",{\"type\":\"P\",\"content\":[\"+1 212 939 7019\"]},\"\n\",{\"type\":\"P\",\"content\":[\"+1 212 666 0140 (fax)\"]},\"\n\",{\"type\":\"P\",\"content\":[\"462 Computer Science Building\"]},\"\n\",{\"type\":\"P\",\"content\":[\"1214 Amsterdam Ave MC 0401\",{\"type\":\"BR\"},\"\n\t    New York, NY 10027-7003\"]},\"\n\",{\"type\":\"H1\",\"content\":[\"Curriculum Vita\"]},\"\n\",{\"type\":\"P\",\"content\":[{\"type\":\"A\",\"content\":[{\"type\":\"IMG\",\"attributes\":{\"src\":\"icons/pdficon-large.png\",\"width\":\"32\",\"height\":\"32\",\"alt\":\"PDF file\"}}],\"attributes\":{\"href\":\"cv.pdf\"}}]},\"\n\",{\"type\":\"H1\",\"content\":[\"Now Teaching\"]},\"\n\",{\"type\":\"P\",\"content\":[{\"type\":\"A\",\"content\":[\"COMS W4115\"],\"attributes\":{\"href\":\"classes/2015/4115-fall/index.html\"}}]},\"\n\",{\"type\":\"P\",\"content\":[{\"type\":\"A\",\"content\":[\"COMS W4115 (CVN)\"],\"attributes\":{\"href\":\"classes/2015/4115-fall-cvn/index.html\"}}]},\"\n\",{\"type\":\"P\",\"content\":[{\"type\":\"A\",\"content\":[\"ENGI 1102 (CS/CE lab)\"],\"attributes\":{\"href\":\"classes/2015/1102-fall/index.html\"}}]},\"\n\",{\"type\":\"H1\",\"content\":[\"Office Hours\"]},\"\n\",{\"type\":\"P\",\"content\":[{\"type\":\"OFFICE-HOURS\",\"content\":[\"\n    By appointment: email me\n  \"]}]},\"\n\"],\"attributes\":{\"class\":\"left\"}},\"\n\",{\"type\":\"TD\",\"content\":[\"\n\",{\"type\":\"P\",\"content\":[{\"type\":\"A\",\"content\":[\" \",{\"type\":\"IMG\",\"attributes\":{\"src\":\"icons/cecicon.png\",\"style\":\"float:right\",\"alt\":\"CEC logo\",\"width\":\"31\",\"height\":\"25\"}},\"\n      The Columbia Esterel Compiler\n    \"],\"attributes\":{\"href\":\"cec/\"}}]},\"\n\",{\"type\":\"P\",\"content\":[\" \",{\"type\":\"A\",\"content\":[\"Apple2fpga: A reconstruction of an Apple II+\n on a FPGA\"],\"attributes\":{\"href\":\"apple2fpga/\"}}]},\"\n\",{\"type\":\"P\",\"content\":[\"\n    Some press:\n    \",{\"type\":\"A\",\"content\":[\"My Office\"],\"attributes\":{\"href\":\"http://bwog.com/2011/11/17/officehop-stephen-edwards-personal-arcade/\"}},\"\n\n    •\n\n    \",{\"type\":\"A\",\"content\":[\"Actual Wisdom\"],\"attributes\":{\"href\":\"http://bwog.com/2011/12/15/actual-wisdom-stephen-edwards/\"}},\"\n\n    •\n\n    \",{\"type\":\"A\",\"content\":[\"Facebook Advice\"],\"attributes\":{\"href\":\"http://bwog.com/2014/11/20/better-than-culpa-professor-edwards-plays-facebook-antihero/\"}},\"\n\n    •\n\n    \",{\"type\":\"A\",\"content\":[\"CUPLA Reviews\"],\"attributes\":{\"href\":\"http://culpa.info/professors/1637\"}},\"\n\n    \"]},\"\n\",{\"type\":\"P\",\"content\":[\"\n      \",{\"type\":\"A\",\"content\":[{\"type\":\"IMG\",\"attributes\":{\"src\":\"icons/pdficon-large.png\",\"width\":\"32\",\"height\":\"32\",\"alt\":\"PDF file\"}},\"Advice for 3-2 Combined Plan CS Students\"],\"attributes\":{\"href\":\"presentations/2015-3-2-advise.pdf\"}},\"\n    \"]},\"\n\",{\"type\":\"P\",\"content\":[\" I often teach on CVN, which can sometimes be \",{\"type\":\"A\",\"content\":[\"confusing for new faculty.\"],\"attributes\":{\"href\":\"http://cvn.columbia.edu/nb.html\"}},\" \"]},\"\n\",{\"type\":\"P\",\"content\":[\"\n      Stephen A. Edwards is a\n      \",{\"type\":\"A\",\"content\":[\"tenured\"],\"attributes\":{\"href\":\"images/farley-katz-tenure.jpg\"}},\"\n      associate professor in the\n      \",{\"type\":\"A\",\"content\":[\"Computer Science Department\"],\"attributes\":{\"href\":\"http://www.cs.columbia.edu/\"}},\" of\n      \",{\"type\":\"A\",\"content\":[\"Columbia University\"],\"attributes\":{\"href\":\"http://www.columbia.edu/\"}},\".\n      He obtained his Ph.D from\n      the \",{\"type\":\"A\",\"content\":[\"University of California,\n      Berkeley\"],\"attributes\":{\"href\":\"http://www.berkeley.edu/\"}},\" in 1997, his MS\n      from Berkeley in 1994, and his BS from the \",{\"type\":\"A\",\"content\":[\"California\n      Institute of Technology\"],\"attributes\":{\"href\":\"http://www.caltech.edu/\"}},\" in 1992,\n      all in Electrical\n      Engineering.  Before pursuing his academic career in 2001,\n      he worked for two Electronic Design Automation (EDA)\n      companies, Simplex Solutions, now part of Cadence, and\n      \",{\"type\":\"A\",\"content\":[\"Synopsys\"],\"attributes\":{\"href\":\"http://www.synopsys.com/\"}},\".\n    \"]},\"\n\",{\"type\":\"P\",\"content\":[\" Professor Edwards and his group explore automating the\n    creation of software for embedded systems: application-specific\n    computers hiding in a growing number of industrial and consumer\n    systems.  They have developed numerous compilation techniques for\n    the Esterel synchronous language for real-time control and are\n    also developing domain-specific languages for device drivers and\n    communication protocols.\"]},\"\n\",{\"type\":\"P\",\"content\":[\"\n      My group does not offer internships, summer or otherwise.\n    \"]},\"\n\",{\"type\":\"HR\"},\"\n\",{\"type\":\"H1\",\"content\":[\"Consulting/Litigation Support/Expert Witness Services\"]},\"\n\",{\"type\":\"P\",\"content\":[\"\n      I have been engaged as an expert witness in various patent\n      litigation cases involving software and computer architecture,\n      including an ITC case.  I am always interested to hear about new\n      opportunities.\n    \"]},\"\n\",{\"type\":\"P\",\"content\":[\"\n      My consulting CV: \",{\"type\":\"A\",\"content\":[{\"type\":\"IMG\",\"attributes\":{\"src\":\"icons/pdficon-large.png\",\"width\":\"32\",\"height\":\"32\",\"alt\":\"PDF file\"}}],\"attributes\":{\"href\":\"expert-cv.pdf\"}},\"\n    \"]},\"\n\",{\"type\":\"HR\"},\"\n\",{\"type\":\"H1\",\"content\":[\"PhD Students\"]},\"\n\",{\"type\":\"P\",\"content\":[\"Richard Townsend,\n\t\t\n\t      2013-\"]},\"\n\",{\"type\":\"P\",\"content\":[\"Kuangya Zhai,\n\t\t\n\t      2013-\"]},\"\n\",{\"type\":\"P\",\"content\":[{\"type\":\"A\",\"content\":[\"Nalini Vasudevan\"],\"attributes\":{\"href\":\"/~naliniv/\"}},\",\n\t\t\n\t      2007-2011, now with Google\"]},\"\n\",{\"type\":\"P\",\"content\":[\"Marcio Buss,\n\t\t\n\t      2004-2008\"]},\"\n\",{\"type\":\"P\",\"content\":[{\"type\":\"A\",\"content\":[\"Jia Zeng\"],\"attributes\":{\"href\":\"/~jia/\"}},\",\n\t\t\n\t      2002-2008\"]},\"\n\",{\"type\":\"P\",\"content\":[{\"type\":\"A\",\"content\":[\"Cristian Soviani\"],\"attributes\":{\"href\":\"/~soviani\"}},\",\n\t\t\n\t      2002-2007, now with Synopsys\"]},\"\n\",{\"type\":\"H1\",\"content\":[\"Postdocs\"]},\"\n\",{\"type\":\"P\",\"content\":[{\"type\":\"A\",\"content\":[\"Olivier Tardieu\"],\"attributes\":{\"href\":\"/~tardieu/\"}},\",\n\t      2004-2006, now with IBM\"]},\"\n\",{\"type\":\"H1\",\"content\":[\"Relatives\"]},\"\n\",{\"type\":\"P\",\"content\":[\"\n\t    Brother, \",{\"type\":\"A\",\"content\":[\"\n\t    Prof. Ryan Edwards\"],\"attributes\":{\"href\":\"http://qcpages.qc.cuny.edu/~redwards/\"}},\", Queens College, CUNY\n\t  \"]},\"\n\",{\"type\":\"P\",\"content\":[\"\n\t    Wife,  \",{\"type\":\"A\",\"content\":[\"\n\t    Nina Edwards\"],\"attributes\":{\"href\":\"http://www.creativeshake.com/ninaedwards/\"}},\", Illustrator\n\t  \"]},\"\n\"]},\"\n\"]}]}]}],\"attributes\":{\"id\":\"info\"}},\"\n\n\n\"]}]}";
//
//    char *out;cJSON *json;
//
//    json=cJSON_Parse(html);
//    if (!json) {printf("Error before: [%s]\n",cJSON_GetErrorPtr());}
//    else
//    {
//        out=cJSON_Print(json);
//        cJSON_Delete(json);
//        printf("%s\n",out);
//        //free(out);
//    }
//    
//    Page p = get("something","something");
//    Node* n = find (&p,"something");
//    printf("first child html: %s", ((Element*)n->data)->html);
    
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

