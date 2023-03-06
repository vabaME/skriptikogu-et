import tkinter as tk
import random

class MissuguneMang:
    def __init__(self, master):
        self.master = master
        master.title("Missugune?")

        self.number = random.randint(1, 10)
        self.guesses_left = 3

        self.label = tk.Label(master, text="Arva ära number vahemikus 1-10:")
        self.label.pack()

        self.entry = tk.Entry(master)
        self.entry.pack()

        self.button = tk.Button(master, text="Kontrolli", command=self.check_guess)
        self.button.pack()

        self.output = tk.Label(master, text="")
        self.output.pack()

        self.quit_button = tk.Button(master, text="Välju", command=master.quit)
        self.quit_button.pack()

    def check_guess(self):
        guess = int(self.entry.get())

        if guess == self.number:
            self.output.config(text="Tubli! Arvasid ära õige numbri: {}".format(self.number))
            self.button.config(state=tk.DISABLED)
            self.entry.config(state=tk.DISABLED)
        else:
            self.guesses_left -= 1

            if self.guesses_left == 0:
                self.output.config(text="Kahjuks kaotasid. Õige number oli {}".format(self.number))
                self.button.config(state=tk.DISABLED)
                self.entry.config(state=tk.DISABLED)
            else:
                if guess < self.number:
                    self.output.config(text="Sinu number on liiga väike. Sul on jäänud {} katset.".format(self.guesses_left))
                else:
                    self.output.config(text="Sinu number on liiga suur. Sul on jäänud {} katset.".format(self.guesses_left))

                self.entry.delete(0, tk.END)

root = tk.Tk()
missugune_mang = MissuguneMang(root)
root.mainloop()

