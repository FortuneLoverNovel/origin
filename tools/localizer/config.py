tmp_folder = "locals"

files = {
    "alan": "game/alan/data/scenario/main/alan.ks",
    "gio": "game/geordo/data/scenario/main/gio.ks",
    "keeth": "game/keith/data/scenario/main/keeth.ks",
    "nicol": "game/nicol/data/scenario/main/nicol.ks",
}


class Row:
    key: str
    jp: str
    en: str
    ru: str

    def __init__(self, key: str, jp: str, en: str = "", ru: str = ""):
        self.key = key
        self.jp = jp
        self.en = en
        self.ru = ru
