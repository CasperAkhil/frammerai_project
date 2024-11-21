from flask import Flask
from flask_cors import CORS

def create_app():
    app = Flask(
        __name__,
        template_folder="../templates",
        static_folder="../static"
    )
    CORS(app)
    app.config.from_object('config')

    with app.app_context():
        from .routes import app_routes
        app.register_blueprint(app_routes)

    return app

