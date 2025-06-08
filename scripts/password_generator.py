import crypt

password = input("Podaj hasło: ")
hashed_password = crypt.crypt(password, "$6$rounds=656000$" + crypt.mksalt(crypt.METHOD_SHA512)[3:])

print("Zahashowane hasło:")
print(hashed_password)