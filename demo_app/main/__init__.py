import os

from flask import Flask, redirect


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='pekhai',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    @app.route('/', methods=['GET',])
    def index():
        return redirect('/img_enc/')

    # import blueprints
    from . import img_enc
    app.register_blueprint(img_enc.bp)
    from . import img_dec
    app.register_blueprint(img_dec.bp)
    from . import hash
    app.register_blueprint(hash.bp)

    return app