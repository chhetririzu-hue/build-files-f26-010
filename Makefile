# Build for srccomplexity

.PHONY:all
all : srccomplexity srcMLXPathCountTest

srccomplexity : srcComplexity.o srcMLXPathCount.o
	g++ srcComplexity.o srcMLXPathCount.o -lxml2 -o srccomplexity

srcComplexity.o : srcComplexity.cpp srcMLXPathCount.hpp
	g++ -c srcComplexity.cpp

srcMLXPathCount.o : srcMLXPathCount.cpp srcMLXPathCount.hpp
	g++ -I/usr/include/libxml2 -c srcMLXPathCount.cpp

srcMLXPathCountTest : srcMLXPathCountTest.o srcMLXPathCount.o
	g++ srcMLXPathCountTest.o srcMLXPathCount.o -lxml2 -o srcMLXPathCountTest

srcMLXPathCountTest.o : srcMLXPathCountTest.cpp srcMLXPathCount.hpp
	g++ -c srcMLXPathCountTest.cpp

.PHONY:run
run : srccomplexity
	./srccomplexity srcMLXPathCount.cpp.xml

.PHONY:test 
test: srcMLXPathCountTest
	./srcMLXPathCountTest

.PHONY:clean
clean :
	@rm -f srcComplexity.o srcMLXPathCount.o srcMLXPathCountTest.o srccomplexity srcMLXPathCountTest
