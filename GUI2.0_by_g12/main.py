import sys
from cal_ui import Ui_MainWindow
from PyQt5.QtGui import QDoubleValidator
from PyQt5.QtWidgets import QApplication, QMainWindow
class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)
if __name__ == '__main__':
    # 实例化，传参
    app = QApplication(sys.argv)
    # 创建对象
    Window = MainWindow()
    # 创建窗口
    Window.show()
    # 进入程序的主循环，并通过exit函数确保主循环安全结束(该释放资源的一定要释放)
    sys.exit(app.exec_())