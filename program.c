#include <stdio.h>
#include <stdlib.h>

#include "sut.h"

int main(int argc, char **argv) {
  int val;
  if(argc != 2) {
    (void) printf("Usage: %s value\n", argv[0]);
    return -1;
  }
  val = atoi(argv[1]);
  (void) printf("%d squared is %ld\n", val, square(val));
  return 0;
}
