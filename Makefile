BUILD_DIR=objs
DIR_DEPS=deps
MKDIR=mkdir
RMFLAGS=-fr
SRCS := Cbase/funcPointDev/funcPoint.c Cbase/mmsetDev/memsetTest.c Cbase/test/test.c defineTest/defineTest.cpp dev_entern/dev.cpp forkTest/forkTest.cpp funcPointer/funcPointer.cpp funcPointer/testFuncPointer.cpp
C_SRCS = $(filter %.c,$(SRCS))
CXX_SRCS = $(filter %.cpp,$(SRCS))


DIRS=$(DIR_DEPS)
C_DEPS=$(SRCS:.c=.dep)
C_DEPS:=$(addprefix $(DIR_DEPS)/, $(C_DEPS))
CPP_DEPS=$(SRCS:.cpp=.dep)
CPP_DEPS:=$(addprefix $(DIR_DEPS)/, $(CPP_DEPS))

C_OBJS := $(patsubst %.c,$(BUILD_DIR)/%.o,$(C_SRCS))
CXX_OBJS := $(patsubst %.cpp,$(BUILD_DIR)/%.o,$(CXX_SRCS))


 
CC = gcc
CXX = g++
AR = ar crs
 
ASAN_FLAGS :=-g -fno-omit-frame-pointer -fsanitize=address -std=gnu99
 
INCLUDE = -I./deps
CFLAGS += -fPIC $(ASAN_FLAGS) $(INCLUDE)
CXXFLAGS += -fPIC $(ASAN_FLAGS) $(INCLUDE)
SHARE = -fPIC -shared
#SO_LDFLAGS += -lglfw
 
FIBERCV_LIB:=$(BUILD_DIR)/libfibercv.a
FIBERCV_SO:=$(BUILD_DIR)/libfibercv.so
DEMO=$(BUILD_DIR)/demo
 
#all: $(FIBERCV_LIB) $(DEMO)
all: $(FIBERCV_SO) $(DEMO) $(DIRS)
-include $(C_DEPS)
-include $(CPP_DEPS)
$(DIRS):
	$(MKDIR) $@
 
info:
	@echo "C_SRCS:" $(C_SRCS)
	@echo "CXX_SRCS:" $(CXX_SRCS)
	@echo "C_OBJS:" $(C_OBJS)
	@echo "CXX_OBJS:" $(CXX_OBJS)
 
#-----------------------
# fibercv static library
#-----------------------
$(FIBERCV_LIB): $(CXX_OBJS) $(C_OBJS)
	@echo "FIBERCV_LIB"
	$(AR) $@ $^
 
$(BUILD_DIR)/%.o: %.cpp
	@echo "=====$@"
	@echo "=====$^"
	mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $(filter %.cpp, $^) -o $@
 
$(BUILD_DIR)/%.o: %.c
	mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $(filter %.c, $^) -o $@

$(DIR_DEPS)/%.dep:$(DIR_DEPS) %.c
	@echo "Making $(@D)"
	@set -e; \

	mkdir -p $(@D); \
	$(RM) $(RMFLAGS) $@.tmp ; \
	$(CC) -E -MM $(filter %.c, $^) > $@.tmp ; \
	sed 's,\(.*\)\.o[ :]*,$(@D)/\1.o: ,g' < $@.tmp > $@ ; \
	sed -i 's/deps/objs/g' $@ ; \
	$(RM) $(RMFLAGS) $@.tmp

$(DIR_DEPS)/%.dep:$(DIR_DEPS) %.cpp
	@echo "Making $@"
	@set -e; \

	mkdir -p $(@D); \
	$(RM) $(RMFLAGS) $@.tmp ; \
	$(CC) -E -MM $(filter %.cpp, $^) > $@.tmp ; \
	sed 's,\(.*\)\.o[ :]*,$(@D)/\1.o: ,g' < $@.tmp > $@ ; \
	sed -i 's/deps/objs/g' $@ ; \
	$(RM) $(RMFLAGS) $@.tmp

 
#-----------------------
# fibercv shared library
#-----------------------
$(FIBERCV_SO): $(CXX_OBJS) $(C_OBJS)
	$(CXX) $(SHARE) $^ -o $@
 
#-----------------------
# demo executable
#-----------------------
DEMO_SRCS := ./main.cpp
DEMO_CXXFLAGS := -I./
DEMO_LDFLAGS := -lfibercv -Lobjs/ -ldl -lasan -lpthread -o objs/demo
$(DEMO): $(DEMO_SRCS)
	$(CXX) $(DEMO_CXXFLAGS) $^ $(DEMO_LDFLAGS) -o $@
 
.PHONY:
clean:
	rm -f $(C_OBJS)
	rm -f $(CXX_OBJS)
	rm -f $(FIBERCV_LIB)
	rm -f $(FIBERCV_SO)
	rm -f $(DEMO)
	rm -rf $(DIR_DEPS)