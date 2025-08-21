import crypt

password = input("Enter your password: ")
hashed_password = crypt.crypt(password, "$6$rounds=656000$" + crypt.mksalt(crypt.METHOD_SHA512)[3:])

print("Hashed password: ")
print(hashed_password)