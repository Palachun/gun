# See LICENSE for licensing information.

PROJECT = gun
PROJECT_DESCRIPTION = HTTP/1.1, HTTP/2 and Websocket client for Erlang/OTP.
PROJECT_VERSION = 1.0.0-pre.2

# Options.

PLT_APPS = ssl
CT_OPTS += -pa test -ct_hooks gun_ct_hook [] # -boot start_sasl

CI_OTP ?= OTP-18.0.3 OTP-18.1.5 OTP-18.2.4.1 OTP-18.3.4.4 OTP-19.0.7 OTP-19.1.6
#CI_HIPE ?= $(lastword $(CI_OTP))
#CI_ERLLVM ?= $(CI_HIPE)

# Dependencies.

LOCAL_DEPS = ssl

DEPS = cowlib ranch
dep_cowlib = git https://github.com/ninenines/cowlib e4da2077723a26301de516c8da9b0b330545b5af
dep_ranch = git https://github.com/ninenines/ranch master

TEST_DEPS = ct_helper
dep_ct_helper = git https://github.com/extend/ct_helper.git master

# Standard targets.

include erlang.mk

# Generate rebar.config on build.

app:: rebar.config
