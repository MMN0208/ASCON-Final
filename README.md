# ASCON-Final
Repository of ASCON Implementation on Zynq for the Computer Engineering Capstone Project

Below are the steps to run the demonstrative application in `demo_app`

## 1. Setup virtual environment

If this is your first time installing the project, you should create a virtual environment to organize python packages more effectively. Creation of virtual environments is done by executing the command venv:

`python -m venv /path/to/new/virtual/environment`

Every time you work on this project, please activate your virtual environment first since it handles all your packages. Different shell needs different command:

| Platform | Shell      | Command to activate venv              |
| -------- | ---------- | ------------------------------------- |
| POSIX    | bash/zsh   | `$ source <venv>/bin/activate`        |
| POSIX    | fish       | `$ source <venv>/bin/activate.fish`   |
| POSIX    | csh/tcsh   | `$ source <venv>/bin/activate.csh`    |
| POSIX    | PowerShell | `$ <venv>/bin/Activate.ps1`           |
| Windows  | cmd.exe    | `C:\> <venv>\Scripts\activate.bat`    |
| Windows  | PowerShell | `PS C:\> <venv>\Scripts\Activate.ps1` |

## 2. Flask introduction

> Flask is a micro web framework written in Python. It is classified as a microframework because it does not require particular tools or libraries. It has no database abstraction layer, form validation, or any other components where pre-existing third-party libraries provide common functions.

Within the activated environment, use the following command to install Flask:

`$ pip install Flask`

A Flask application can be as simple as a single file.

_hello.py_

```python
from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello():
    return 'Hello, World!'
```

You can try to run your project using this command:

`flask --app hello run --debug`

You’ll see output similar to this:

```
* Serving Flask app "flaskr"
* Debug mode: on
* Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
* Restarting with stat
* Debugger is active!
* Debugger PIN: nnn-nnn-nnn
```

Visit http://127.0.0.1:5000/ in a browser and you should see the “Hello, World!” message. Congratulations, you’re now running your Flask web application!

> However, as a project gets bigger, it becomes overwhelming to keep all the code in one file. Python projects use packages to organize code into multiple modules that can be imported where needed. An example project directory can contain:

```
/home/user/Projects/flask-tutorial
├── project_flask_pekhai/
│   ├── __init__.py
│   ├── db.py
│   ├── schema.sql
│   ├── auth.py
│   ├── blog.py
│   ├── templates/
│   │   ├── base.html
│   │   ├── auth/
│   │   │   ├── login.html
│   │   │   └── register.html
│   │   └── blog/
│   │       ├── create.html
│   │       ├── index.html
│   │       └── update.html
│   └── static/
│       └── style.css
├── tests/
│   ├── conftest.py
│   ├── data.sql
│   ├── test_factory.py
│   ├── test_db.py
│   ├── test_auth.py
│   └── test_blog.py
├── .venv/
├── .gitignore
└── README.md
```
## 3. Avnet Ultra96-v2

### Setup Device

- First connect through UART with Putty, access as root:
`sudo -i` (password: `xilinx`)

- Open Jupyter Notebook:
`jupyter notebook --ip [...] --allow-root`

- Using `ifconfig` to check the IP address

### Hosting sequence

- Open the terminal, go to the source code's location:
`/home/xilinx/ascon/ascon_img_processing/`

- Run the command:
`flask --app main run --host=0.0.0.0`

- Open new terminal, go to the location of `ngrok`:
`/usr/local/bin`

- Run the command:
`./ngrok http 5000`