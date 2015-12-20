#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>
#include "parse.h"
#include "cJSON.h"

char *_scrape(char *script) {
    int pipefd[2];
    pid_t cpid;
    int status;

    FILE *file_ptr;
    char *buffer = NULL, *temp = NULL;

    if (pipe(pipefd) == -1) return NULL;

    if ((cpid = fork()) == -1) {
        return NULL;
    } else if (cpid == 0) {
        close(pipefd[0]);
        dup2(pipefd[1], STDOUT_FILENO);
        dup2(pipefd[1], STDERR_FILENO);

        execl("/usr/bin/nodejs", "nodejs", "-e", script, NULL);
        return NULL;
    }
    close(pipefd[1]);

    size_t sz = 0, idx = 0;
    int chr = EOF;

    file_ptr = fdopen(pipefd[0], "r");
    if (file_ptr != NULL) {
        while (chr) {
            chr = fgetc(file_ptr);
            if (chr == EOF) chr = 0;

            if (sz <= idx) {
                sz++;
                if ((temp = realloc(buffer, sz)) == NULL) {
                    free(buffer);
                    break;
                }
                buffer = temp;
            }
            buffer[idx++] = (char) chr;
        }
    }

    if (waitpid(cpid, &status, 0) == -1) return NULL;

    return buffer;
}

Page *fetch(char *url) {
    Page *page = malloc(sizeof(Page));
    char *buffer = NULL;
    asprintf(&buffer, "var phantom = require('phantom'); phantom.create(function (ph) { ph.createPage(function (page) { page.set('viewportSize', {width: 1366, height: 768}); page.open('%s', function () { page.includeJs('http://code.jquery.com/jquery-1.11.3.min.js', function () { page.evaluate(function () { return window.document.documentElement.outerHTML; }, function (result) { var str = JSON.stringify(result); console.log(str.substring(1, str.length - 1)); ph.exit(); }); }); }); }); });", url);
    if (buffer == NULL) return NULL;

    page->url = strdup(url);
    char *str = _scrape(buffer);
    str[strlen(str) - 1] = 0;
    page->html = str;


    free(buffer);
    return page;
}

Element **find(Page *page, char *sel) {
    char *buffer = NULL;
    asprintf(&buffer, "var phantom = require('phantom'); phantom.create(function (ph) { ph.createPage(function (page) { page.set('viewportSize', {width: 1366, height: 768}); page.set('content', \"%s\"); page.includeJs('http://code.jquery.com/jquery-1.11.3.min.js', function () { page.evaluate(function () { var css_path = function(el) { if (!(el instanceof Element)) return; var path = []; while (el.nodeType === Node.ELEMENT_NODE) { var selector = el.nodeName.toLowerCase(); if (el.id) { selector += '#' + el.id; path.unshift(selector); break; } else { var sib = el, nth = 1; while (sib = sib.previousElementSibling) { if (sib.nodeName.toLowerCase() == selector) nth++; } if (nth != 1) selector += ':nth-of-type('+nth+')'; } path.unshift(selector); el = el.parentNode; } return path.join(' > '); }; return $.map($('%s'), function (elm) { return {html: elm.outerHTML, path: css_path(elm)} }); /*return $.find(blue[0]).length;*/ }, function (result) { console.log(JSON.stringify(result)); ph.exit(); }); }); }); });", page->html, sel);
    if (buffer == NULL) return NULL;

    cJSON *json;
    char *str = _scrape(buffer);
    json = cJSON_Parse(str);

    int size = cJSON_GetArraySize(json);
    Element **elm_list = malloc(sizeof(Element *) * size + 1);
    elm_list[size] = NULL;
    for (int i = 0; i < cJSON_GetArraySize(json); i++) {
        elm_list[i] = malloc(sizeof(Element));
        elm_list[i]->html = strdup(cJSON_GetObjectItem(cJSON_GetArrayItem(json, i), "html")->valuestring);
        elm_list[i]->path = strdup(cJSON_GetObjectItem(cJSON_GetArrayItem(json, i), "path")->valuestring);
    }

    free(buffer);
    cJSON_Delete(json);
    return elm_list;
}

//Element *parent(Element *elm) {
//    return NULL;
//}
//
//Element *children(Element *elm) {
//    return NULL;
//}