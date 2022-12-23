FROM python:3.9-alpine
WORKDIR /home/app

EXPOSE 5678
EXPOSE 3001

COPY . .
RUN pip install -r requirements.txt

# WITH OUT DEBUG
# uvicorn main:app --host 0.0.0.0 --port 3001 --reload
# CMD [ "uvicorn","main:app","--host","0.0.0.0","--port","3001","--reload"]

# WITH DEBUG
RUN pip install debugpy
# python3 -m debugpy --listen 0.0.0.0:5678 --wait-for-client -m uvicorn main:app --host 0.0.0.0 --port 3001 --reload
CMD [ "python3","-m","debugpy","--listen","0.0.0.0:5678","--wait-for-client","-m","uvicorn","main:app","--host","0.0.0.0","--port","3001","--reload"]