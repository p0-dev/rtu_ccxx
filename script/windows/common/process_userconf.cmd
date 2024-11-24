:: ***************************************************************************************
:: PROCESSING USER CONFIGURATION FILE
:: ***************************************************************************************
:: @name      : process_userconf.cmd
:: @desc      : processing user configuration
:: @location  : project_root_dir/script/windows/common
:: @note      : tested on Windows 10
:: ***************************************************************************************


:: =======================================================================================
:: Pre-Processing
:: ---------------------------------------------------------------------------------------
@echo off
set HERE=%cd%


:: =======================================================================================
:: Standard Variable
:: ---------------------------------------------------------------------------------------
set STD_TRUE=1
set STD_FALSE=0

set STD_RETURN_OK=0
set STD_RETURN_FAIL=1


:: =======================================================================================
:: Standard Variable
:: ---------------------------------------------------------------------------------------
set local_debug=%STD_FALSE%


:: =======================================================================================
:: Definition User Configuration File
:: ---------------------------------------------------------------------------------------
:: Navigating to PJT_ROOT_DIR_PATH
cd ..
cd ..

:: User Configuration File
set USERCONF_FILE=%cd%\userconf.cfg

:: Validation
if not exist %USERCONF_FILE% (
  echo -- [Error][Process] USERCONF_FILE: %USERCONF_FILE%: not existed
  exit /b %STD_RETURN_FAIL%
)

:: Debug
if %STD_TRUE% == %local_debug% (
  echo -- [Debug][Process] USERCONF_FILE: %USERCONF_FILE%
)


:: =======================================================================================
:: Processing User Configuration File
:: ---------------------------------------------------------------------------------------
for /f "tokens=1,2 delims==" %%A in (%USERCONF_FILE%) do (
  set %%A=%%B

  if %STD_TRUE% == %local_debug% (
    echo %%A=%%B
  )  
)


:: =======================================================================================
:: User Configuration Validation
:: ---------------------------------------------------------------------------------------
:: PJT_ROOT_DIR_PATH
if "" == "%PJT_ROOT_DIR_PATH%" (
  echo -- [Error][Process] PJT_ROOT_DIR_PATH is not set.
  exit /b %STD_RETURN_FAIL%
)

if not exist %PJT_ROOT_DIR_PATH% (
  echo -- [Error][Process] PJT_ROOT_DIR_PATH is not existed.
  exit /b %STD_RETURN_FAIL%
)

if %STD_TRUE% == %local_debug% (
  echo -- [Debug][Process] PJT_ROOT_DIR_PATH is valid.
)

:: PJT_NAME
if "" == "%PJT_NAME%" (
  echo -- [Error][Process] PJT_NAME is not set.
  exit /b %STD_RETURN_FAIL%
)

:: PJT_BUILD_DIR_NAME
if "" == "%PJT_BUILD_DIR_NAME%" (
  echo -- [Error][Process] PJT_BUILD_DIR_NAME is not set.
  exit /b %STD_RETURN_FAIL%
)

:: PJT_DF_INSTALL_DIR_NAME
if "" == "%PJT_DF_INSTALL_DIR_NAME%" (
  echo -- [Error][Process] PJT_DF_INSTALL_DIR_NAME is not set.
  exit /b %STD_RETURN_FAIL%
)

:: PJT_DF_GRAPH_DIR_NAME
if "" == "%PJT_DF_GRAPH_DIR_NAME%" (
  echo -- [Error][Process] PJT_DF_GRAPH_DIR_NAME is not set.
  exit /b %STD_RETURN_FAIL%
)

:: PJT_BUILD_TYPE
if "" == "%PJT_BUILD_TYPE%" (
  echo -- [Error][Process] PJT_BUILD_TYPE is not set.
  exit /b %STD_RETURN_FAIL%
)

:: BUILDSYS_TOOLCHAIN_DEF_FILE
if "" == "%BUILDSYS_TOOLCHAIN_DEF_FILE%" (
  echo -- [Error][Process] BUILDSYS_TOOLCHAIN_DEF_FILE is not set.
  exit /b %STD_RETURN_FAIL%
)

if not exist %BUILDSYS_TOOLCHAIN_DEF_FILE% (
  echo -- [Error][Process] BUILDSYS_TOOLCHAIN_DEF_FILE is not existed.
  exit /b %STD_RETURN_FAIL%
)

if %STD_TRUE% == %local_debug% (
  echo -- [Debug][Process] BUILDSYS_TOOLCHAIN_DEF_FILE is valid.
)

:: BUILDSYS_BIN_DIR_PATH
if "" == "%BUILDSYS_BIN_DIR_PATH%" (
  echo -- [Error][Process] BUILDSYS_BIN_DIR_PATH is not set.
  exit /b %STD_RETURN_FAIL%
)

if not exist %BUILDSYS_BIN_DIR_PATH% (
  echo -- [Error][Process] BUILDSYS_BIN_DIR_PATH is not existed.
  exit /b %STD_RETURN_FAIL%
)

if %STD_TRUE% == %local_debug% (
  echo -- [Debug][Process] BUILDSYS_BIN_DIR_PATH is valid.
)

:: BUILDSYS_EXE
if "" == "%BUILDSYS_EXE%" (
  echo -- [Error][Process] BUILDSYS_EXE is not set.
  exit /b %STD_RETURN_FAIL%
)

if not exist %BUILDSYS_BIN_DIR_PATH%/%BUILDSYS_EXE% (
  echo -- [Error][Process] BUILDSYS_EXE is not existed.
  exit /b %STD_RETURN_FAIL%
)

if %STD_TRUE% == %local_debug% (
  echo -- [Debug][Process] BUILDSYS_EXE is valid.
)

:: BUILDSYS_GENERATOR_NAME
if "" == "%BUILDSYS_GENERATOR_NAME%" (
  echo -- [Error][Process] BUILDSYS_GENERATOR_NAME is not set.
  exit /b %STD_RETURN_FAIL%
)

:: BUILDGEN_BIN_DIR_PATH
if "" == "%BUILDGEN_BIN_DIR_PATH%" (
  echo -- [Error][Process] BUILDGEN_BIN_DIR_PATH is not set.
  exit /b %STD_RETURN_FAIL%
)

if not exist %BUILDGEN_BIN_DIR_PATH% (
  echo -- [Error][Process] BUILDGEN_BIN_DIR_PATH is not existed.
  exit /b %STD_RETURN_FAIL%
)

if %STD_TRUE% == %local_debug% (
  echo -- [Debug][Process] BUILDGEN_BIN_DIR_PATH is valid.
)

:: BUILDGEN_EXE
if "" == "%BUILDGEN_EXE%" (
  echo -- [Error][Process] BUILDGEN_EXE is not set.
  exit /b %STD_RETURN_FAIL%
)

if not exist %BUILDGEN_BIN_DIR_PATH%/%BUILDGEN_EXE% (
  echo -- [Error][Process] BUILDGEN_BIN_DIR_PATH is not existed.
  exit /b %STD_RETURN_FAIL%
)

if %STD_TRUE% == %local_debug% (
  echo -- [Debug][Process] BUILDGEN_EXE is valid.
)

:: BUILDGRAPH_SUPPORT_ENABLE
if "" == "%BUILDGRAPH_SUPPORT_ENABLE%" (
  echo -- [Error][Process] BUILDGRAPH_SUPPORT_ENABLE is not set.
  exit /b %STD_RETURN_FAIL%
)

if not %STD_TRUE% == %BUILDGRAPH_SUPPORT_ENABLE% (
  if not %STD_FALSE% == %BUILDGRAPH_SUPPORT_ENABLE% (
    echo -- [Error][Process] BUILDGRAPH_SUPPORT_ENABLE is not valid.
    exit /b %STD_RETURN_FAIL%
  )
)

if %STD_TRUE% == %local_debug% (
  echo -- [Debug][Process] BUILDGRAPH_SUPPORT_ENABLE is valid.
)

if %STD_TRUE% == %BUILDGRAPH_SUPPORT_ENABLE% (
  :: BUILDGRAPH_BIN_DIR_PATH
  if "" == "%BUILDGRAPH_BIN_DIR_PATH%" (
    echo -- [Error][Process] BUILDGRAPH_BIN_DIR_PATH is not set.
    exit /b %STD_RETURN_FAIL%
  )

  if not exist %BUILDGRAPH_BIN_DIR_PATH% (
    echo -- [Error][Process] BUILDGRAPH_BIN_DIR_PATH is not existed.
    exit /b %STD_RETURN_FAIL%
  )

  if %STD_TRUE% == %local_debug% (
    echo -- [Debug][Process] BUILDGRAPH_BIN_DIR_PATH is valid.
  )

  :: BUILDGRAPH_RESULT_FILE
  if "" == "%BUILDGRAPH_RESULT_FILE%" (
    echo -- [Error][Process] BUILDGRAPH_RESULT_FILE is not set.
    exit /b %STD_RETURN_FAIL%
  )
)

:: TOOLCHAIN_BIN_DIR_PATH
if "" == "%TOOLCHAIN_BIN_DIR_PATH%" (
  echo -- [Error][Process] TOOLCHAIN_BIN_DIR_PATH is not set.
  exit /b %STD_RETURN_FAIL%
)

if not exist %TOOLCHAIN_BIN_DIR_PATH% (
  echo -- [Error][Process] TOOLCHAIN_BIN_DIR_PATH is not existed.
  exit /b %STD_RETURN_FAIL%
)

if %STD_TRUE% == %local_debug% (
  echo -- [Debug][Process] TOOLCHAIN_BIN_DIR_PATH is valid.
)

:: BUILDGEN_PARALLEL_PROCESSES
if "" == "%BUILDGEN_PARALLEL_PROCESSES%" (
  echo -- [Error][Process] BUILDGEN_PARALLEL_PROCESSES is not set.
  exit /b %STD_RETURN_FAIL%
)

:: BUILDGRAPH_CONVERT_FORMAT
if "" == "%BUILDGRAPH_CONVERT_FORMAT%" (
  echo -- [Error][Process] BUILDGRAPH_CONVERT_FORMAT is not set.
  exit /b %STD_RETURN_FAIL%
)


:: =======================================================================================
:: Set Environment Variable
:: ---------------------------------------------------------------------------------------
:: BUILDSYS_BIN_DIR_PATH
set Path=%Path%;%BUILDSYS_BIN_DIR_PATH%

:: BUILDGEN_BIN_DIR_PATH
set Path=%Path%;%BUILDGEN_BIN_DIR_PATH%

:: BUILDGRAPH_BIN_DIR_PATH
set Path=%Path%;%BUILDGRAPH_BIN_DIR_PATH%

:: TOOLCHAIN_BIN_DIR_PATH
set Path=%Path%;%TOOLCHAIN_BIN_DIR_PATH%


:: =======================================================================================
:: Post-Processing
:: ---------------------------------------------------------------------------------------
if %STD_TRUE% == %local_debug% (
  echo -- [Info][Process] Done.
)

cd %HERE%

exit /b %STD_RETURN_OK%


:: ***************************************************************************************
:: THE END
:: ***************************************************************************************