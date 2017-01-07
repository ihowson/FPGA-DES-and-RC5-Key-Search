#include "iflib.h"

#define	USEMOVQ

void
write64(int64 twrite, char *addr)
{
#ifdef	USEMOVQ
	__asm__ __volatile__(
	"
		movl %1,%%ecx\n
		movq %0,%%mm0\n
		movq %%mm0,(%%ecx)\n
	"
	:
	: "m" (twrite), "g" (addr)
	);
#else
	*((int *)(addr + 4)) = twrite.w[1];
	*((int *)addr) = twrite.w[0];
#endif
}

void
read64(int64 *data, char *addr)
{
#ifdef	USEMOVQ
	int64	tread;

	__asm__ __volatile__(
	"
		movl %1,%%ecx\n
		movq (%%ecx),%%mm1\n
		movq %%mm1,%0\n
	"
	: "=m" (tread)
	: "g" (addr)
	);
	data->w[0] = tread.w[0];
	data->w[1] = tread.w[1];
#else
	data->w[0] = *((int *)addr);
	data->w[1] = *((int *)(addr + 4));
#endif
}

void
write32(int twrite, char *addr)
{
	*((int *)addr) = twrite;
}

void
read32(int *data, char *addr)
{
	*data = *((int *)addr);
}
