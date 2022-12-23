from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    x = 1
    y = x+1
    return {"message": "Hello World2299 kkk nghiahsgs"}