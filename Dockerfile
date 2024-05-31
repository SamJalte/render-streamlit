FROM python: 3.11.8-slim

WORKDIR /app 

COPY . /app

COPY requirements.txt .

RUN pip3 install -r requirements.txt

# Commandes RUN combinés , BONNE PRATIQUE

RUN apt-get update && apt-get-install -y

# Supprimer les caches d'installation des packages

RUN apt-get clear && rm -rf /var/lib/apt/lists/*

# Supprimer les fichiers temporaires

RUN rm -rf /tmp/*

# Supprimer les logs

RUN rm -rf /var/log/*

CMD ["python3", "main.py"]

EXPOSE 8501

ENTRYPOINT ["streamlit","run","./app/app_streamlit.py","--serveer.port=8501"," -- server.address=0.0.0.0"]