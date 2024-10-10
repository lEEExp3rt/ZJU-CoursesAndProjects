The Personal Dairy is a CLI (Command Line Interface) software.

It stores dairies in a plain text file like this:

```
2021-01-01:Happy New Year
2021-01-02:Happy New Year 2
```

For the test, the original file should be like this.

Each line is one entry for one day. The date is in "yyyy-mm-dd" format and followed by a comma ":". There is no duplicated lines for the same date.

The software consists of four programs:

```
pdadd 
pdlist
pdshow 
pdremove 
```

`pdadd` is used to add an entity into the diary for the date. It takes the date from the command line argument and reads the entry from the standard input. If an entity of the same date is in the diary, the existing one will be replaced. 

`pdlist` lists all entities in the diary ordered by date. This program lists to the standard output.

`pdshow` prints the content of the entity specified by the date to the standard output.  It takes the date from the command line argument. When there is no such entry at the date, it prints: `yyyy-mm-dd:No entry found for the given date`.

`pdremove` removes one entity of the date. It returns 0 at success and -1 at failure. It takes the date from the command line argument. When there is no such entry at the date, it prints: `Entry not found at yyyy-mm-dd`.

The following script shows how to use the software: (`>` is the command line prompt.)
```
>./pdadd 2024-02-29
started
>./pdlist
2021-01-01:Happy New Year
2021-01-02:Happy New Year 2
2024-02-29:started
>./pdshow 2021-01-01
2021-01-01:Happy New Year
>./pdshow 2022-02-01
2022-01-01:No entry found for the given date
>./pdremove 2021-01-02
>echo $?
0
>./pdremove 2022-01-02
Entry not found at 2022-01-02
>echo $?
255
>./pdlist
2021-01-01:Happy New Year
2024-02-29:ended
```

A `Makefile` is provided to make the software. Modify the objects definition in the Makefile for your code.