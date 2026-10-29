ifeq ($(OS),Windows_NT)
    NIM_CC= $(USERPROFILE)\LocalSoft\nim-2.4.0\bin\nim.exe
    OUT= flpc.exe
else
    NIM_CC= nim
    OUT= flpc
endif

$(OUT): flpc.nim
	$(NIM_CC) c --gc:orc -d:danger flpc.nim

clean:
	rm -f $(OUT)
