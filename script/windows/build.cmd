:: ***************************************************************************************
:: BUILDING PROJECT BATCH SCRIPT
:: ***************************************************************************************
:: @name      : build.cmd
:: @desc      : building project
:: @location  : project_root_dir/script/windows
:: ***************************************************************************************


:: =======================================================================================
:: Pre-Processing
:: ---------------------------------------------------------------------------------------
@echo off
set HERE=%cd%


:: =======================================================================================
:: Process User Configuration
:: ---------------------------------------------------------------------------------------
:: Navigation
cd %HERE%

:: User configuration process script
call common\process_userconf.cmd

:: Validation
if %STD_RETURN_FAIL% == %errorlevel% (
  echo -- [Error][Clean] Failed at process_userconf.cmd
  exit /b %STD_RETURN_FAIL%
)


:: =======================================================================================
:: Local Variable
:: ---------------------------------------------------------------------------------------
set local_debug=%STD_FALSE%


:: =======================================================================================
:: Building Process
:: ---------------------------------------------------------------------------------------
:: Navigation to PJT_ROOT_DIR_PATH
cd %PJT_ROOT_DIR_PATH%

:: Argument
set arg=

:: Dynamic flag
set arg=%arg% --build %PJT_BUILD_DIR_NAME%
set arg=%arg% --parallel %BUILDGEN_PARALLEL_PROCESSES%

:: Static lag
set arg=%arg% --clean-first

if %STD_TRUE% == %local_debug% (
  set arg=%arg% --verbose
)

:: Debug
if %STD_TRUE% == %local_debug% (
  echo -- [Debug][Build] %arg%
)

:: Run
call %BUILDSYS_EXE% %arg%

:: Validation
if %STD_RETURN_FAIL% == %errorlevel% (
  echo -- [Error][Build] Failed at building process with %BUILDSYS_EXE%
  exit /b %STD_RETURN_FAIL%
)


:: =======================================================================================
:: Default Installation Process
:: ---------------------------------------------------------------------------------------
:: Navigation
cd %PJT_ROOT_DIR_PATH%

:: Argument
set arg=

:: Dynamic argument
set arg=%arg% --install %PJT_BUILD_DIR_NAME%
set arg=%arg% --prefix %PJT_DF_INSTALL_DIR_NAME%

:: Run
call %BUILDSYS_EXE% %arg%

:: Validation
if %STD_RETURN_FAIL% == %errorlevel% (
  echo -- [Error][Build] Failed at default installation with %BUILDSYS_EXE%
  exit /b %STD_RETURN_FAIL%
)


:: =======================================================================================
:: Final Result
:: ---------------------------------------------------------------------------------------
if %STD_TRUE% == %errorlevel% (
  echo -- [Info][Build] Done.
)

cd %HERE%

exit /b %STD_RETURN_OK%


:: ***************************************************************************************
:: THE END
:: ***************************************************************************************