import random
import tkinter as tk

class VikingLottoGenerator:
    def __init__(self, master):
        self.master = master
        master.title("Viking Lotto numbrite genereerija")

        self.label = tk.Label(master, text="Vajuta nuppu, et genereerida Viking Lotto numbrid!")
        self.label.pack(pady=10)

        self.generate_button = tk.Button(master, text="Genereeri", command=self.generate_numbers)
        self.generate_button.pack(pady=10)

        self.numbers_label = tk.Label(master, text="")
        self.numbers_label.pack()

    def generate_numbers(self):
        # Genereeri 6 unikaalset juhuslikku numbrit vahemikus 1 kuni 48
        numbers = random.sample(range(1, 49), 6)

        # Genereeri üks juhuslik Vikingi number vahemikus 1 kuni 5
        viking = random.randint(1, 5)

        # Kuva genereeritud numbrid kasutaja liidese kaudu
        numbers_str = "Viking Lotto numbrid:\n" + ", ".join(str(num) for num in numbers)
        viking_str = "Vikingi number: " + str(viking)
        self.numbers_label.configure(text=numbers_str + "\n" + viking_str)

root = tk.Tk()
my_gui = VikingLottoGenerator(root)
root.mainloop()

