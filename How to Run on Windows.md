# Run the Provider Lookup application

## WSL (Windows Subsystem for Linux)

### 1. Install Linux with WSL
- ***[Install Linux Tutorial](https://docs.microsoft.com/en-us/windows/wsl/install)***  
- Entering this command in an **administrator** PowerShell or Windows Command Prompt
    
    ``` 
    wsl --install 
    ```
- Restart machine

### 2. Set up Linux
- ***[Set up Linux Tutorial](https://docs.microsoft.com/en-us/windows/wsl/setup/environment#set-up-your-linux-username-and-password)***
- Open the distribution (**Ubuntu** by default) using the Start menu
- Create a User Name and Password
- Update and upgrade packages (optional but recommended)
    
    ```
    sudo apt update && sudo apt upgrade
    ```

### 3. Install PostgreSQL
- ***[Insatll PostgreSQL Tutorial](https://docs.microsoft.com/en-us/windows/wsl/tutorials/wsl-database)***
- Install PostgreSQL
    
    ```
    sudo apt install postgresql postgresql-contrib
    ```

- Confirm installation and get the version number
    
    ```
    psql --version
    ```

- Start postgres service
   
    ```
    sudo service postgresql start
    ```

- Set a password for default admin user, ```postgres```
    
    ```
    sudo passwd postgres
    ```

- Connect to the postgres service and open the psql shell  
    
    ```
    sudo -u postgres psql
    ```
    
    Once you have successfully entered the psql shell, you will see your command line change to look like this: ```postgres=#```
- ***[PostgreSQL Documentation](https://www.postgresql.org/docs/current/)***
- ***[PostgreSQL Tutorial](https://www.postgresqltutorial.com/)***

### 4. Place the project file in WSL file system
- ***[Provider Lookup project](https://github.com/Shikhar-G/Provider-Lookup)***
- Download the project in Windows file system
- Open WSL file in Windows File Explorer
    
    ```
    explorer.exe .
    ```

- Place the project file in WSL file system

### 5. Run the Program
- Change the current working directory to the project file
    
    ```
    cd project_filename
    ```

- Fllow the steps of ***[Provider Lookup project](https://github.com/Shikhar-G/Provider-Lookup)***
- Additional notes of **Inserting Data into PostgreSQL**
    - Specify a database name in the ```config.json``` file
       
        ```
        {
          "default": {
            "ENGINE": "django.db.backends.postgresql",
            "NAME": "Specified_DBname"
          }
        }
        ```
   
    - ```
      scripts/run_psql.sh -d Specified_DBname -e -f sql/all.sql
      ```

### 6. The solution of errors
- PermissionError: [Errno 13] Permission denied
    
    ```
    Traceback (most recent call last):
    File "scripts/data.py", line 53, in <module>
        open(args.curr, 'w').close()
    PermissionError: [Errno 13] Permission denied: 'curr.txt'
    ```
    
    ```
        Found NPPES_Data_Dissemination_June_2022.zip
    Downloading https://download.cms.gov/nppes/NPPES_Data_Dissemination_June_2022.zip
    Writing zip file..
    Traceback (most recent call last):
    File "scripts/data.py", line 84, in <module>
        open('data/npi.zip', 'wb').write(r.content)
    PermissionError: [Errno 13] Permission denied: 'data/npi.zip'
    ```
    
    - ***[Stack overflow](https://stackoverflow.com/questions/46815585/linux-server-python-oserror-errno-13-permission-denied)***
    - ***[chmod_Tutorial](https://ss64.com/bash/chmod.html)***
    - Solution
        - Creat ```curr.txt``` manually
        - ```
          sudo chmod 777 data
          ```

- psql: error: FATAL:  role "root" does not exist
    
    ```
    psql: error: FATAL:  role "root" does not exist
    Error in file all.sql.
    1 files read.
    ```
    
    - ***[Stack overflow](https://stackoverflow.com/questions/11919391/postgresql-error-fatal-role-username-does-not-exist)***
    - Solution
        
        ```
        sudo -u postgres createuser root
        ```