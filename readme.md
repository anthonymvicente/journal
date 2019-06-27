# journal

`journal` is a shell script built to allow easy journaling via your `$EDITOR`. Invoked without arguments will automatically open a text file at `$JOURNAL_DIR/yyyy/mm/dd.txt`. `$JOURNAL_DIR` should be defined in your `.profile` or equivalent. `journal` can also be called specifying the date either in part or whole in the following format:

`journal dd` where `dd` is the 2 digit day (0 padded). The month and year will be presumed to be current.
`journal ddmm` where `dd` is as above and `mm` is the 2 digit month (0 padded). The year will be presumed to be current.
`journal ddmmyyyy` where `dd` and `mm` are as above and `yyyy` is the 4 digit year.

`journal` will automatically create any directories that don't exist.

#### TO-DO

- [ ] implement a way to see existing entries
