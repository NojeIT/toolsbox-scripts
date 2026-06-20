import requests
import os
import urllib3
from dotenv import load_dotenv
import pandas as pd
import time
from halo import Halo

load_dotenv()

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

user = os.getenv("VMWARE_USER")
password = os.getenv("VMWARE_PASSWORD")

host = os.getenv("VMWARE_HOST")
BASE_URL = f"https://{host}/api"

requete = requests.post(f'https://{host}/api/session', auth=(user, password), verify=False).json()

headers = {
    "vmware-api-session-id": requete,
    "Content-Type": "application/json"
}

def list_vm (headers):
    pd.set_option("display.max_rows", None)
    pd.set_option("display.width", 1000)
    
    url = f"https://{host}/api/vcenter/vm"
    df_vm = pd.DataFrame(requests.get(url=url, headers=headers, verify=False).json())
    # On applique 'orient="records"' sur le DataFrame filtré d'un seul coup
    vmlist = df_vm[["vm", "name"]]
    vmbynode = {host: vmlist}
    print(vmbynode)
    return vmbynode

def mon_action_vcenter():
    # On configure le rouage textuel (le style 'gear' correspond à un rouage)
    spinner = Halo(text="Interrogation de VMware...", spinner="gear")
    spinner.start()

    try:
        time.sleep(3)
        spinner.succeed("Terminé avec succès !")
    except Exception:
        spinner.fail("Une erreur est survenue.")

list_vm(headers=headers)

choice_user_name_vm = input("Quelle VM voulez vous supprimer ? ")
if choice_user_name_vm is not None:
    choice_user_name_vm = input("Est-ce que vous êtes sûr de vouloir supprimer cette VM ? Si oui, saisissez à nouveau le Vmid ? ")
    if choice_user_name_vm == "NON":
        print("Suppression annulée")

mon_action_vcenter()
remove_vm = requests.delete(f"{BASE_URL}/vcenter/vm/{choice_user_name_vm}", headers=headers, verify=False)