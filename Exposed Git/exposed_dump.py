from os import system as command
import concurrent.futures
import os


def create_folders(urls):
        dump_dict = {}

        for url in urls:
                url = url.strip()
                if url:
                        file_name = "exposed-git/" + url.split("/")[2]
                        dump_dict[url] = file_name
                        os.makedirs(file_name, exist_ok=True)
        return dump_dict

def dump_git(pair):
        url = pair[0]
        file_name = pair[1]
        command(f"./git_dumper.py {url} {file_name} -j 10 -t 10")

def main():
        os.makedirs("exposed-git", exist_ok=True)
        with open("exposed.txt") as f:
                lines = f.readlines()
        dump_dict = create_folders(lines)

        with concurrent.futures.ThreadPoolExecutor(max_workers=20) as executor:
                fuutre_request = {executor.submit(dump_git, (url, file_name)): (url, file_name) for url, file_name in dump_dict.items()}
                for future in concurrent.futures.as_completed(future_request):
                        data = future.result()

main()
