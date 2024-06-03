# README

> Written by lqy 3220103373

[TOC]

---

## Environment

WSL2-Ubuntu22.04LTS

---

## Usage

### File Organization and Structure

```bash
$ tree
.
├── Makefile
├── README.md
├── docs
│   └── Project1.md
├── main.sh
├── out
├── src
│   ├── ADIF.cpp
│   ├── ADIF.h
│   ├── CLI.cpp
│   ├── CLI.h
│   ├── Makefile
│   ├── Record.cpp
│   ├── Record.h
│   └── main.cpp
└── test
    ├── adif1.adi
    ├── adif2.adi
    └── adif3.adi

4 directories, 15 files
```

In this working directory, here are 7 objects.

* `Makefile`: the `makefile` for the whole project
* `README.md`: the `README` document
* `docs`: the project document folder
* `main.sh`: the bash script to run the project program
* `out`: the output folder for exporting files
* `src`: the source code folder
* `test`: the test folder with 3 `.adi` files in

### Excution

You can use `./main.sh` to compile and run the whole project or to use `Makefile` given in the working directory.

### Run the ADIF

Here are several supported instructions to use `ADIF`:

```bash
parse [filename] # parse the ADIF file and store in memory
print # print all ADIF records in console
export [--csv|--json] [filename] # export the ADIF data to specific format file
search # search ADIF records by specific conditions the input conditions should be in format 
       # fieldName fieldValue
modify [recordID] # Modify ADIF record by specific field and value in format 
                  # fieldName fieldValue
delete [recordID] # delete ADIF record by its ID
exit # exit the program
help # help menu
```

### Notes

1. The output file will be in folder `out/`
2. **Make sure your console width is large enough to enjoy the best UI**
3.  `ID` is the primary key of ADIF record
4. Chinese characteristcs are not supported