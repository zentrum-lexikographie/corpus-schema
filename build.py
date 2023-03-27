#!/usr/bin/env python3

from os import getcwd
from pathlib import Path
from subprocess import check_output, check_call

uid = check_output(['id', '-u'], text=True).strip()
gid = check_output(['id', '-g'], text=True).strip()

def tei_stylesheets(*args):
    check_call(
        ['docker',
         'run', '-it', '--rm',
         '-u', ':'.join([uid, gid]),
         '-v', f'{getcwd()}:/work',
         'gremid/tei-stylesheets-action:7.54.0.1'] +
        list(args)
    )

Path('public').mkdir(exist_ok=True)

tei_stylesheets(
    'teitorelaxng', '/work/zdl.odd', '/work/public/zdl.rng'
)
tei_stylesheets(
    'teitornc', '/work/zdl.odd', '/work/public/zdl.rnc'
)
tei_stylesheets(
    'teitoschematron', '--odd', '/work/zdl.odd', '/work/public/zdl.sch.xsl'
)
