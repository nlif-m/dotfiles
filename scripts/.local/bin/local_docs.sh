#!/bin/sh
# NAME: local_docs.sh
# DEPENDENCY: python -m http.server,$BROWSER
# PACMAN: python-docs,gtk3-docs,gtk4-docs
# APT:
# DESCRIPTION: Open local docs with $BROWSER
set -xe

address=127.0.0.1

PYTHON_=python
PYTHON_DOCS_DIR=/usr/share/doc/python/html
PYTHON_PORT=31235

GTK3_DOCS_DIR=/usr/share/gtk-doc/html/gtk3
GTK3_PORT=31236

GTK4_DOCS_DIR=/usr/share/doc/gtk4
GTK4_PORT=31237

python_docs()
{
    PORT="${PYTHON_PORT}"
    DOCS_DIR="${PYTHON_DOCS_DIR}"
}

gtk3_docs()
{
    PORT="${GTK3_PORT}"
    DOCS_DIR="${GTK3_DOCS_DIR}"
}


gtk4_docs()
{
    PORT="${GTK4_PORT}"
    DOCS_DIR="${GTK4_DOCS_DIR}"
}

choose=$(printf "python\n3gtk\n4gtk" | dmenu -i -l 5 -p "What docs you want ?")
case "${choose}" in
    python ) python_docs ;;
    3gtk    ) gtk3_docs    ;;
    4gtk    ) gtk4_docs    ;;
esac

run_server_and_browser()
{
    ("${BROWSER}" "${address}:${PORT=}" &) || exit 2
    eval "${command}" || exit 1
}

command="${PYTHON_} -m http.server --bind ${address} --directory ${DOCS_DIR} ${PORT}"
result=$(pgrep -i -u "${USER}"  -a -f "${command}") || run_server_and_browser
kill "$(echo ${result} | cut -d ' ' -f 1)"
