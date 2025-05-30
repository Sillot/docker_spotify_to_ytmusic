# Spotify to YouTube Music Docker

This project contains a Dockerfile to run the Spotify to YouTube Music tool in a Docker environment.

## Prerequisites

- Docker installed on your machine
- A `raw_headers.txt` file containing YouTube Music request headers that you'll need to retrieve [yourself](https://github.com/linsomniac/spotify_to_ytmusic/issues/194#issuecomment-2916481245).
- The `code` and `data` folders in your project directory

## Project Structure

```
├── Dockerfile                # Docker image definition
├── entrypoint.sh             # Container entry script
├── raw_headers.txt           # YouTube Music headers for authentication
├── raw_header_template.txt   # Headers template without sensitive data
├── code/                     # Application source code
└── data/                     # Folder to store data (playlists, etc.)
```

## Installation

1. Clone the Spotify to YouTube Music repository into the `code` folder:

```bash
git clone https://github.com/linsomniac/spotify_to_ytmusic.git code/spotify_to_ytmusic
```

2. Get the YouTube Music authentication headers:

   a. Log in to [YouTube Music](https://music.youtube.com) in your browser.
   
   b. Open the developer tools (F12).
   
   c. Go to the "Network" tab.
   
   d. Navigate in YouTube Music (for example, click on a playlist).
   
   e. In the developer tools, search for a request containing **browse?prettyPrint=false**.
   
   f. Right-click on this request and select "Copy Value" then "Copy Request Headers".
   
   g. Paste these headers into a new `raw_headers.txt` file at the root of your project.

3. Build the Docker image:

```bash
docker build -t spotify2ytmusic:latest .
```

## Usage

To run the application:

```bash
docker run --rm -it -p 43019:43019 -v "./data:/opt/spotify_to_ytmusic/data" spotify2ytmusic:latest
```

Explanation of options:
- `--rm`: Automatically removes the container when finished
- `-it`: Interactive mode with terminal
- `-p 43019:43019`: Exposes the application's port 43019
- `-v "./data:/opt/spotify_to_ytmusic/data"`: Mounts the local `data` folder in the container

Once the container starts, the application will run in the background and you'll have access to a bash shell to run additional commands. The web interface will be accessible at `http://localhost:43019`.

## Features

The Spotify to YouTube Music application allows you to:
- Export your Spotify playlists
- Import Spotify playlists into YouTube Music
- Synchronize playlists between both platforms

For more information on using the application itself, check the [official documentation](https://github.com/linsomniac/spotify_to_ytmusic).

## Notes

- Exported data files will be stored in the `./data` folder on your local machine
- YouTube Music authentication is already configured in the container
- The application is accessible at `http://localhost:43019` when the container is running

---

# Spotify to YouTube Music Docker (Français)

Ce projet contient un Dockerfile permettant d'exécuter l'outil Spotify to YouTube Music dans un environnement Docker.

## Prérequis

- Docker installé sur votre machine
- Un fichier `raw_headers.txt` contenant les en-têtes de requête YouTube Music que vous allez devoir récupérer par [vous-même](https://github.com/linsomniac/spotify_to_ytmusic/issues/194#issuecomment-2916481245).
- Les dossiers `code` et `data` dans le répertoire du projet

## Structure du projet

```
├── Dockerfile                # Définition de l'image Docker
├── entrypoint.sh             # Script d'entrée pour le conteneur
├── raw_headers.txt           # En-têtes YouTube Music pour l'authentification
├── raw_header_template.txt   # Template d'en-têtes sans données sensibles
├── code/                     # Code source de l'application
└── data/                     # Dossier pour stocker les données (playlists, etc.)
```

## Installation

1. Clonez le dépôt Spotify to YouTube Music dans le dossier `code` :

```bash
git clone https://github.com/linsomniac/spotify_to_ytmusic.git code/spotify_to_ytmusic
```

2. Récupérez les en-têtes d'authentification YouTube Music :

   a. Connectez-vous à [YouTube Music](https://music.youtube.com) dans votre navigateur.
   
   b. Ouvrez les outils de développement (F12).
   
   c. Allez dans l'onglet "Réseau" (ou "Network").
   
   d. Naviguez dans YouTube Music (par exemple cliquez sur une playlist).
   
   e. Dans les outils de développement, cherchez une requête contenant **browse?prettyPrint=false**.
   
   f. Faites un clic droit sur cette requête et sélectionnez "Copier la valeur" puis "Copier les en-têtes de requête" (ou "Copy Value" -> "Copy Request Headers").
   
   g. Collez ces en-têtes dans un nouveau fichier `raw_headers.txt` à la racine du projet.

3. Construisez l'image Docker :

```bash
docker build -t spotify2ytmusic:latest .
```

## Utilisation

Pour exécuter l'application :

```bash
docker run --rm -it -p 43019:43019 -v "./data:/opt/spotify_to_ytmusic/data" spotify2ytmusic:latest
```

Explication des options :
- `--rm` : Supprime automatiquement le conteneur une fois terminé
- `-it` : Mode interactif avec terminal
- `-p 43019:43019` : Expose le port 43019 de l'application
- `-v "./data:/opt/spotify_to_ytmusic/data"` : Monte le dossier local `data` dans le conteneur

Une fois le conteneur démarré, l'application s'exécutera en arrière-plan et vous aurez accès à un shell bash pour exécuter des commandes supplémentaires. L'interface web sera accessible via `http://localhost:43019`.

## Fonctionnalités

L'application Spotify to YouTube Music permet de :
- Exporter vos playlists Spotify
- Importer des playlists Spotify dans YouTube Music
- Synchroniser des playlists entre les deux plateformes

Pour plus d'informations sur l'utilisation de l'application elle-même, consultez la [documentation officielle](https://github.com/linsomniac/spotify_to_ytmusic).

## Remarques

- Les fichiers de données exportés seront stockés dans le dossier `./data` sur votre machine locale
- L'authentification YouTube Music est déjà configurée dans le conteneur
- L'application est accessible sur `http://localhost:43019` lorsque le conteneur est en cours d'exécution
