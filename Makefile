PROJECT = minorkey
DEPS = lager

include erlang.mk

ERLC_COMPILE_OPTS = +'{parse_transform, lager_transform}'

ERLC_OPTS += $(ERLC_COMPILE_OPTS)
TEST_ERLC_OPTS += $(ERLC_COMPILE_OPTS)

console: all rel
	_rel/minorkey_release/bin/minorkey_release console
