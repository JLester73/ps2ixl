@echo off

REM Scriptella scripts to export data from PowerSchool
REM into format that is used by IXL
c:
cd \ETL_Scripts
call C:\Scriptella\bin\scriptella.bat IXL_Schools.xml
call C:\Scriptella\bin\scriptella.bat IXL_Students.xml
call C:\Scriptella\bin\scriptella.bat IXL_Teachers.xml
call C:\Scriptella\bin\scriptella.bat IXL_Sections.xml
call C:\Scriptella\bin\scriptella.bat IXL_Enrollments.xml

REM Upload CSV files to Major Clarity's FTP Server
c:
cd \ETL_Exports\IXL
WinSCP.com /console /command "option batch abort" "option confirm off" "open user:password@sftp.ixl.com" "put schools.csv" "put students.csv" "put teachers.csv" "put sections.csv" "put enrollments.csv" "exit"