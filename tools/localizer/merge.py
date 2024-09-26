import csv
import os
from config import Row, files, tmp_folder


def merge():
    for file in files:
        template_path = os.path.join(tmp_folder, f"{file}.template")
        strings_path = os.path.join(tmp_folder, f"{file}.csv")

        with open(template_path, "r", encoding="utf-8") as f:
            template = f.read()

        with open(strings_path, "r", encoding="utf-8") as f:
            reader = csv.DictReader(f)
            strings = list(reader)

        for lang in Row.__annotations__.keys():
            if lang == "key" or lang == "value":
                continue

            output = template

            for row in strings:
                output = output.replace(f"{{{row['key']}}}", row[lang])

            output_path = files[file].replace(".ks", f".{lang}.ks")
            with open(output_path, "w", encoding="utf-8") as f:
                f.write(output)


if __name__ == "__main__":
    merge()
