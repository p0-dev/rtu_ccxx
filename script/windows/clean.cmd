:: **************************************************************************************
:: CLEANING RESULT FILES BATCH SCRIPT
:: **************************************************************************************
:: @name      : clean.cmd
:: @desc      : cleaning result files, for a fresh project build
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
  echo -- [Error][Clean] Failed at process_userconf.cmd
  exit /b %STD_RETURN_FAIL%
)

:: ======================================================================================
:: Local Variable
:: --------------------------------------------------------------------------------------
set local_debug=%STD_FALSE%


:: ======================================================================================
:: Cleaning Process
:: --------------------------------------------------------------------------------------
:: Project root directory validation
if not exist %PJT_ROOT_DIR_PATH% (
  exit /b %STD_RETURN_FAIL%
)

:: Cleaning BUILD directory
if exist %PJT_ROOT_DIR_PATH%/%PJT_BUILD_DIR_NAME% (
  cd %PJT_ROOT_DIR_PATH%
  rmdir /s /q %PJT_BUILD_DIR_NAME%
)

if %STD_TRUE% == %local_debug% (
  if %STD_RETURN_FAIL% == %errorlevel% (
    echo -- [Error][Clean] Failed at command: 
          ^rmdir PJT_BUILD_DIR_NAME: %PJT_BUILD_DIR_NAME%
    exit /b %STD_RETURN_FAIL%
  ) else (
    echo -- [Debug][Clean] Cleaned PJT_BUILD_DIR_NAME: %PJT_BUILD_DIR_NAME%
  )
)

:: Cleaning INSTALL directory
if exist %PJT_ROOT_DIR_PATH%/%PJT_DF_INSTALL_DIR_NAME% (
  cd %PJT_ROOT_DIR_PATH%
  rmdir /s /q %PJT_DF_INSTALL_DIR_NAME%
)

if %STD_TRUE% == %local_debug% (
  if %STD_RETURN_FAIL% == %errorlevel% (
    echo -- [Error][Clean] Failed at command: 
          ^rmdir PJT_DF_INSTALL_DIR_NAME: %PJT_DF_INSTALL_DIR_NAME%
    exit /b %STD_RETURN_FAIL%
  ) else (
    echo -- [Debug][Clean] Cleaned PJT_DF_INSTALL_DIR_NAME: %PJT_DF_INSTALL_DIR_NAME%
  )
)

:: Cleaning GRAPH directory
if exist %PJT_ROOT_DIR_PATH%/%PJT_DF_GRAPH_DIR_NAME% (
  cd %PJT_ROOT_DIR_PATH%
  rmdir /s /q %PJT_DF_GRAPH_DIR_NAME%
)

if %STD_TRUE% == %local_debug% (
  if %STD_RETURN_FAIL% == %errorlevel% (
    echo -- [Error][Clean] Failed at command: 
          ^rmdir PJT_DF_GRAPH_DIR_NAME: %PJT_DF_GRAPH_DIR_NAME%
    exit /b %STD_RETURN_FAIL%
  ) else (
    echo -- [Debug][Clean] Cleaned PJT_DF_GRAPH_DIR_NAME: %PJT_DF_GRAPH_DIR_NAME%
  )
)


:: ======================================================================================
:: Post-Processing
:: --------------------------------------------------------------------------------------
if %STD_TRUE% == %local_debug% (
  echo -- [Info][Clean] Done.
)

cd %HERE%

exit /b %STD_RETURN_OK%


:: **************************************************************************************
:: THE END
:: **************************************************************************************