# Use the latest official Python slim image
FROM python:latest

# Install system dependencies: git for cloning, and tk for the GUI (Tkinter)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        net-tools \
        tk && \
    rm -rf /var/lib/apt/lists/*

# Récupérer le code source depuis le dossier code
COPY code /opt/

# Définir le répertoire de travail
WORKDIR /opt/spotify_to_ytmusic

# Installer la librairie via pip
RUN pip install . && \
    pip install ytmusicapi tk

# Récupérer les fichiers locaux raw_headers.txt et le template pour le mettre dans le conteneur
COPY raw_headers.txt /opt/spotify_to_ytmusic/raw_headers.txt
COPY raw_header_template.txt /opt/spotify_to_ytmusic/raw_header_template.txt

# Générer le fichier de credentials
RUN python3 spotify2ytmusic/ytmusic_credentials.py

# Exposer le port utilisé par l'application
EXPOSE 43019

# Copier le script d'entrée et le rendre exécutable
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Utiliser le script entrypoint.sh comme point d'entrée
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]