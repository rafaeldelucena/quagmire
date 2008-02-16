# configuration.mk - Handle the configuration files.

# quagmire/config.status SPEC
# Rebuild a single file generated by AC_CONFIG_FILES.
# SPEC is the argument to that macro, after splitting on ":"s.
define quagmire/config.status

$(firstword $(1)): $(or $(wordlist 2,$(words $(1)),$(1)),$(1).in) config.status
	./config.status $$@

distclean/$(firstword $(1)):
	rm -f $(firstword $(1))
.PHONY: distclean/$(firstword $(1))
distclean: distclean/$(firstword $(1))

endef

config.status: configure
	./config.status --recheck

distclean/config.status:
	rm -rf config.status config.log autom4te.cache
.PHONY: distclean/config.status
distclean: distclean/config.status
