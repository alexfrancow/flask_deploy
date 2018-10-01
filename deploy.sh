
mkdir $1
mkdir $1/app
mkdir $1/app/templates
mkdir $1/app/static
mkdir $1/app/static/css
mkdir $1/app/static/js
touch $1/app/static/css/styles.css
mkdir $1/app/mods
mkdir $1/app/mods/mod_main
touch $1/requirements.txt


cat <<EOT >> $1/run.py
# -*- encoding: utf-8 -*-
"""
Python Aplication Template
Licence: GPLv3
"""

from app import app

if __name__ == "__main__":
    app.run(debug=True)
EOT

cat <<EOT >> $1/app/__init__.py
# -*- encoding: utf-8 -*-
"""
Python Aplication Template
Licence: GPLv3
"""

#################
#### imports ####
#################

from flask import Flask

################
#### config ####
################

app = Flask(__name__, instance_relative_config=True)

####################
#### blueprints ####
####################

from app.mods.mod_main.views import main_blueprint

# register the blueprints
app.register_blueprint(main_blueprint)
EOT

cat <<EOT >> $1/app/mods/mod_main/views.py
from flask import Blueprint, render_template
from flask import Flask, jsonify, Blueprint, render_template, request, flash, redirect, url_for

main_blueprint = Blueprint('main', __name__, template_folder='templates')
app = Flask(__name__)

@main_blueprint.route('/', methods= ['GET', 'POST'])
def main():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug= True)
EOT


cat <<EOT >> $1/app/templates/layout.html
<!doctype html>
<html>
    <head>
    {% block head %}
        <title>{% block title %}{% endblock %} $1 </title>
        <meta charset="utf-8"/>
        <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no' />
        
        <!-- CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
        <link rel="stylesheet" href="{{ url_for('static',filename='css/styles.css') }}">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        
        <!-- JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.3.2/holder.min.js" type="text/javascript"></script>
    
    {% endblock %}
    </head>

<body>
{% block content %}

{% endblock %}
</body>
{% block footer %}

{% endblock %}
</html>
EOT

cat <<EOT >> $1/app/templates/index.html
{% extends "layout.html" %}
{% block title %}$1{% endblock %}
{% block content %}
    <h1> Hola Mundo! </h1>
{% endblock %}
{% block footer %}
{% endblock %}
EOT
