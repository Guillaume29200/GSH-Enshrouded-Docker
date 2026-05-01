# 🐳 Enshrouded Dedicated Server - GSH Standard

## 📌 Description

Image Docker dédiée au serveur Enshrouded, entièrement standardisée pour l’écosystème GameServer-Hub (GSH).

Cette image permet de déployer facilement un serveur Enshrouded sous Linux via Wine + SteamCMD, avec gestion automatique de l'installation, des mises à jour et de la configuration.

---

## 🚀 Features

- Installation automatique via SteamCMD
- Support Wine + Xvfb (serveur Windows sous Linux)
- Mise à jour automatique du serveur
- Configuration dynamique via variables GSH
- Structure standardisée pour tous les jeux GSH
- Compatible Docker, VPS et serveur dédié

---

## 📁 Structure GSH

```txt
/opt/steam            -> SteamCMD (persistant)
/opt/games/server     -> Fichiers du serveur
/opt/games/config     -> Configuration externe lisible
/opt/wine             -> Environnement Wine
```

---

## ⚙️ Variables d’environnement (GSH)

### 🔧 Général

```env
GSH_TZ=Europe/Paris
GSH_PUID=1000
GSH_PGID=1000
```

---

### 📦 Steam

```env
GSH_STEAM_APP_ID=2278520
GSH_STEAM_USER=anonymous
GSH_STEAM_PASSWORD=

GSH_GAME_UPDATE=true
GSH_VALIDATE_FILES=true
```

---

### 🎮 Serveur Enshrouded

```env
GSH_SERVER_NAME=GSH Enshrouded Server
GSH_SERVER_PASSWORD=
GSH_ADMIN_PASSWORD=changeme
GSH_MAX_PLAYERS=16
```

---

### 🌐 Réseau

```env
GSH_GAME_PORT=15636
GSH_QUERY_PORT=15637
```

---

### 🧠 Wine / Display

```env
GSH_USE_WINE=true
GSH_WINEPREFIX=/opt/wine/enshrouded
GSH_WINEARCH=win64
GSH_DISPLAY=:99
GSH_XVFB_RESOLUTION=1024x768x16
```

---

### ⚙️ Exécution

```env
GSH_SERVER_EXE=enshrouded_server.exe
GSH_START_ARGS=
```

---

## 🔌 Ports

- `15636/udp` → Game Port
- `15637/udp` → Query Port

---

## 💾 Volumes

```yaml
volumes:
  - ./data/server:/opt/games/server
  - ./data/config:/opt/games/config
  - ./data/wine:/opt/wine
  - ./data/steam:/opt/steam
```

---

## ▶️ Exemple docker-compose

```yaml
version: "3.8"

services:
  enshrouded:
    image: slymer29/gsh-enshrouded:latest
    container_name: gsh-enshrouded
    restart: unless-stopped

    ports:
      - "15636:15636/udp"
      - "15637:15637/udp"

    environment:
      GSH_SERVER_NAME: "Mon serveur Enshrouded"
      GSH_ADMIN_PASSWORD: "changeme"
      GSH_MAX_PLAYERS: 16

    volumes:
      - ./data/server:/opt/games/server
      - ./data/config:/opt/games/config
      - ./data/wine:/opt/wine
      - ./data/steam:/opt/steam
```

---

## ⚠️ Important

- Enshrouded Dedicated Server est une application Windows exécutée via Wine
- Le premier démarrage peut être long (téléchargement SteamCMD)
- L’image ne contient pas les fichiers du jeu
- Les fichiers sont téléchargés automatiquement au premier lancement

---

## 🎯 Intégration GameServer-Hub

Cette image suit le standard GSH :

- Variables unifiées (`GSH_*`)
- Structure identique pour tous les jeux
- Déploiement automatisé
- Gestion centralisée via panel

---

## 🔥 Auteur

Image maintenue par **slymer29**

Optimisée pour l’écosystème **GameServer-Hub (GSH)**
