## Usage

```sh
$ bash fast-deploy.sh <app_name>
$ cd <app_name>
$ python3 -V
Python 3.5.2
$ python3 run.py
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 108-677-645
```

```sh
$ tree
.
├── app
│   ├── __init__.py
│   ├── mods
│   │   └── mod_main
│   │       └── views.py
│   ├── static
│   │   ├── css
│   │   │   └── styles.css
│   │   └── js
│   └── templates
│       ├── index.html
│       └── layout.html
├── requirements.txt
└── run.py

7 directories, 7 files
```

This script only works on Python3, because in Python2 you need create a __init__.py to make Python treat the directories as containing packages. If you'll use this on Python2 you must create __init__.py in mods/ and in mods/mod_main/ folders, the __init__.py can just an empty file. For more info: https://docs.python.org/2/tutorial/modules.html#packages
