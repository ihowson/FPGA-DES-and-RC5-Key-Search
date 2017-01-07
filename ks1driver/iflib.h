/* iflib.h ---- Brittle 2001.8.13 */
#define	DEVICE		"/dev/pilchard"
#define MTRRZ		0x100000

typedef struct
{
	int w[2];
} int64;

extern void write64(int64, char *);
extern void read64(int64 *, char *);
extern void write32(int, char *);
extern void read32(int *, char *);
