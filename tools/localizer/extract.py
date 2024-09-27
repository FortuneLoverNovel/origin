import csv
import os
import re
from config import Row, files, tmp_folder

phrase_regex = re.compile(r"^([^\[\#\;\s\$\}\"\*@][^=\[\.]+)[\w\[\]\t ]*$", re.S)
tag_regex = re.compile(r" (text)=\"(.+?)\"", re.S)
name_regex = re.compile(r"^#(\w+)", re.S)


def extract():
    for file in files.values():
        template = []
        strings = []
        name_keys = {}
        i = 0

        with open(file, "r", encoding="utf-8") as f:
            for line in f:
                is_phrase = phrase_regex.match(line)
                is_tag = tag_regex.search(line)
                is_name = name_regex.match(line)

                replaced_string = line
                if is_phrase:
                    i += 1
                    key = f"phrase{i}"
                    text = is_phrase.group(1).strip()
                    model = Row(key=key, jp=text)
                    strings.append(model)
                    replaced_string = line.replace(text, f"{{{key}}}")
                elif is_tag:
                    i += 1
                    key = f"{is_tag.group(1)}{i}"
                    text = is_tag.group(2).strip()
                    model = Row(key=key, jp=text)
                    strings.append(model)
                    replaced_string = line.replace(text, f"{{{key}}}")
                elif is_name:
                    text = is_name.group(1).strip()
                    if text in name_keys:
                        key = name_keys[text]
                    else:
                        i += 1
                        key = f"name{i}"
                        model = Row(key=key, jp=text)
                        strings.append(model)
                        name_keys[text] = key
                    replaced_string = line.replace(text, f"{{{key}}}")

                template.append(replaced_string)

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
