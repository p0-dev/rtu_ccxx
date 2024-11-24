:: **************************************************************************************
:: GENERATING BUILD SCRIPT
:: **************************************************************************************
:: @name      : gen.cmd
:: @desc      : generating build script
:: @location  : project_root_dir/script/windows
:: **************************************************************************************


:: ======================================================================================
:: Pre-Processing
:: --------------------------------------------------------------------------------------
@echo off
set HERE=%cd%


:: ======================================================================================
:: Process User Configuration
:: --------------------------------------------------------------------------------------
call common\process_userconf.cmd

if %STD_RETURN_FAIL% == %errorlevel% (
  echo -- [Error][Gen] Failed at process_userconf.cmd
  exit /b %STD_RETURN_FAIL%
)


:: ======================================================================================
:: Local Variable
:: --------------------------------------------------------------------------------------
set local_debug=%STD_FALSE%


:: ======================================================================================
:: Build Script Generation
:: --------------------------------------------------------------------------------------
:: Navigation
cd %PJT_ROOT_DIR_PATH%

:: Argument
set arg=

:: Dynamic flag
set arg=%arg% -S %PJT_ROOT_DIR_PATH%
set arg=%arg% -B %PJT_BUILD_DIR_NAME%
set arg=%arg% -G %BUILDSYS_GENERATOR_NAME%
set arg=%arg% -D PJT_NAME=%PJT_NAME%
set arg=%arg% --toolchain %BUILDSYS_TOOLCHAIN_DEF_FILE%

if %STD_TRUE% == %BUILDGRAPH_SUPPORT_ENABLE% (
  set arg=%arg% --graphviz=%PJT_ROOT_DIR_PATH%/%PJT_DF_GRAPH_DIR_NAME%/%BUILDGRAPH_RESULT_FILE%
)

:: Static lag
set arg=%arg% -Wdev
set arg=%arg% -Werror=dev
set arg=%arg% -Wdeprecated

:: Debug
if %STD_TRUE% == %local_debug% (
  echo -- [Debug][Gen] %arg%
)

:: Run
call %BUILDSYS_EXE% %arg%

:: Validation
if %STD_RETURN_FAIL% == %errorlevel% (
  echo -- [Error][Gen] Failed at generation with: %BUILDSYS_EXE%
  exit /b %STD_RETURN_FAIL%
)


:: ======================================================================================
:: Build Graph Generation
:: --------------------------------------------------------------------------------------
:: Navigating to PJT_ROOT_DIR_PATH
cd %PJT_ROOT_DIR_PATH%

:: Graph convert
if %STD_TRUE% == %BUILDGRAPH_SUPPORT_ENABLE% (
  cd %PJT_ROOT_DIR_PATH%/%PJT_DF_GRAPH_DIR_NAME%
  dot -T%BUILDGRAPH_CONVERT_FORMAT% %BUILDGRAPH_RESULT_FILE% ^
  -o %PJT_NAME%.%BUILDGRAPH_CONVERT_FORMAT%
)


:: ======================================================================================
:: Final Return
:: --------------------------------------------------------------------------------------
if %STD_TRUE% == %local_debug% (
  echo -- [Info][Gen] Done.
)

cd %HERE%

exit /b %STD_RETURN_OK%


:: **************************************************************************************
:: THE END
:: **************************************************************************************