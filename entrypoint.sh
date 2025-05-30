#!/usr/bin/env bash
# entrypoint.sh

# Vérifie si le fichier data/playlists.json existe déjà
if [ -f "data/playlists.json" ]; then
    echo "Le fichier data/playlists.json existe déjà. Démarrage de l'application sans régénération..."
else
    echo "Le fichier data/playlists.json n'existe pas. Création initiale..."
    # Lance l'application Python en arrière-plan
    python spotify2ytmusic/spotify_backup.py --host 0.0.0.0 &
    cp spotify2ytmusic/data/playlists.json data/playlists.json
fi

# Lance le shell bash
exec bash
