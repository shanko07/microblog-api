from api import create_app

## Added Seeker agent to the Python app and started the agent before starting the Flask Application
import seeker
seeker.start()

app = create_app()
