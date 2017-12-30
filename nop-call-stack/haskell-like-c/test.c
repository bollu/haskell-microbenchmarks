/*
# RUN: %loadSimplexhc %s  --jit | FileCheck %s
# CHECK: 7
#
# ack :: Int -> Int -> Int
# ack 0 b = b+1
# ack a 0 = ack (a - 1) 1
# ack a b = ack (a - 1) (ack a (b - 1))

binding compute = \(aint: PrimInt) -> PrimInt {
    case aint () of
            0 -> 0 (); 
            aval -> case primSubtract aval 1 of
                            adec -> case (compute adec) of
                                        cadec -> primAdd cadec 1
};


binding main = \() -> Boxed {
    case compute (3 11) of
        x -> printInt (x); 
};
*/
#include <stdio.h>
#include <assert.h>
#include <memory.h>
#include <stdlib.h>

#define STACK_SIZE 1000000ull


typedef struct Closure {
	void *fn;
} Closure;


typedef void(*VoidFnPtrTy)(Closure c);
typedef void(*IntFnPtrTy)(Closure c, int i);

//Closure *g_ret_stack;
Closure g_ret_stack[STACK_SIZE];
int g_ret_sp = 0;

void pushReturn(Closure c) {
	// assert(g_ret_sp <= STACK_SIZE - 1);
	g_ret_stack[g_ret_sp++] = c;
}


Closure popReturn() {
	Closure c = g_ret_stack[--g_ret_sp];
	// assert(g_ret_sp >= 0);
	return c;
}

Closure mkclosure0(void *f) {
	Closure c;
	c.fn = (void *)f;
	return c;
}


void main_return(Closure c, int i) {
	printf("%d", i);
}


/* forward decl */
void compute(int i);


void compute_return(Closure _, int bnew) {
    const struct Closure next = popReturn();
    ((IntFnPtrTy)next.fn)(next, bnew + 1);
}

volatile int g = 0;
static const int WORK = 1000;

void compute(const int a) {
    if (a == 0) {
        const Closure c = popReturn();
        ((IntFnPtrTy)c.fn)(c, 0);
    }
	else {
        for(int i = 0; i < WORK; i++) {
            g = i;
        }
        pushReturn(mkclosure0((void *)compute_return));
		compute(a - 1);
	}

}

int main() {
	// g_ret_stack//  = (Closure *)malloc(sizeof(Closure) * STACK_SIZE);
    Closure c = mkclosure0((void *)main_return);
	pushReturn(c);
    compute(80000);
    return 0;
}
