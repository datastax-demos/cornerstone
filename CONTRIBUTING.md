The Cornerstone project's layout has been meticulously chosen and should keep
with the following declarations going forward. Pull requests for name
clarifications and reorganization are welcome, but must also update all existing
demo paths.

## Forking

Contributing to this repo, or using it for a separate project, will benefit from
git's forking action. There are two ways to fork this repository and still gain
future updates and improvements.

### Direct Forks

A new fork of the Cornerstone project can be created by visiting the
[datastax-demos/cornerstone repository](https://github.com/datastax-demos/cornerstone)
and clicking the `Fork` button on the top right corner.

This will fork the `datastax-demos/cornerstone` repository into
`username/cornerstone`.

To easily maintain the forked master branch create new branches that
match the new project's `lowercase-project-directory-name`.

When it comes time to contribute back to the Cornerstone project merely create
a [pull request](https://github.com/datastax-demos/cornerstone/pulls) from
`username/cornerstone:demo-branch` into `datastax-demos/cornerstone:master`.

For more information on forking, visit Github's
[documentation](https://help.github.com/articles/fork-a-repo/).

### Indirect Forks

In some cases the new project may want to have a distinct repository name. This
can be achieved while still contributing back to the main Cornerstone repo
and receiving all future improvements and updates.

After creating a new git repo with the desired name, run the following commands:

    git remote add cornerstone git@github.com:datastax-demos/cornerstone.git
    git pull cornerstone master

This will ensure the new repo is downstream from the Cornerstone repo which will
allow for pull requests to and updates from the main Cornerstone repo.

Feel free to work on the new project in the master branch and when the time
comes, create a [pull request](https://github.com/datastax-demos/cornerstone/pulls)
from `username/cornerstone:master` into `datastax-demos/cornerstone:master`.

## Demo Classifications

### DataStax

Projects hosted within DataStax directories are projects that have been worked
on within DataStax and may have a higher presentation value.

Pull requests are highly welcome and encouraged.

### Showcase

Projects hosted within Showcase directories are projects that have been developed
outside of DataStax and have a higher presentation value.

Pull requests here should @mention the contributor(s) and will be accepted upon
the contributor(s) acknowledgement.

### Contributions

Projects hosted within Contributions directories are projects that have been
developed outside of DataStax and are still a work in progress. Sometimes
unpolished demos still hold a lot of technical value and may be used to gain
community contributions.

Pull requests here should @mention the contributor(s) and will be accepted upon
the contributor(s) acknowledgement.

If a demo listed under Contributions reaches stability with a high presentation
standards, feel free to submit a pull request to elevate the demo from the
Contributions level to the Showcase level.

## Demo Structure

All projects should create their own folder using the
`lowercase-project-directory-name` standard in all relevant directories.
Do not contribute placeholder files where there is no need.

All future references assume files will be placed within these project directories.

### cql/

All schemas should be placed into the `cql/` directory and separated by keyspace
for easier navigation. They should also use the `.cql` extension since
[linguist](https://github.com/github/linguist) now has basic support for CQL.

These files should also never use the `USE <keyspace>;` statement to make it
easier to recreate tables using a simple copy-paste workflow in the development
process.

Also, please only use options that are required. `DESC KEYSPACE <keyspace>;`
commands may be useful, but are a bit harder to read and may not be future-proof
when future DataStax Enterprise releases improve schema defaults.
Instead commit only what's required for the current demo.

### docs/

All documentation pertaining to the demo should be placed in the `docs/` directory.

Additional files are accepted for in-depth topics, but two are required:
README.md and SCRIPT.md.

#### README.md

This file will help technical users navigate the demo. The file is expected to
give a rundown of any noteworthy features, scripts, or modeling choices.

This file should be directed at audiences that will collaborate or enhance the
demo as well as audiences that are looking to apply or dissect the demo to
further their own projects.

#### SCRIPT.md

This file will help non-technical users see the functionality behind the
demo and should read like a story of why design and data choices were
made and how they showcase the power of DataStax Enterprise.

### keys/

This directory should remain empty, but is included for standardization for
in-class setups.

### run/

Bash scripts in this directory will follow the same basic flow:

* announce working directory
* backup existing Vagrantfiles to prevent overwrite
* link project Vagrantfile to ./Vagrantfile
* set the required credentials
* launch the demo using Vagrant

Additional scripts, like `run-aws`, will include the additional commands needed
when provisioning within cloud environments. The additional caveats for
cloud-specific launches are:

* collecting IP addresses of launched nodes
* multiple provisioning steps for launching and configuring the nodes, due to
native IP unawareness

### scripts/

All additional cron, data import, data generation, etc scripts should be placed
into the `scripts/` directory along with their relevant files.

The directory system here is relaxed, but should be easy for those unfamiliar
with the project to navigate.

### tools/

The idea behind the `tools/` directory is that all tools that may be reused
between projects can be housed here. All directories here should include their
own README.md.

Currently we have 2 directories under `tools/datastax/`:

#### tools/datastax/metagener/

The `tools/datastax/metagener/` directory houses the latest build of
[metagener](https://github.com/jshook/metagener):
A meta-programming library and conceptual power tool for flexible
and highly-concurrent statistical data generation.

The recipes for metagener are stored within the familiar classification
sub-directories contributions, datastax, and showcase and further divided using
the project's `lowercase-project-directory-name`.

Do be aware that metagener requires Java 8 while DataStax Enterprise requires
Java 7 as of March 2015.

#### tools/datastax/vagrant/

The `tools/datastax/vagrant/` directory houses maintenance scripts required
for the Cornerstone project that should not be expected to be run by contributors.

### vagrant/

All provisioning scripts that will be run by the `Vagrantfile` should be housed
here and ideally be placed within 3 files:

#### vagrant/.../1.setup.sh

The setup script will be used for Vagrant scenarios without synced_folders as is
standard for our cloud setups.

#### vagrant/.../2.install.sh

This script should install all other prerequisites and perform all actions that
do not require a DataStax Enterprise cluster.

Feel free to break this script up into multiple files when necessary.
The system here is relaxed, but should be easy for those unfamiliar
with the project to navigate.

#### vagrant/.../3.start.sh

This script will perform all remaining commands that require a DataStax Enterprise
cluster, which is guaranteed to be live by the time this script is executed.

The launching of the web service should be the final command.

#### vagrant/.../4.post.sh

This script will perform all remaining commands that require the web service to
be active.

Feel free to break this script up into multiple files when necessary.
The system here is relaxed, but should be easy for those unfamiliar
with the project to navigate.

#### vagrant/general/

This final sub-directory is a special case of versioned immutable files that
are shared across all demos in order to aid with the installation, configuration,
and starting of prerequisites.

Additional scripts and improvements are welcomed through additional files where
the version is incremented to ensure backwards-compatibility.

### vagrantfiles/

This directory contains the Vagrantfiles to be used for each specific project.
They are symlinked into the root directory using the `run/` scripts to allow
editing and committing file changes directly while still being able to use the
file to interact with launched clusters.

Breaking the file down into functions is essential for support of future
platforms. If you require help with cloud platforms, feel free to request help
in the pull request and instead focus on implementing the `singlenode` machine
that uses the Virtualbox provider.

### web/

This directory will house your web application in the language of your choice.

Directory structure will be different for each project, but do lean towards
clean and heavily documented code.

#### web/datastax/cornerstone-*

For more information on the Cornerstone projects, visit the
[Cornerstone documentation](docs/datastax/cornerstone/).
