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

### cql

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

### docs
### keys
### run
### scripts
### tools
#### datastax/metagener
### vagrant
#### general
### vagrantfiles
### web
