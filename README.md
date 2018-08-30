**NOTICE**
These files and scripts are provided without any assurances that they
will work properly in your environment.  There is also no guarantee
that something won't get messed up in either PowerSchool or IXL
by using this project.  Use at your own risk, understand what the
commands will be doing, and use in a test environment if possible!

**Background**
These scripts and process were created by Jason Lester of Washington County
Public Schools in Virginia.  

**Description**
These scripts export out the school, students, teachers, sections,
and enrollments PowerSchool that are required for import into IXL.

**Release**
The latest version is always available on Github from:
  https://github.com/JLester73/ps2ixl
  
**Requirements**
These scripts using the Scriptella ETL tool to export the data
in a format used by IXL.  Scriptella can be downloaded from
http://scriptella.org/.  It also uses Java and Oracle.

Dependencies:
 - Java JRE or JDK version 5.0 or later
 - Scriptella
 - Oracle JDBC Driver
 - WinSCP.Com (if you want the exports automatically uploaded)

**Setup**
- Install Scriptella and all dependencies noted above
- Place the XML and BAT files in C:\ETL_SCRIPTS
- Create the directory C:\ETL_EXPORTS\IXL
- Edit the etl.properties file and update the PowerSchool database
  server IP address or FQDN along with the psnavigator password
- Ensure the paths in etl.properties and ixl_exports.bat match
  where you have placed everything.
- Update the WinSCP line in ixl_exports.bat to use your district's
  login credentials.
- Run WinSCP.Com one time to accept the certificate
- Check the IXL_Students.XML file to make sure the SQL statement is selecting
  the correct students for your district.  We only use IXL in grades 2-8,
  so we restrict the query down to just them.
- IXL_Enrollments.XML needs to have the term portion of the query updated
  each year to match the current term.  It is (current year - 1990), so
  2018 would be 28.  We also restrict down the grades for this query like
  the previous one.
- IXL_Sections needs the term portion of the query updated each year as well.

**Usage**
The ixl_exports.bat batch file will run Scriptella against each of the XML
files to export out the five files required by IXL.  Once exported, it
uploads the files to the IXL SFTP server.  I would comment out that line
until you're sure your exports are correct.

Once you have everything working properly, you can add the batch file as
a scheduled task each night to completely automate your uploads.