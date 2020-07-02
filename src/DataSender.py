import os
import socket
import threading


class DataSender:
    def __init__(self, address='127.0.0.1', port=9000, file_path=''):
        self.address = address
        self.port = port
        self.file_path = file_path

    def sender(self):
        soc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        soc.connect(self.address, self.port)
        file_to_send = os.path.normpath(self.file_path)
        try:
            file = open(file_to_send, 'rb')
            print(file)
            send_thread = DataSenderThread(soc, file)
            send_thread.start()
        except IOError:
            print('something wrong with IO')


class DataSenderThread(threading.Thread):
    def __init__(self, sock, file):
        threading.Thread.__init__(self)
        self.sock = sock
        self.file = file

    def run(self):
        buffers = 1024
        cnt = 0
        while True:
            data = self.file.read(buffers)  # 读取文件数据
            if not data:  # 读取为空
                print('no data yet')
                break
            self.sock.send(data)
        print('data send completed')
        self.file.close()
        self.sock.close()
