mods: \
bin/mods/mcpp_command.dll \
bin/mods/mcpp_command_chat_log.dll \
bin/mods/mcpp_command_kick.dll \
bin/mods/mcpp_command_op.dll \
bin/mods/mcpp_command_time.dll \
bin/mods/mcpp_command_whisper.dll \


#	COMMAND
	
	
bin/mods/mcpp_command.dll: \
$(MOD_OBJ) \
obj/command/main.o | \
$(MOD_LIB) \
bin/mods/mcpp_chat.dll
	$(GPP) -shared -o $@ $^ $(MOD_LIB) bin/mods/mcpp_chat.dll
	
	
COMMAND_LIB:=$(MOD_LIB) bin/mods/mcpp_chat.dll bin/mods/mcpp_command.dll


#	SERVER LOG THROUGH CHAT


bin/mods/mcpp_command_chat_log.dll: \
$(MOD_OBJ) \
obj/log/main.o | \
$(COMMAND_LIB) \
bin/mods/mcpp_op.dll \
bin/data_provider.dll
	$(GPP) -shared -o $@ $^ $(COMMAND_LIB) bin/mods/mcpp_op.dll bin/data_provider.dll
	
	
#	KICK


bin/mods/mcpp_command_kick.dll: \
$(MOD_OBJ) \
obj/kick/main.o | \
$(COMMAND_LIB) \
bin/mods/mcpp_op.dll
	$(GPP) -shared -o $@ $^ $(COMMAND_LIB) bin/mods/mcpp_op.dll
	
	
#	OP/DEOP


bin/mods/mcpp_command_op.dll: \
$(MOD_OBJ) \
obj/op/command.o | \
$(COMMAND_LIB) \
bin/mods/mcpp_op.dll
	$(GPP) -shared -o $@ $^ $(COMMAND_LIB) bin/mods/mcpp_op.dll
	
	
#	DISPLAY TIME


bin/mods/mcpp_command_time.dll: \
$(MOD_OBJ) \
obj/time/display.o | \
$(COMMAND_LIB) \
bin/mods/mcpp_time.dll
	$(GPP) -shared -o $@ $^ $(COMMAND_LIB) bin/mods/mcpp_time.dll
	
	
#	WHISPERS
	
	
bin/mods/mcpp_command_whisper.dll: \
$(MOD_OBJ) \
obj/whisper/main.o | \
$(COMMAND_LIB)
	$(GPP) -shared -o $@ $^ $(COMMAND_LIB)
	
	