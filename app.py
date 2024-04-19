from fastapi import FastAPI
import mangum
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    """
    Root endpoint for the application.
    """
    return {"Hello": "DEVOPS-SRE CLASS"}

@app.get("/jenkins")
def read_jenkins():
    """
    Endpoint for the Jenkins team.
    """
    return {"Hello": "SUPER TEAM"}

@app.get("/hello")
def hello_world():
    """
    Endpoint that prints 'Hello, world!' to the console.
    """
    print('Hello, world!')
    return {"message": "Hello, world!"}

handler = mangum.Mangum(app)

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8080)
