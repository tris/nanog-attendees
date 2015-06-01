EARLY_NANOGS = 8 9 11
NANOGS = 12 13 14 15 16 17 18 19 20 21 22 23 24 26 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52
ARO_NANOGS = 53 54 55 56 57 58 59 60 61 62 63 64
DATA_DIR = data
EARLY_NANOG_DATA = $(EARLY_NANOGS:%=$(DATA_DIR)/nanog%)
NANOG_DATA = $(NANOGS:%=$(DATA_DIR)/nanog%)
ARO_NANOG_DATA = $(ARO_NANOGS:%=$(DATA_DIR)/nanog%)
ALL_NANOG_DATA = $(EARLY_NANOG_DATA) $(NANOG_DATA) $(ARO_NANOG_DATA)
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

$(DATA_DIR):
	mkdir -p $(DATA_DIR)

$(EARLY_NANOG_DATA): $(DATA_DIR)
	curl -so $@ http://www.nanog.org/meetings/$(@:$(DATA_DIR)/%=%)/registrants

$(NANOG_DATA): $(DATA_DIR)
	curl -so $@ http://www.nanog.org/meetings/$(@:$(DATA_DIR)/%=%)/attendees

$(DATA_DIR)/nanog53: $(DATA_DIR)
	curl -so $@ 'https://secretariat.nanog.org/ibin/c5i?mid=5&rid=99&k1=1011'

$(DATA_DIR)/nanog54: $(DATA_DIR)
	curl -so $@ 'https://secretariat.nanog.org/ibin/c5i?mid=5&rid=99&k1=1028'

$(DATA_DIR)/nanog55: $(DATA_DIR)
	curl -so $@ 'https://secretariat.nanog.org/ibin/c5i?mid=5&rid=99&k1=1032'

$(DATA_DIR)/nanog56: $(DATA_DIR)
	curl -so $@ 'https://secretariat.nanog.org/ibin/c5i?mid=5&rid=99&k1=1029'

$(DATA_DIR)/nanog57: $(DATA_DIR)
	curl -so $@ 'https://secretariat.nanog.org/ibin/c5i?mid=5&rid=99&k1=1033'

$(DATA_DIR)/nanog58: $(DATA_DIR)
	curl -so $@ 'https://secretariat.nanog.org/ibin/c5i?mid=5&rid=99&k1=1034'

$(DATA_DIR)/nanog59: $(DATA_DIR)
	curl -so $@ 'https://secretariat.nanog.org/ibin/c5i?mid=5&rid=99&k1=1036'

$(DATA_DIR)/nanog60: $(DATA_DIR)
	curl -so $@ 'https://secretariat.nanog.org/ibin/c5i?mid=5&rid=99&k1=1039'

$(DATA_DIR)/nanog61: $(DATA_DIR)
	curl -so $@ 'https://secretariat.nanog.org/ibin/c5i?mid=5&rid=99&k1=1041'
#also https://www.nanog.org/sites/default/files/sites/default/files/Attendee%20List.pdf

$(DATA_DIR)/nanog62: $(DATA_DIR)
	curl -so $@ 'https://secretariat.nanog.org/ibin/c5i?mid=5&rid=99&k1=1042'
#also https://www.nanog.org/sites/default/files/sites/default/files/N62%20Attendees.pdf

$(DATA_DIR)/nanog63: $(DATA_DIR)
	curl -so $@ 'https://secretariat.nanog.org/ibin/c5i?mid=5&rid=99&k1=1045'

$(DATA_DIR)/nanog64: $(DATA_DIR)
	curl -so $@ 'https://secretariat.nanog.org/ibin/c5i?mid=5&rid=99&k1=1057'

top-attendees.txt: nanog-top $(ALL_NANOG_DATA)
	$(ROOT_DIR)/nanog-top $(ALL_NANOG_DATA) > $@ || rm -f $@

all: top-attendees.txt
