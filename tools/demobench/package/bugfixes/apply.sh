#!/bin/sh

BASEDIR=$(dirname $0)
SOURCDIR=$BASEDIR/java
BUILDDIR=$BASEDIR/build
RTJAR=$1

if [ -z "$RTJAR" ]; then
    echo "Need location of rt.jar"
    exit 1
elif [ $(basename $RTJAR) != "rt.jar" ]; then
    echo "File is not rt.jar"
    exit 1
elif [ ! -f $RTJAR ]; then
    echo "rt.jar not found"
    exit 1
fi

rm -rf $BUILDDIR && mkdir $BUILDDIR
if (javac -O -d $BUILDDIR $(find $SOURCEDIR -name "*.java")); then
    chmod u+w $RTJAR
    jar uvf $RTJAR -C $BUILDDIR .
    chmod ugo-w $RTJAR
fi

