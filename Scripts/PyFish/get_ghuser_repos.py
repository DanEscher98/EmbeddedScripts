import itertools
from pprint import pprint
import requests
import os
from typing import Dict, Iterable, Any
from datetime import datetime

token = os.environ.get('GH_TOKEN')
headers = {'Authorization': f'token {token}'}


def get_user_repos(username):
    repos = []
    url = f'https://api.github.com/users/{username}/repos?per_page=100'
    url_page = lambda page: url + f'&page={page}'

    for i in itertools.count(start=1):
        response = requests.get(url_page(i), headers=headers).json()
        filtered_repos = filter(
            lambda repo: not repo["fork"]
            and repo["name"][:7] != ".github"
            and repo["name"] != username
            and len(requests.get(repo['languages_url'],
                                 headers=headers).json()) > 0,
            response)
        repos.extend(filtered_repos)
        if len(response) < 100:
            return repos


def print_sorted_repos(repos, target_langs=[]):
    # Sort repositories by the date of the last modification
    sorted_repos = sorted(
            repos,
            key=lambda x: datetime.strptime(
                x['updated_at'], '%Y-%m-%dT%H:%M:%SZ'),
            reverse=True)

    # Print repository names and last modification date
    for repo in sorted_repos:
        repo_name = repo['name']
        last_modified_date = datetime.strptime(
            repo['updated_at'], '%Y-%m-%dT%H:%M:%SZ'
            ).strftime('%Y-%m-%d %H:%M:%S')
        languages = filter_languages(
                requests.get(repo['languages_url'], headers=headers).json(),
                target_langs)
        if len(languages) > 0:
            print(f"{repo_name}")
            print(f"\tLast modified on \'{last_modified_date}\'")
            print("\tLanguages: ", end="")
            pprint(languages)
            print("-" * 46)


def filter_languages(langs, target_langs):
    if len(target_langs) == 0:
        return langs
    discards = set(langs.keys()).difference(set(target_langs))
    for lang in discards:
        del langs[lang]
    return langs
