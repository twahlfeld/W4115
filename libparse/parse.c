#include <stdio.h>
#include <string.h>
#include <sys/time.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

#define FILENAME_SIZE 14
#define BUFF_SIZE 4096

void strrand(char *str, size_t len) {
    static const char alphanum[] =
        "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    int i;
    for (i = 0; i < len; ++i) {
        str[i] = alphanum[rand() % (sizeof(alphanum) - 1)];
    }

    str[len] = 0;
}

char *get_title(char *uri) {
    int pipefd[2];
    pid_t cpid;
    int status;
    FILE *fp_in, *fp_out;
    char js_file[FILENAME_SIZE];
    char js_out[BUFF_SIZE];
    char js_str[] = "var page = require('webpage').create(); var sys = require('system'); if (sys.args.length === 1) { phantom.exit(1); } var timeout = sys.args[1]; var url = sys.args[2]; page.viewportSize = { width: 1366, height: 768 }; page.settings.resourceTimeout = timeout; page.onResourceTimeout = function() { phantom.exit(2); }; page.open(url, function(status) { var title = page.evaluate(function() { return document.title; }); console.log(title); phantom.exit(0); });";
    char timeout[] = "15000";

    struct timeval time;
    gettimeofday(&time, NULL);
    srand((unsigned int) time.tv_usec);

    memset(js_file, 0, sizeof(char) * strlen(js_file) + 1);
    strrand(js_file, FILENAME_SIZE - 1);
    strncpy(js_file + 10, ".js", 3);

    do {
        memset(js_file, 0, sizeof(char) * strlen(js_file) + 1);
        strrand(js_file, FILENAME_SIZE - 1);
        strncpy(js_file + 10, ".js", 3);
    } while (access(js_file, F_OK) != -1);

    fp_out = fopen(js_file, "w");
    if (fp_out != NULL) {
        fwrite(js_str, 1, strlen(js_str), fp_out);
        fclose(fp_out);
    }

    if (pipe(pipefd) == -1) {
        return NULL;
    }

    if ((cpid = fork()) == -1) {
        return NULL;
    } else if (cpid == 0) {
        close(pipefd[0]);
        dup2(pipefd[1], STDOUT_FILENO);
        dup2(pipefd[1], STDERR_FILENO);

        execl("/usr/bin/phantomjs", "phantomjs", js_file, timeout, uri, NULL);
        return NULL;
    }

    close(pipefd[1]);

    fp_in = fdopen(pipefd[0], "r");
    if (fp_in != NULL) {
        while (fgets(js_out, BUFF_SIZE, fp_in) != NULL) { }
        fclose(fp_out);
    }

    if (waitpid(cpid, &status, 0) == -1) {
        return NULL;
    }

    if (remove(js_file) != 0) {
        return NULL;
    }

    char *title = malloc(sizeof(char) * strlen(js_out) + 1);
    memset(title, 0, sizeof(char) * strlen(title) + 1);
    strncpy(title, js_out, strlen(js_out));
    return title;
}
