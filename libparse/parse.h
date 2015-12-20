#ifndef PARSE_PARSE_H
#define PARSE_PARSE_H

typedef struct Page {
    char *url;
    char *html;
} Page;

typedef struct Element {
    char *html;
    char *path;
} Element;

Page *fetch(char *url);
Element **find(Page *page, char *sel);
char *_scrape(char *script);

#endif
