CC=gcc
LD=ld
CFLAGS=-g -Wall -Wundef -Wsign-compare -Wpointer-arith -O3 -g -W -Wall -Wno-unused-function -Wno-unused-parameter -Wno-cast-function-type -Wno-type-limits -fno-omit-frame-pointer -O3 -m64 -DWINVER=0x0501 -D__W32API_USE_DLLIMPORT__ -fno-pie
ASFLAGS=-g -Wall -Wundef -Wsign-compare -Wpointer-arith -O3 -g -W -Wall -Wno-unused-function -Wno-unused-parameter -Wno-cast-function-type -Wno-type-limits -fno-omit-frame-pointer -O3 -m64 -DWINVER=0x0501 -D__W32API_USE_DLLIMPORT__ -fno-pie
LINKFLAGS=-Wl,-export-all-symbols -Wl,--disable-dynamicbase -no-pie
LDFLAGS=-no-pie
__LDFLAGS__=-no-pie
LIBS=-l ws2_32 -ladvapi32 -lSynchronization  -lm
