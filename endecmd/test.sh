#!/bin/bash
KEY="123456789012345678901234567890"
SRC="Testing_source_words_for_libendetool_and_endecmd."
ENDECMD=bin/endecmd

TESTRUN=$(shell ${ENDECMD} --help )

# test is it compiled.
if [ "${TESTRUN}" == "" ];then
    echo "Build ${ENDECMD} first"
    echo "${TESTRUN}"
    exit 0
fi

ENCDATA=$(shell ${ENDECMD} --key=${KEY} --verboseoff ${SRC})
DECDATA=$(shell bin/endecmd --key=${KEY} --decode --verboseoff ${ENCDATA})
COMENCDATA=$(shell ${ENDECMD} --key=${KEY} --verboseoff --compress ${SRC})
COMDECDATA=$(shell ${ENDECMD} --key=${KEY} --verboseoff --decode --compress ${COMENCDATA})

echo "source : ${SRC}"
echo "key : ${KEY}"
echo "encoded : ${ENCDATA}"
echo "decoded : ${DECDATA}"
echo "compressing encoded : ${COMENCDATA}"
echo "compressing decoded : ${COMDECDATA}"