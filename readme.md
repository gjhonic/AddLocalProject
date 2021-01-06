# AddLocalProject
____

**The Bash script that the local project adds configures the file host and virtual host**

- Adds a local host
- Creates a directory
- Sets the path to the directory in the virtual host

**Instruction manual**

1) Loading the script
```
  git clone https://github.com/gjhonic/AddLocalProject.git
```

2) Open the script and configure the parameters
```
  #Path where the local project will be created
  local_path="..."

  #Path to the file that contains the list of hosts
  filehost_os="/etc/hosts"

  #Path to the file that contains the list of virtual hosts of the local web server
  filehost_webserver="..."
```

3) Making the bash script executable
```
  sudo chmod +x add_local_project.sh
```

4) Run the script and pass the parameter "Project name"
```
  ./add_local_project.sh <project_name>
```

5) Open the browser and go to http://<project_name>.local
