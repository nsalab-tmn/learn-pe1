import os

def is_prime(num):
#
# Напишите ваш код здесь.
#

def main():

    for i in range(1, 20):
        if is_prime(i + 1):
                print(i + 1, end=" ")
    print()

if __name__ == "__main__":
    main()

