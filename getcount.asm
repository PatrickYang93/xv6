
_getcount:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "syscall.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  printf(1, "initial fork count %d\n", getcount(SYS_fork));
   9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10:	e8 ad 03 00 00       	call   3c2 <getcount>
  15:	c7 44 24 04 06 08 00 	movl   $0x806,0x4(%esp)
  1c:	00 
  1d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  24:	89 44 24 08          	mov    %eax,0x8(%esp)
  28:	e8 73 04 00 00       	call   4a0 <printf>
  if (fork() == 0) {
  2d:	e8 e8 02 00 00       	call   31a <fork>
  32:	85 c0                	test   %eax,%eax
  34:	75 71                	jne    a7 <main+0xa7>
    printf(1, "child fork count %d\n", getcount(SYS_fork));
  36:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3d:	e8 80 03 00 00       	call   3c2 <getcount>
  42:	c7 44 24 04 1d 08 00 	movl   $0x81d,0x4(%esp)
  49:	00 
  4a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  51:	89 44 24 08          	mov    %eax,0x8(%esp)
  55:	e8 46 04 00 00       	call   4a0 <printf>
    printf(1, "child write count %d\n", getcount(SYS_write));
  5a:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  61:	e8 5c 03 00 00       	call   3c2 <getcount>
  66:	c7 44 24 04 32 08 00 	movl   $0x832,0x4(%esp)
  6d:	00 
  6e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  75:	89 44 24 08          	mov    %eax,0x8(%esp)
  79:	e8 22 04 00 00       	call   4a0 <printf>
  } else {
    wait();
    printf(1, "parent fork count %d\n", getcount(SYS_fork));
    printf(1, "parent write count %d\n", getcount(SYS_write));
  }
  printf(1, "wait count %d\n", getcount(SYS_wait));
  7e:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  85:	e8 38 03 00 00       	call   3c2 <getcount>
  8a:	c7 44 24 04 75 08 00 	movl   $0x875,0x4(%esp)
  91:	00 
  92:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  99:	89 44 24 08          	mov    %eax,0x8(%esp)
  9d:	e8 fe 03 00 00       	call   4a0 <printf>
  exit();
  a2:	e8 7b 02 00 00       	call   322 <exit>
  printf(1, "initial fork count %d\n", getcount(SYS_fork));
  if (fork() == 0) {
    printf(1, "child fork count %d\n", getcount(SYS_fork));
    printf(1, "child write count %d\n", getcount(SYS_write));
  } else {
    wait();
  a7:	e8 7e 02 00 00       	call   32a <wait>
    printf(1, "parent fork count %d\n", getcount(SYS_fork));
  ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b3:	e8 0a 03 00 00       	call   3c2 <getcount>
  b8:	c7 44 24 04 48 08 00 	movl   $0x848,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	89 44 24 08          	mov    %eax,0x8(%esp)
  cb:	e8 d0 03 00 00       	call   4a0 <printf>
    printf(1, "parent write count %d\n", getcount(SYS_write));
  d0:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  d7:	e8 e6 02 00 00       	call   3c2 <getcount>
  dc:	c7 44 24 04 5e 08 00 	movl   $0x85e,0x4(%esp)
  e3:	00 
  e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  eb:	89 44 24 08          	mov    %eax,0x8(%esp)
  ef:	e8 ac 03 00 00       	call   4a0 <printf>
  f4:	eb 88                	jmp    7e <main+0x7e>
  f6:	66 90                	xchg   %ax,%ax
  f8:	66 90                	xchg   %ax,%ax
  fa:	66 90                	xchg   %ax,%ax
  fc:	66 90                	xchg   %ax,%ax
  fe:	66 90                	xchg   %ax,%ax

00000100 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 109:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 10a:	89 c2                	mov    %eax,%edx
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 110:	83 c1 01             	add    $0x1,%ecx
 113:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 117:	83 c2 01             	add    $0x1,%edx
 11a:	84 db                	test   %bl,%bl
 11c:	88 5a ff             	mov    %bl,-0x1(%edx)
 11f:	75 ef                	jne    110 <strcpy+0x10>
    ;
  return os;
}
 121:	5b                   	pop    %ebx
 122:	5d                   	pop    %ebp
 123:	c3                   	ret    
 124:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 12a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000130 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 55 08             	mov    0x8(%ebp),%edx
 136:	53                   	push   %ebx
 137:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 13a:	0f b6 02             	movzbl (%edx),%eax
 13d:	84 c0                	test   %al,%al
 13f:	74 2d                	je     16e <strcmp+0x3e>
 141:	0f b6 19             	movzbl (%ecx),%ebx
 144:	38 d8                	cmp    %bl,%al
 146:	74 0e                	je     156 <strcmp+0x26>
 148:	eb 2b                	jmp    175 <strcmp+0x45>
 14a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 150:	38 c8                	cmp    %cl,%al
 152:	75 15                	jne    169 <strcmp+0x39>
    p++, q++;
 154:	89 d9                	mov    %ebx,%ecx
 156:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 159:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 15c:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 15f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 163:	84 c0                	test   %al,%al
 165:	75 e9                	jne    150 <strcmp+0x20>
 167:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 169:	29 c8                	sub    %ecx,%eax
}
 16b:	5b                   	pop    %ebx
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
 16e:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 171:	31 c0                	xor    %eax,%eax
 173:	eb f4                	jmp    169 <strcmp+0x39>
 175:	0f b6 cb             	movzbl %bl,%ecx
 178:	eb ef                	jmp    169 <strcmp+0x39>
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000180 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 39 00             	cmpb   $0x0,(%ecx)
 189:	74 12                	je     19d <strlen+0x1d>
 18b:	31 d2                	xor    %edx,%edx
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c2 01             	add    $0x1,%edx
 193:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 197:	89 d0                	mov    %edx,%eax
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 19d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
 1a1:	eb 0d                	jmp    1b0 <memset>
 1a3:	90                   	nop
 1a4:	90                   	nop
 1a5:	90                   	nop
 1a6:	90                   	nop
 1a7:	90                   	nop
 1a8:	90                   	nop
 1a9:	90                   	nop
 1aa:	90                   	nop
 1ab:	90                   	nop
 1ac:	90                   	nop
 1ad:	90                   	nop
 1ae:	90                   	nop
 1af:	90                   	nop

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
 1b6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	89 d0                	mov    %edx,%eax
 1c4:	5f                   	pop    %edi
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	89 f6                	mov    %esi,%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	53                   	push   %ebx
 1d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 1da:	0f b6 18             	movzbl (%eax),%ebx
 1dd:	84 db                	test   %bl,%bl
 1df:	74 1d                	je     1fe <strchr+0x2e>
    if(*s == c)
 1e1:	38 d3                	cmp    %dl,%bl
 1e3:	89 d1                	mov    %edx,%ecx
 1e5:	75 0d                	jne    1f4 <strchr+0x24>
 1e7:	eb 17                	jmp    200 <strchr+0x30>
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f0:	38 ca                	cmp    %cl,%dl
 1f2:	74 0c                	je     200 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1f4:	83 c0 01             	add    $0x1,%eax
 1f7:	0f b6 10             	movzbl (%eax),%edx
 1fa:	84 d2                	test   %dl,%dl
 1fc:	75 f2                	jne    1f0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 1fe:	31 c0                	xor    %eax,%eax
}
 200:	5b                   	pop    %ebx
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    
 203:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 215:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 217:	53                   	push   %ebx
 218:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 21b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 21e:	eb 31                	jmp    251 <gets+0x41>
    cc = read(0, &c, 1);
 220:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 227:	00 
 228:	89 7c 24 04          	mov    %edi,0x4(%esp)
 22c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 233:	e8 02 01 00 00       	call   33a <read>
    if(cc < 1)
 238:	85 c0                	test   %eax,%eax
 23a:	7e 1d                	jle    259 <gets+0x49>
      break;
    buf[i++] = c;
 23c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 240:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 242:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 245:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 247:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 24b:	74 0c                	je     259 <gets+0x49>
 24d:	3c 0a                	cmp    $0xa,%al
 24f:	74 08                	je     259 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 251:	8d 5e 01             	lea    0x1(%esi),%ebx
 254:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 257:	7c c7                	jl     220 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 259:	8b 45 08             	mov    0x8(%ebp),%eax
 25c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 260:	83 c4 2c             	add    $0x2c,%esp
 263:	5b                   	pop    %ebx
 264:	5e                   	pop    %esi
 265:	5f                   	pop    %edi
 266:	5d                   	pop    %ebp
 267:	c3                   	ret    
 268:	90                   	nop
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000270 <stat>:

int
stat(const char *n, struct stat *st)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
 275:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 278:	8b 45 08             	mov    0x8(%ebp),%eax
 27b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 282:	00 
 283:	89 04 24             	mov    %eax,(%esp)
 286:	e8 d7 00 00 00       	call   362 <open>
  if(fd < 0)
 28b:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 28d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 28f:	78 27                	js     2b8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 291:	8b 45 0c             	mov    0xc(%ebp),%eax
 294:	89 1c 24             	mov    %ebx,(%esp)
 297:	89 44 24 04          	mov    %eax,0x4(%esp)
 29b:	e8 da 00 00 00       	call   37a <fstat>
  close(fd);
 2a0:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 2a3:	89 c6                	mov    %eax,%esi
  close(fd);
 2a5:	e8 a0 00 00 00       	call   34a <close>
  return r;
 2aa:	89 f0                	mov    %esi,%eax
}
 2ac:	83 c4 10             	add    $0x10,%esp
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    
 2b3:	90                   	nop
 2b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2bd:	eb ed                	jmp    2ac <stat+0x3c>
 2bf:	90                   	nop

000002c0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2c6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c7:	0f be 11             	movsbl (%ecx),%edx
 2ca:	8d 42 d0             	lea    -0x30(%edx),%eax
 2cd:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
 2cf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 2d4:	77 17                	ja     2ed <atoi+0x2d>
 2d6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2d8:	83 c1 01             	add    $0x1,%ecx
 2db:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2de:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e2:	0f be 11             	movsbl (%ecx),%edx
 2e5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2e8:	80 fb 09             	cmp    $0x9,%bl
 2eb:	76 eb                	jbe    2d8 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 2ed:	5b                   	pop    %ebx
 2ee:	5d                   	pop    %ebp
 2ef:	c3                   	ret    

000002f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2f0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2f1:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2f3:	89 e5                	mov    %esp,%ebp
 2f5:	56                   	push   %esi
 2f6:	8b 45 08             	mov    0x8(%ebp),%eax
 2f9:	53                   	push   %ebx
 2fa:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2fd:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 300:	85 db                	test   %ebx,%ebx
 302:	7e 12                	jle    316 <memmove+0x26>
 304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 308:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 30c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 30f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 312:	39 da                	cmp    %ebx,%edx
 314:	75 f2                	jne    308 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 31a:	b8 01 00 00 00       	mov    $0x1,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <exit>:
SYSCALL(exit)
 322:	b8 02 00 00 00       	mov    $0x2,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <wait>:
SYSCALL(wait)
 32a:	b8 03 00 00 00       	mov    $0x3,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <pipe>:
SYSCALL(pipe)
 332:	b8 04 00 00 00       	mov    $0x4,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <read>:
SYSCALL(read)
 33a:	b8 05 00 00 00       	mov    $0x5,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <write>:
SYSCALL(write)
 342:	b8 10 00 00 00       	mov    $0x10,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <close>:
SYSCALL(close)
 34a:	b8 15 00 00 00       	mov    $0x15,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <kill>:
SYSCALL(kill)
 352:	b8 06 00 00 00       	mov    $0x6,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <exec>:
SYSCALL(exec)
 35a:	b8 07 00 00 00       	mov    $0x7,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <open>:
SYSCALL(open)
 362:	b8 0f 00 00 00       	mov    $0xf,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <mknod>:
SYSCALL(mknod)
 36a:	b8 11 00 00 00       	mov    $0x11,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <unlink>:
SYSCALL(unlink)
 372:	b8 12 00 00 00       	mov    $0x12,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <fstat>:
SYSCALL(fstat)
 37a:	b8 08 00 00 00       	mov    $0x8,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <link>:
SYSCALL(link)
 382:	b8 13 00 00 00       	mov    $0x13,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <mkdir>:
SYSCALL(mkdir)
 38a:	b8 14 00 00 00       	mov    $0x14,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <chdir>:
SYSCALL(chdir)
 392:	b8 09 00 00 00       	mov    $0x9,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <dup>:
SYSCALL(dup)
 39a:	b8 0a 00 00 00       	mov    $0xa,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <getpid>:
SYSCALL(getpid)
 3a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <sbrk>:
SYSCALL(sbrk)
 3aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <sleep>:
SYSCALL(sleep)
 3b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <uptime>:
SYSCALL(uptime)
 3ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <getcount>:
SYSCALL(getcount)
 3c2:	b8 16 00 00 00       	mov    $0x16,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <v2paddr>:
SYSCALL(v2paddr)
 3ca:	b8 17 00 00 00       	mov    $0x17,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <create>:
SYSCALL(create)
 3d2:	b8 18 00 00 00       	mov    $0x18,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <join>:
SYSCALL(join)
 3da:	b8 19 00 00 00       	mov    $0x19,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <mtxcreate>:
SYSCALL(mtxcreate)
 3e2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <mtxlock>:
SYSCALL(mtxlock)
 3ea:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <mtxunlock>:
 3f2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    
 3fa:	66 90                	xchg   %ax,%ax
 3fc:	66 90                	xchg   %ax,%ax
 3fe:	66 90                	xchg   %ax,%ax

00000400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	89 c6                	mov    %eax,%esi
 407:	53                   	push   %ebx
 408:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 40b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 40e:	85 db                	test   %ebx,%ebx
 410:	74 09                	je     41b <printint+0x1b>
 412:	89 d0                	mov    %edx,%eax
 414:	c1 e8 1f             	shr    $0x1f,%eax
 417:	84 c0                	test   %al,%al
 419:	75 75                	jne    490 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 41b:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 41d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 424:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 427:	31 ff                	xor    %edi,%edi
 429:	89 ce                	mov    %ecx,%esi
 42b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 42e:	eb 02                	jmp    432 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 430:	89 cf                	mov    %ecx,%edi
 432:	31 d2                	xor    %edx,%edx
 434:	f7 f6                	div    %esi
 436:	8d 4f 01             	lea    0x1(%edi),%ecx
 439:	0f b6 92 8b 08 00 00 	movzbl 0x88b(%edx),%edx
  }while((x /= base) != 0);
 440:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 442:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 445:	75 e9                	jne    430 <printint+0x30>
  if(neg)
 447:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 44a:	89 c8                	mov    %ecx,%eax
 44c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
 44f:	85 d2                	test   %edx,%edx
 451:	74 08                	je     45b <printint+0x5b>
    buf[i++] = '-';
 453:	8d 4f 02             	lea    0x2(%edi),%ecx
 456:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 45b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 45e:	66 90                	xchg   %ax,%ax
 460:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 465:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 468:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 46f:	00 
 470:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 474:	89 34 24             	mov    %esi,(%esp)
 477:	88 45 d7             	mov    %al,-0x29(%ebp)
 47a:	e8 c3 fe ff ff       	call   342 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 47f:	83 ff ff             	cmp    $0xffffffff,%edi
 482:	75 dc                	jne    460 <printint+0x60>
    putc(fd, buf[i]);
}
 484:	83 c4 4c             	add    $0x4c,%esp
 487:	5b                   	pop    %ebx
 488:	5e                   	pop    %esi
 489:	5f                   	pop    %edi
 48a:	5d                   	pop    %ebp
 48b:	c3                   	ret    
 48c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 490:	89 d0                	mov    %edx,%eax
 492:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 494:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 49b:	eb 87                	jmp    424 <printint+0x24>
 49d:	8d 76 00             	lea    0x0(%esi),%esi

000004a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4a4:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a6:	56                   	push   %esi
 4a7:	53                   	push   %ebx
 4a8:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4ae:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4b1:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4b4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 4b7:	0f b6 13             	movzbl (%ebx),%edx
 4ba:	83 c3 01             	add    $0x1,%ebx
 4bd:	84 d2                	test   %dl,%dl
 4bf:	75 39                	jne    4fa <printf+0x5a>
 4c1:	e9 c2 00 00 00       	jmp    588 <printf+0xe8>
 4c6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4c8:	83 fa 25             	cmp    $0x25,%edx
 4cb:	0f 84 bf 00 00 00    	je     590 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4d1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4d4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4db:	00 
 4dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e0:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4e3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4e6:	e8 57 fe ff ff       	call   342 <write>
 4eb:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4ee:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4f2:	84 d2                	test   %dl,%dl
 4f4:	0f 84 8e 00 00 00    	je     588 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
 4fa:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 4fc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 4ff:	74 c7                	je     4c8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 501:	83 ff 25             	cmp    $0x25,%edi
 504:	75 e5                	jne    4eb <printf+0x4b>
      if(c == 'd'){
 506:	83 fa 64             	cmp    $0x64,%edx
 509:	0f 84 31 01 00 00    	je     640 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 50f:	25 f7 00 00 00       	and    $0xf7,%eax
 514:	83 f8 70             	cmp    $0x70,%eax
 517:	0f 84 83 00 00 00    	je     5a0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 51d:	83 fa 73             	cmp    $0x73,%edx
 520:	0f 84 a2 00 00 00    	je     5c8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 526:	83 fa 63             	cmp    $0x63,%edx
 529:	0f 84 35 01 00 00    	je     664 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 52f:	83 fa 25             	cmp    $0x25,%edx
 532:	0f 84 e0 00 00 00    	je     618 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 538:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 53b:	83 c3 01             	add    $0x1,%ebx
 53e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 545:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 546:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 548:	89 44 24 04          	mov    %eax,0x4(%esp)
 54c:	89 34 24             	mov    %esi,(%esp)
 54f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 552:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 556:	e8 e7 fd ff ff       	call   342 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 55b:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 55e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 561:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 568:	00 
 569:	89 44 24 04          	mov    %eax,0x4(%esp)
 56d:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 570:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 573:	e8 ca fd ff ff       	call   342 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 578:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 57c:	84 d2                	test   %dl,%dl
 57e:	0f 85 76 ff ff ff    	jne    4fa <printf+0x5a>
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 588:	83 c4 3c             	add    $0x3c,%esp
 58b:	5b                   	pop    %ebx
 58c:	5e                   	pop    %esi
 58d:	5f                   	pop    %edi
 58e:	5d                   	pop    %ebp
 58f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 590:	bf 25 00 00 00       	mov    $0x25,%edi
 595:	e9 51 ff ff ff       	jmp    4eb <printf+0x4b>
 59a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5a3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5a8:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5aa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5b1:	8b 10                	mov    (%eax),%edx
 5b3:	89 f0                	mov    %esi,%eax
 5b5:	e8 46 fe ff ff       	call   400 <printint>
        ap++;
 5ba:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5be:	e9 28 ff ff ff       	jmp    4eb <printf+0x4b>
 5c3:	90                   	nop
 5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 5c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 5cb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 5cf:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
 5d1:	b8 84 08 00 00       	mov    $0x884,%eax
 5d6:	85 ff                	test   %edi,%edi
 5d8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 5db:	0f b6 07             	movzbl (%edi),%eax
 5de:	84 c0                	test   %al,%al
 5e0:	74 2a                	je     60c <printf+0x16c>
 5e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5e8:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5eb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 5ee:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5f8:	00 
 5f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fd:	89 34 24             	mov    %esi,(%esp)
 600:	e8 3d fd ff ff       	call   342 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 605:	0f b6 07             	movzbl (%edi),%eax
 608:	84 c0                	test   %al,%al
 60a:	75 dc                	jne    5e8 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 60c:	31 ff                	xor    %edi,%edi
 60e:	e9 d8 fe ff ff       	jmp    4eb <printf+0x4b>
 613:	90                   	nop
 614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 618:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 61b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 61d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 624:	00 
 625:	89 44 24 04          	mov    %eax,0x4(%esp)
 629:	89 34 24             	mov    %esi,(%esp)
 62c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 630:	e8 0d fd ff ff       	call   342 <write>
 635:	e9 b1 fe ff ff       	jmp    4eb <printf+0x4b>
 63a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 640:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 643:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 648:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 64b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 652:	8b 10                	mov    (%eax),%edx
 654:	89 f0                	mov    %esi,%eax
 656:	e8 a5 fd ff ff       	call   400 <printint>
        ap++;
 65b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 65f:	e9 87 fe ff ff       	jmp    4eb <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 664:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 667:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 669:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 66b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 672:	00 
 673:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 676:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 679:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 67c:	89 44 24 04          	mov    %eax,0x4(%esp)
 680:	e8 bd fc ff ff       	call   342 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 685:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 689:	e9 5d fe ff ff       	jmp    4eb <printf+0x4b>
 68e:	66 90                	xchg   %ax,%ax

00000690 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 690:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 691:	a1 00 0b 00 00       	mov    0xb00,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 696:	89 e5                	mov    %esp,%ebp
 698:	57                   	push   %edi
 699:	56                   	push   %esi
 69a:	53                   	push   %ebx
 69b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 69e:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6a0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a3:	39 d0                	cmp    %edx,%eax
 6a5:	72 11                	jb     6b8 <free+0x28>
 6a7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a8:	39 c8                	cmp    %ecx,%eax
 6aa:	72 04                	jb     6b0 <free+0x20>
 6ac:	39 ca                	cmp    %ecx,%edx
 6ae:	72 10                	jb     6c0 <free+0x30>
 6b0:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b4:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b6:	73 f0                	jae    6a8 <free+0x18>
 6b8:	39 ca                	cmp    %ecx,%edx
 6ba:	72 04                	jb     6c0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6bc:	39 c8                	cmp    %ecx,%eax
 6be:	72 f0                	jb     6b0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6c3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 6c6:	39 cf                	cmp    %ecx,%edi
 6c8:	74 1e                	je     6e8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6ca:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6cd:	8b 48 04             	mov    0x4(%eax),%ecx
 6d0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6d3:	39 f2                	cmp    %esi,%edx
 6d5:	74 28                	je     6ff <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6d7:	89 10                	mov    %edx,(%eax)
  freep = p;
 6d9:	a3 00 0b 00 00       	mov    %eax,0xb00
}
 6de:	5b                   	pop    %ebx
 6df:	5e                   	pop    %esi
 6e0:	5f                   	pop    %edi
 6e1:	5d                   	pop    %ebp
 6e2:	c3                   	ret    
 6e3:	90                   	nop
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6e8:	03 71 04             	add    0x4(%ecx),%esi
 6eb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6ee:	8b 08                	mov    (%eax),%ecx
 6f0:	8b 09                	mov    (%ecx),%ecx
 6f2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6f5:	8b 48 04             	mov    0x4(%eax),%ecx
 6f8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6fb:	39 f2                	cmp    %esi,%edx
 6fd:	75 d8                	jne    6d7 <free+0x47>
    p->s.size += bp->s.size;
 6ff:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 702:	a3 00 0b 00 00       	mov    %eax,0xb00
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 707:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 70a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 70d:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 70f:	5b                   	pop    %ebx
 710:	5e                   	pop    %esi
 711:	5f                   	pop    %edi
 712:	5d                   	pop    %ebp
 713:	c3                   	ret    
 714:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 71a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000720 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 729:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 72c:	8b 1d 00 0b 00 00    	mov    0xb00,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 732:	8d 48 07             	lea    0x7(%eax),%ecx
 735:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 738:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 73a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 73d:	0f 84 9b 00 00 00    	je     7de <malloc+0xbe>
 743:	8b 13                	mov    (%ebx),%edx
 745:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 748:	39 fe                	cmp    %edi,%esi
 74a:	76 64                	jbe    7b0 <malloc+0x90>
 74c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 753:	bb 00 80 00 00       	mov    $0x8000,%ebx
 758:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 75b:	eb 0e                	jmp    76b <malloc+0x4b>
 75d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 760:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 762:	8b 78 04             	mov    0x4(%eax),%edi
 765:	39 fe                	cmp    %edi,%esi
 767:	76 4f                	jbe    7b8 <malloc+0x98>
 769:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 76b:	3b 15 00 0b 00 00    	cmp    0xb00,%edx
 771:	75 ed                	jne    760 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 773:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 776:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 77c:	bf 00 10 00 00       	mov    $0x1000,%edi
 781:	0f 43 fe             	cmovae %esi,%edi
 784:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 787:	89 04 24             	mov    %eax,(%esp)
 78a:	e8 1b fc ff ff       	call   3aa <sbrk>
  if(p == (char*)-1)
 78f:	83 f8 ff             	cmp    $0xffffffff,%eax
 792:	74 18                	je     7ac <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 794:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 797:	83 c0 08             	add    $0x8,%eax
 79a:	89 04 24             	mov    %eax,(%esp)
 79d:	e8 ee fe ff ff       	call   690 <free>
  return freep;
 7a2:	8b 15 00 0b 00 00    	mov    0xb00,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 7a8:	85 d2                	test   %edx,%edx
 7aa:	75 b4                	jne    760 <malloc+0x40>
        return 0;
 7ac:	31 c0                	xor    %eax,%eax
 7ae:	eb 20                	jmp    7d0 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7b0:	89 d0                	mov    %edx,%eax
 7b2:	89 da                	mov    %ebx,%edx
 7b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 7b8:	39 fe                	cmp    %edi,%esi
 7ba:	74 1c                	je     7d8 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7bc:	29 f7                	sub    %esi,%edi
 7be:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 7c1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 7c4:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 7c7:	89 15 00 0b 00 00    	mov    %edx,0xb00
      return (void*)(p + 1);
 7cd:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7d0:	83 c4 1c             	add    $0x1c,%esp
 7d3:	5b                   	pop    %ebx
 7d4:	5e                   	pop    %esi
 7d5:	5f                   	pop    %edi
 7d6:	5d                   	pop    %ebp
 7d7:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 7d8:	8b 08                	mov    (%eax),%ecx
 7da:	89 0a                	mov    %ecx,(%edx)
 7dc:	eb e9                	jmp    7c7 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7de:	c7 05 00 0b 00 00 04 	movl   $0xb04,0xb00
 7e5:	0b 00 00 
    base.s.size = 0;
 7e8:	ba 04 0b 00 00       	mov    $0xb04,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7ed:	c7 05 04 0b 00 00 04 	movl   $0xb04,0xb04
 7f4:	0b 00 00 
    base.s.size = 0;
 7f7:	c7 05 08 0b 00 00 00 	movl   $0x0,0xb08
 7fe:	00 00 00 
 801:	e9 46 ff ff ff       	jmp    74c <malloc+0x2c>
