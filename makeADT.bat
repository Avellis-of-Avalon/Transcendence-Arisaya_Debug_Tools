@ECHO off
REN _Transcendence.tdb Transcendence.tdb
IF NOT EXIST _TDB (MD _TDB)
IF NOT EXIST _IMPORT (MD _IMPORT)

CD ..\DDR_Library
ECHO "========================================================================"
ECHO "===========================     DDR Lib    ============================="
ECHO "========================================================================"
CALL MakeDDR.bat
COPY _TDB\DDR_Library.tdb ..\ADT_Extension\_IMPORT\DDR_Library.tdb

CD ..\ADT_Extension
ECHO "========================================================================"
ECHO "===========================     ADT Ext    ============================="
ECHO "========================================================================"
TransCompiler.exe /input:ADT_Extension.xml /output:_TDB/ADT_Extension.tdb /entities:_IMPORT/DDR_Library.tdb

REN Transcendence.tdb _Transcendence.tdb
@ECHO on