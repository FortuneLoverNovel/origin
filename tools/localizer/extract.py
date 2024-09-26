import csv
import os
import re
from config import Row, files, tmp_folder

phrase_regex = re.compile(r"^(.+)(\[\w\])$")


def extract():
    for file in files.values():
        template = []
        strings = []
        i = 0

        with open(file, "r", encoding="utf-8") as f:
            for line in f:
                is_phrase = phrase_regex.match(line)
                if is_phrase:
                    i += 1
                    key = f"phrase{i}"
                    model = Row(key=key, jp=is_phrase.group(1))
                    strings.append(model)
                    template.append(f"{{{key}}}{is_phrase.group(2)}\n")
                else:
                    template.append(line)

        template_path = os.path.join(
            tmp_folder, file.split("/")[-1].replace(".ks", ".template")
        )
        strings_path = os.path.join(
            tmp_folder, file.split("/")[-1].replace(".ks", ".csv")
        )

        os.makedirs(tmp_folder, exist_ok=True)

        with open(template_path, "w", encoding="utf-8") as f:
            f.writelines(template)

        with open(strings_path, "w", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=Row.__annotations__.keys())
            writer.writeheader()
            for row in strings:
                writer.writerow(row.__dict__)


if __name__ == "__main__":
    extract()
