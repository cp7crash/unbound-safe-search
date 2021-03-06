@echo off
if "%1"=="" goto useage
if "%2"=="" goto useage
if "%3"=="" goto useage
set domainCount=0
echo # generated by generate-zones.cmd > %3
for /F "tokens=*" %%A in (%1) do (
	echo local-zone: "%%A" redirect>> %3
	echo local-data: "%%A CNAME %2">> %3
	set /a domainCount=domainCount+1
)
echo Added %domainCount% domains to %3
echo Done!
goto fini

:useage
  echo generate-zones: create a Unbound local-zone and local-data entry for each line in a file
  echo.
  echo usage;
  echo   generate-zones inputile redirecthost outputfile
  echo.
  echo example;
  echo   generate-zones google-domains.txt forcesafesearch.google.com safe-search.conf
  echo.
  
:fini