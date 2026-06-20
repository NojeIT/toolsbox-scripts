# 🛠️ Boîte à Outils Scripts - Administration Systèmes & Réseaux

Ce dépôt regroupe un ensemble de mini-scripts et d'outils d'automatisation développés au cours de ma formation technique. Initialement conçus durant mon cursus en **BTS CIEL IR** (Cybersécurité, Informatique et réseaux, Électronique), ces scripts posent les bases de mon évolution vers le **Bachelor Administrateur Systèmes et Réseaux (ASR)** au **CESI**.

L'objectif de ce dépôt est de centraliser des scripts utiles au quotidien pour un administrateur, allant de la gestion des connexions distantes à l'interaction avancée avec des API d'infrastructure virtuelle (VMware).

---
## 👤 À propos de moi

* **Formation précédente :** BTS CIEL IR (Cybersécurité, Informatique et réseaux, Électronique)
* **Formation Actuelle :** 3ème année de Bachelor Administrateur Systèmes et Réseaux (ASR) — CESI
* **Centres d'intérêt :** Automatisation (Ansible, Python, Bash), Cloud & Virtualisation, Architecture des réseaux et systèmes d'informations.

---

## 🚀 Utilisation générale

Ce dépôt est une bibliothèque personnelle de scripts. Pour utiliser l'un des outils présents :
1. Clonez le dépôt sur votre machine locale.
2. Assurez-vous d'avoir les prérequis nécessaires (Python, Bash, etc.) selon le script choisi.
3. Configurez les éventuels fichiers d'environnement (`.env`) nécessaires à l'exécution.
---

## 🚀 Installation & Prérequis

### Prérequis Système
* **Linux** (idéalement pour l'exécution du script Bash et de `xfreerdp`)
* **Python 3.x** installé sur votre machine

### Dépendances Python
Pour faire fonctionner le script VMware, installez les modules nécessaires :
```bash
pip install requests python-dotenv pandas halo urllib3