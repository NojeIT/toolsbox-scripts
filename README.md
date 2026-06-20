# 🛠️ Boîte à Outils Scripts - Administration Systèmes & Réseaux

Ce dépôt regroupe un ensemble de mini-scripts et d'outils d'automatisation développés au cours de ma formation technique. Initialement conçus durant mon cursus en **BTS CIEL IR** (Cybersécurité, Informatique et réseaux, Électronique), ces scripts posent les bases de mon évolution vers le **Bachelor Administrateur Systèmes et Réseaux (ASR)** au **CESI**.

L'objectif de ce dépôt est de centraliser des scripts utiles au quotidien pour un administrateur, allant de la gestion des connexions distantes à l'interaction avancée avec des API d'infrastructure virtuelle (VMware).

---

## 📂 Contenu du Dépôt

### 1. 🐍 Gestion de l'Infrastructure VMware via API (`interaction_api_vmware.py`)
Un script en Python qui interagit directement avec l'API REST de VMware vCenter. 
* **Fonctionnalités :** * Connexion sécurisée et gestion de session via les variables d'environnement (`.env`).
  * Récupération et affichage structuré de la liste des machines virtuelles à l'aide de la librairie **Pandas**.
  * Module de suppression sécurisée d'une VM avec double confirmation de l'utilisateur.
  * Retour visuel dynamique dans le terminal grâce à un indicateur de chargement (**Halo/Spinner**).

### 2. 🐚 Client de Connexion RDP Automatisé (`clientRDP.sh`)
Un script Bash léger conçu pour simplifier et accélérer l'ouverture de sessions de bureau à distance sous Linux.
* **Fonctionnalités :**
  * Demande interactive de l'adresse du serveur et de l'identifiant.
  * Vérification de la présence des variables pour éviter les erreurs de saisie.
  * Initialisation automatique de la session graphique à l'aide de l'outil `xfreerdp`.

---

## 🚀 Installation & Prérequis

### Prérequis Système
* **Linux** (idéalement pour l'exécution du script Bash et de `xfreerdp`)
* **Python 3.x** installé sur votre machine

### Dépendances Python
Pour faire fonctionner le script VMware, installez les modules nécessaires :
```bash
pip install requests python-dotenv pandas halo urllib3