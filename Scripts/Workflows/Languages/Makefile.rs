FLAGS	= --verbose -g
TARGET 	= hello

$(TARGET).out : $(TARGET).rs
	rustc $(TARGET).rs -o $(TARGET).out $(FLAGS)

run: $(TARGET).out
	./$(TARGET).out

clean :
	rm *.out

