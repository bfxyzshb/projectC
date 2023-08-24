#https://www.cnblogs.com/paul-617/p/15501875.html
.PHONY:all clean
MKDIR=mkdir
RM=rm
RMFLAGS=-fr
CC=gcc
 
DIR_OBJS=objs
DIR_TMP = tmp
DIR_EXE=exes
DIR_DEPS=deps
DIRS=$(DIR_OBJS) $(DIR_EXE) $(DIR_DEPS)
EXE=test
EXE:=$(addprefix $(DIR_EXE)/, $(EXE))
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)
OBJS:=$(addprefix $(DIR_OBJS)/, $(OBJS))
DEPS=$(SRCS:.c=.dep)
DEPS:=$(addprefix $(DIR_DEPS)/, $(DEPS))
 
all: $(EXE)
 
-include $(DEPS)
 
$(DIRS):
	$(MKDIR) $@
$(EXE):$(DIR_EXE) $(OBJS)
	$(CC) -o $@ $(filter %.o, $^)
$(DIR_OBJS)/%.o:$(DIR_OBJS)
	@echo "--------$^"
	$(CC) -o $@ -c $(filter %.c, $^)
$(DIR_DEPS)/%.dep:$(DIR_DEPS) %.c
	@echo "Making $@"
	@set -e; \
	$(RM) $(RMFLAGS) $@.tmp ; \
	$(CC) -E -MM $(filter %.c, $^) > $@.tmp ; \
	sed 's,\(.*\)\.o[ :]*,objs/\1.o: ,g' < $@.tmp > $@ ; \
	$(RM) $(RMFLAGS) $@.tmp
clean:
	$(RM) $(RMFLAGS) $(DIRS)