#include <stdio.h>

void p(char *a, char *b, char *c, char *d, char *e, char *f, char *g) {
  fprintf(stdout, "%s %s %s %s %s %s %s\n", a, b, c, d, e, f, g);
}

int main() {
  char *this = "this";
  char *is = "is";
  char *a  = "a";
  char *really = "really";
  char *bad = "bad";
  char *msg = "msg";
  char *srsly = "srsly";
  p(this, is, a, really, bad, msg, srsly);
  return 0;
}
