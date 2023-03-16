import random
import tkinter as tk

# Defineeri funktsioon numbritest genereerimiseks
def generate_numbers():
    # Vali 7 unikaalset numbrit vahemikus 1 kuni 18 ja 26 kuni 48
    numbers = set()
    while len(numbers) < 7:
        num = random.choice(list(range(1, 19)) + list(range(26, 49)))
        numbers.add(num)
    
    # Genereeri üks juhuslik Vikingi number vahemikus 1 kuni 5
    viking = random.randint(1, 5)
    
    # Kuvage numbrid kasutajaliideses
    numbers_label.config(text=str(sorted(numbers)))
    viking_label.config(text=str(viking))

# Loo kasutajaliides
root = tk.Tk()
root.title(" Viking Lotto numbrid ")

# Tekstiväli numbritest näitamiseks
numbers_label = tk.Label(root, text="", font=("Helvetica", 18))
numbers_label.pack(pady=10)

# Tekstiväli Vikingi numbrist näitamiseks
viking_label = tk.Label(root, text="", font=("Helvetica", 18))
viking_label.pack(pady=10)

# Nupp numbritest genereerimiseks
generate_button = tk.Button(root, text="Genereeri numbrid", command=generate_numbers)
generate_button.pack(pady=10)

# Käivita kasutajaliides
root.mainloop()

