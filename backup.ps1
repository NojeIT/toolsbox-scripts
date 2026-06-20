Import-Module Posh-SSH

# Développé pendant mes cours de PowerShell, ce script permet de sauvegarder le dossier personnel d'un utilisateur et de l'envoyer sur un serveur SFTP.

# Variables utilisateur pour la connexion 
$nom = "" # Remplacer par votre prénom
$prenom = "" # Remplacer par votre nom
$date = Get-Date -Format "yyyyMMdd_HHmmss" # Format de la date

# Spécifier le chemin du dossier personnel à sauvegarder 
$cheminDossier = [System.Environment]::GetFolderPath('MyPictures') # Dossier Documents de l'utilisateur

# Spécifier le dossier de sauvegarde local où se trouvera le dossier de sauvegarde
$cheminSauvegarde = "C:\Sauvegardes" # Répertoire de sauvegarde
if (-not (Test-Path $cheminSauvegarde)) {
    New-Item -ItemType Directory -Path $cheminSauvegarde # Créer le dossier de sauvegarde s'il n'existe pas
}

# Définir le nom du fichier ZIP
$nomFichierZip = "Sauvegarde_${nom}_${prenom}_${date}.zip"
$cheminZip = Join-Path -Path $cheminSauvegarde -ChildPath $nomFichierZip

# Créer le fichier ZIP avec tous les fichiers du dossier personnel
Compress-Archive -Path "$cheminDossier\*" -DestinationPath $cheminZip

# Informations de connexion SFTP
$serveur = "" # IP
$utilisateur = ""  # Remplacer par votre utilisateur 
$motDePasse = Read-Host "tape le mdp : " -AsSecureString # Mettre le MDP de session

# Créer une session SFTP
$sessionSFTP = New-SFTPSession -ComputerName $serveur -Credential (New-Object System.Management.Automation.PSCredential($utilisateur, $motDePasse))

# Vérifier si le dossier SAUVE existe, sinon le créer
$remoteDirectory = "SAUVE"
if (-not (Test-Path -Path $remoteDirectory)) {
    New-Item -ItemType Directory -Path "SAUVE"
}

Set-SFTPItem -SessionId $sessionSFTP.SessionId -Path $cheminZip -Destination $remoteDirectory

Write-Host "Sauvegarde envoyée avec succès sur le serveur."