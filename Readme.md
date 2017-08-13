# Cron Parser

Write a command line application or script which parses a cron string and expands each field to
show the times at which it will run. You may use any of the following languages: Ruby, Scala,
JavaScript, Python, Go, Java, or C# (using .NET Core as we need it to run on OS X/Linux).
You should only consider the standard cron format with five time fields (minute, hour, day of
month, month, and day of week) plus a command, and you do not need to handle the special
time strings such as "@yearly". The input will be on a single line.
The cron string will be passed to your application as a single argument. The output should be
formatted as a table with the field name taking the first 14 columns and the times as a
space-separated list following it.

For example given the input argument:

```
*/15 0 1,15 * 1-5 /usr/bin/find
```

The output should be:
```
minute 0 15 30 45
hour 0
day of month 1 15
month 1 2 3 4 5 6 7 8 9 10 11 12
day of week 1 2 3 4 5
command /usr/bin/find
```

You shouldn’t spend more than three hours on this exercise. If you don’t have time to handle all
possible cron strings, then an app which handles a subset of them correctly is better than one
which does not run or produces incorrect results.
