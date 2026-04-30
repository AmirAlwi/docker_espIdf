# Bind workspace options

1. container will run as root if `containerUser` is not specify.

## Default

1. don't configure `workspaceMount`
2. workspace will automatically bind at `/workspaces/<project_folder>`
3. not required to run in `--priviledged`

## Map folder 1 to 1

1. specify workspace
    ``` json
    ...
        "workspaceMount": "source=${localWorkspaceFolder}, target=${localWorkspaceFolder}, type=bind",
        "workspaceFolder": "${localWorkspaceFolder}"
    ...
    ```
2. access permission required to open remapped folder 

### specify user

1. specify container user accordingly
    ``` json
    ...
        "remoteUser": "ubuntu",
        "containerUser": "ubuntu"
    ...
    ```

### run with priviledge

1.  add run arguments to allow container run in privileged mode to allow access to others user directory
    ``` json
    ...
        "runArgs": [
            "--privileged"
        ]
    ...
    ```

### modify SELinux label

1. change directory folder to allow container to run
2. run command `$ chcon -Rt svirt_sandbox_file_t <path>` from host
3. run container without need to specify user and privileged

