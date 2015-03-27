The Cornerstone project's layout has been meticulously chosen and should keep
with the following declarations going forward. Pull requests for name
clarifications and reorganization are welcome, but must also update all existing
demo paths.

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
`lowercase-project-file-name` standard in all relevant directories.
Do not contribute placeholder files where there is no need.

All future references assume files will be placed within these project directories.

### cql

All schemas should be placed into the `cql/` directory and separated by keyspace
for easier navigation.

These files should also never use the `USE <keyspace>;` statement to make it
easier to recreate tables using a simple copy-paste workflow.

Also, please only use options that are required. `DESC KEYSPACE <keyspace>;`
commands may be useful, but are a bit harder to read and may not be future-proof.
Instead commit only what's required for your demo.

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
