import sqlite3
import sys
from PySide6.QtWidgets import QApplication, QMainWindow
from PySide6.QtUiTools import QUiLoader
from PySide6.QtCore import QFile

DB_NAME = "sqlite.db"
UI_NAME = "ui.ui"
NAME = "Databaser"

db = sqlite3.connect(DB_NAME)
cursor = db.cursor()
cursor.execute('''
        CREATE TABLE IF NOT EXISTS tabl (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            txt TEXT NOT NULL
        )
    ''')

class Save:
    def __init__(self, arg1, arg2):
        self.arg1 = arg1
        self.arg2 = arg2

        self.save1()
        self.save2()

        db.commit()

    def save1(self):
        cursor.execute('INSERT INTO tabl (txt) VALUES (?)', (self.arg1,))

    def save2(self):
        cursor.execute('INSERT INTO tabl (txt) VALUES (?)', (self.arg2,))

class Load:
    def __init__(self):
        self.arg1 = None
        self.arg2 = None

        self.load1()
        self.load2()

    def load1(self):
        cursor.execute('SELECT txt FROM tabl ORDER BY id DESC LIMIT 1 OFFSET 1')
        row = cursor.fetchone()
        if row:
            return row[0]

    def load2(self):
        cursor.execute('SELECT txt FROM tabl ORDER BY id DESC LIMIT 1')
        row = cursor.fetchone()
        if row:
            return row[0]   

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        file = QFile(UI_NAME)
        file.open(QFile.ReadOnly)
        self.ui = QUiLoader().load(file, self)
        file.close()

        self.ui.pushButton.clicked.connect(self.save_data)
        self.ui.pushButton_2.clicked.connect(self.load_data)

    def save_data(self):
        text1 = self.ui.lineEdit.text()
        text2 = self.ui.lineEdit_2.text()
        Save(text1, text2)

    def load_data(self):
        text1 = Load().load1()
        text2 = Load().load2()

        if text1:
            self.ui.lineEdit_3.setText(text1)

        if text2:
            self.ui.lineEdit_4.setText(text2)

def main():
    app = QApplication(sys.argv)
    app.setStyle("WindowsVista")
    window = MainWindow()
    window.setCentralWidget(window.ui.centralWidget()) # не ебу что это
    window.setWindowTitle(NAME)
    window.show()
    app.exec()

if __name__ == "__main__":
    main()
