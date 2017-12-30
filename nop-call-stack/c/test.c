#include <stdio.h>
static const int WORK = 1000;
volatile int g = 0;

int compute(int m) {
    if (m == 0) return 0;
    for(int i = 0; i < WORK; i++) { g = i; }

    return 1 + compute(m - 1);
}

int main() {
    printf("%d", compute(80000));
    return 0;
}
