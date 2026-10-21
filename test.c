#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>

/* mandatory */
size_t	ft_strlen(const char *s);
int		ft_strcmp(const char *s1, const char *s2);
char	*ft_strcpy(char *dst, const char *src);
char	*ft_strdup(const char *s);
ssize_t	ft_read(int fd, char *buf, size_t len);
ssize_t	ft_write(int fd, char *buf, size_t len);

static void	test_strlen(void)
{
	printf("\n=== STRLEN ===\n");
	const char	*tests[] = {
		"",
		"f",
		"Hello, World!",
		"The quick brown fox jumps over the lazy dogThe quick brown fox jumps over the lazy dogThe quick brown fox jumps over the lazy dogThe quick brown fox jumps over the lazy dogThe quick brown fox jumps over the lazy dogThe quick brown fox jumps over the lazy dog",
		NULL
	};
	for (int i = 0; tests[i]; i++)
	{
		size_t	_asm = ft_strlen(tests[i]), _c = strlen(tests[i]);
		printf("libasm: %ld, libc: %ld\n", _asm, _c);
	}
}

static void	test_strcmp(void)
{
	printf("\n=== STRCMP ===\n");
	char	*tests[][2] = {
		{"", ""},
		{"abc", "abc"},
		{"abc", "abd"},
		{"", "42"},
		{"42", ""},
		{"test\200", "test\0"},
		{NULL, NULL}
	};
	for (int i = 0; tests[i][0]; i++)
	{
		int _asm = ft_strcmp(tests[i][0], tests[i][1]), _c = strcmp(tests[i][0], tests[i][1]);
		printf("libasm: %d, libc: %d\n", _asm, _c);
	}
}

static void	test_strcpy(void)
{
	printf("\n=== STRCPY ===\n");
	const char	*tests[] = {
		"",
		"f",
		"Hello, World!",
		"The quick brown fox jumps over the lazy dog.",
		NULL
	};
	size_t	bufsize = 100;
	char	_asm[bufsize], _c[bufsize];
	for (int i = 0; tests[i]; i++)
	{
		memset(_asm, 'A', sizeof(_asm));
		memset(_c, 'A', sizeof(_c));
		ft_strcpy(_asm, tests[i]);
		strcpy(_c, tests[i]);
		printf("libasm: %s, libc: %s\n", _asm, _c);
	}
}

static void test_strdup(void)
{
    printf("\n=== TEST: ft_strdup ===\n");
    const char *tests[] = {"", "a", "libasm 42", "The quick brown fox jumps over the lazy dog.", NULL};
    for (int i = 0; tests[i]; i++)
    {
        char *real = strdup(tests[i]);
        char *mine = ft_strdup(tests[i]);
        int ok = (mine && strcmp(real, mine) == 0);
        printf("\"%s\" -> \"%s\" [%s]\n", tests[i], mine ? mine : "NULL", ok ? "OK" : "FAIL");
        free(real);
        free(mine);
    }
}

static void test_write(void)
{
	printf("\n=== WRITE ===\n");

	/* std write */
	char str[] = "stdout write\n";
	ssize_t ret = ft_write(1, str, strlen(str));
	printf("ft_write return value: %zd\n", ret);

	/* error invalid fd + errno */
	errno = 0;
	ssize_t r_real = write(-1, "test", 4);
	int e_real = errno;

	errno = 0;
	ssize_t r_mine = ft_write(-1, "test", 4);
	int e_mine = errno;

	printf("[fd = -1] libc: ret=%zd, errno=%d | libasm: ret=%zd, errno=%d -> %s\n",
			r_real, e_real, r_mine, e_mine,
			(r_real == r_mine && e_real == e_mine) ? "OK" : "FAIL");
}

static void	test_read(void)
{
	printf("\n=== READ ===\n");

	/* read from temp file */
	int fd = open("/tmp/libasm_test.txt", O_CREAT | O_RDWR | O_TRUNC, 0644);
	write(fd, "0123456789", 10);
	lseek(fd, 0, SEEK_SET);

	char buf[11] = {0};
	ssize_t ret = ft_read(fd, buf, 10);
	close(fd);
	unlink("/tmp/libasm_test.txt");

	printf("Lu: \"%s\" (ret=%zd) -> %s\n", buf, ret, (ret == 10 && strcmp(buf, "0123456789") == 0) ? "OK" : "FAIL");

	/* invalid fd + errno */
	errno = 0;
	ssize_t r_real = read(-42, buf, 5);
	int e_real = errno;

	errno = 0;
	ssize_t r_mine = ft_read(-42, buf, 5);
	int e_mine = errno;

	printf("[fd = -42] libc: ret=%zd, errno=%d | libasm: ret=%zd, errno=%d -> %s\n",
			r_real, e_real, r_mine, e_mine,
			(r_real == r_mine && e_real == e_mine) ? "OK" : "FAIL");
}

int		main(void)
{
	test_write();
	test_read();
	test_strlen();
	test_strcmp();
	test_strcpy();
	test_strdup();
	return (0);
}
