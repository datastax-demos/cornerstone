# Black Friday Demo

This project is currently being used for the DataStax certification program as
well as our Demos Team technical screenings.

The job description for the Data Visualization Engineering Intern can be found
[here](https://gist.github.com/joaquincasares/af1a45b67088be5b9869).

## Setup

This project should follow the same
[documentation](../../../docs/datastax/cornerstone) as the `cornerstone` project and
should have all documentation updates there until `black-friday` project
is fully built out.

The script that links the `black-friday` project with the `cornerstone-python`
project can be found
[here](../../../vagrant/datastax/black-friday/3.start.sh).

Through the use of symlinks we are allowed to keep a [minimal project specific
layout](../../../web/datastax/black-friday) while directly benefiting
from the `cornerstone-python` project as well as enhancing it.

All modifications to Flask routing should take place
[here](../../../web/datastax/cornerstone-python/Cornerstone/routes/datastax/black_friday),
all static files should be added to their `datastax/black-friday` directory
[here](../../../web/datastax/cornerstone-python/Cornerstone/static),
and all template files should be added to a `black-friday` directory
[here](../../../web/datastax/cornerstone-python/Cornerstone/templates/datastax).

## Technical Screening

### Time Requirement

Since this is an open ended screening I would like to set the time suggestion
to be of something close to an hour. What I'm looking for is a candidate that:

* has a basic understanding of how the platform is integrated
* able to produce at least one additional chart based on the provided data
* able to implement at least
[one additional chart type](https://google-developers.appspot.com/chart/interactive/docs/gallery)
* and optionally sketch out a general layout for a future interface and/or
future data (vision, not polish, will be evaluated).

### Summary

The technical screening will follow the same workflow as that of a normal day
in this position. The infrastructure and data will already be present and data
manipulation and visualization skills will be needed for this position. There are typically
minimal requirements for how the data should be presented so feel free to
greenfield ideas based on the provided data.

Since visualizing data will be the main aspect of the current position, the above
paragraph is a requirement. However, feel free to do quick iterations over fake
data or even build out an end-user interface as opposed to a dashboard interface.
Again, feel free to greenfield ideas since we are looking for high amounts of creativity
with minimal supervision.

Since this same screening is being given out to multiple candidates, please
submit the `git diff` output as well as screenshots of the created layouts.
Once an offer is made and accepted, we'll ask that the new hire submit a pull request
to the repository under their Github account.

### Questions?

If something is unclear, feel free to find me in the \#datastax-demos channel
on irc.freenode.net under the `joaquin` handle between the hours of 9am-5pm CST.
This should also be seen as
reminiscent of a normal day in this position and thus will be evaluated as part
of the interview process. I will be available to help field all questions
that cannot be found online and help clarify the current use cases.

You can connect using your favorite IRC client
([Textual for OS X](http://www.codeux.com/textual) is my client of choice),
or [webchat](https://webchat.freenode.net).
