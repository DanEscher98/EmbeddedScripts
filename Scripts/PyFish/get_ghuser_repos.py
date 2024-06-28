import itertools
from pprint import pprint
import requests
import os
from typing import Dict, Iterable, Any
from datetime import datetime

token = os.environ.get('GH_TOKEN')
headers = {'Authorization': f'token {token}'}


def get_user_repos(username) -> list:
    valid_repos = []
    url = f'https://api.github.com/users/{username}/repos?per_page=100'
    url_page = lambda page: url + f'&page={page}'

    for i in itertools.count(start=1):
        response = requests.get(url_page(i), headers=headers).json()
        
        for repo in response:
            if repo["fork"] or (repo["name"][:7] == ".github") or (repo["name"] == username):
                continue

            languages: dict[str, int] = requests.get(repo['languages_url'], headers=headers).json()

            if len(languages.keys()) > 0:
                valid_repos.append({
                    "name": repo.name,
                    "updated_at": datetime.strptime(repo['updated_at'], '%Y-%m-%dT%H:%M:%SZ'),
                    "languages": languages
                })

        if len(response) < 100:
            return valid_repos

    # Unreachable
    return valid_repos


def print_sorted_repos(repos, target_langs=[]):
    # Sort repositories by the date of the last modification
    sorted_repos = sorted(
            repos,
            key=lambda x: x['updated_at'],
            reverse=True)

    # Print repository names and last modification date
    for repo in sorted_repos:
        repo_name = repo['name']
        last_modified_date = repo['updated_at'].strftime('%Y-%m-%d %H:%M:%S')

        print(f"{repo_name}")
        print(f"\tLast modified on \'{last_modified_date}\'")
        print("\tLanguages: ", end="")
        pprint(repo["languages"])
        print("-" * 46)


def filter_languages(langs, target_langs):
    if len(target_langs) == 0:
        return langs
    discards = set(langs.keys()).difference(set(target_langs))
    for lang in discards:
        del langs[lang]
    return langs


if __name__ == '__main__':
    user = "DanEscher98"
    repos = get_user_repos(user)
    target_langs = []

    for repo in repos:
        repo["languages"] = filter_languages(repo["languages"], target_langs)

    
    print_sorted_repos(repos)
