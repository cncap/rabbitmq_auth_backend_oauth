PROJECT = rabbitmq_auth_backend_oauth

DEPS = cowboy rabbitmq_web_dispatch rabbit_common oauth2 erlydtl
TEST_DEPS = rabbit

DEP_PLUGINS = rabbit_common/mk/rabbitmq-plugin.mk

# FIXME: Use erlang.mk patched for RabbitMQ, while waiting for PRs to be
# reviewed and merged.

ERLANG_MK_REPO = https://github.com/rabbitmq/erlang.mk.git
ERLANG_MK_COMMIT = rabbitmq-tmp

include rabbitmq-components.mk
include erlang.mk


WITH_BROKER_TEST_COMMANDS:= \
	rabbit_oauth2_backend_test:broker_tests() \
	rabbit_oauth2_auth_test:tests()

STANDALONE_TEST_COMMANDS := \
	rabbit_oauth2_backend_test:standalone_tests()
