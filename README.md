# c_project_skeleton
A project Skeleton with a script to create a ConsoleApp or StaticLib for the c programming language managed using premake.


## Setup
Clone the repository to where you will create projects.
[Download](https://premake.github.io/download) the latest release of premake. Note that the script currently only has a working version for linux but the project files work on windows
with Visual Studio solution files.
Create a new folder named `_premake` next to `_Skeleton` and put the premake executable inside the folder.
Make sure the executable is named `premake5` or change the command at row 2 of `_Skeleton/build.sh`.

## Usage
To create a project use the script as so: `./create_project.sh <project_name> <project_type>` where the project_type can be a `StaticLib` or a `ConsoleApp`.
To build the project use the `build.sh` script and to run the project use the `test.sh` script.
If you want to modify the premake configuration look at the [premake documentation](https://premake.github.io/docs/).