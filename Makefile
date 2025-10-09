FILEDESTDIR=~/Library/Developer/Xcode/Templates/File\ Templates/
SNIPDESTDIR=~/Library/Developer/Xcode/UserData/CodeSnippets

SNIPPETS=./codesnippets/*.codesnippet
FILETEMPLATES=./file-templates/*

install:
	mkdir -p $(FILEDESTDIR)
	mkdir -p $(SNIPDESTDIR)
	cp -R $(SNIPPETS) $(SNIPDESTDIR)
	cp -R $(FILETEMPLATES) $(FILEDESTDIR)

