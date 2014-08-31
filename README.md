# Import-Export Example

The primary service code is available in the /lib directory, with specs in the /spec directory. The primary features have been tested, although in a production environment I would prefer to add some edge cases and options to the specs. Additionally, documentation would be recommended for the code, but that is beyond the scope of a sample assignment.

The code does not assume Rails or any other framework, although it should be able to be dropped in easily (and pessimistically supports a few ActiveSupport features, such as `String#constantize` and `#as_json`).

## Executable

There is a quick shell command available at `bin/convert` which can be used as follows:

    bin/convert sample.csv

The shell command is provided strictly as an example, and is not fully implemented (e.g. specify output file name, full IO error handling) or tested. It should, however, demonstrate the validity of the code.
