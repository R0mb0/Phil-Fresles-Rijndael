# Phil Fresle's Rijndael library for ASP - Adjusted library documentation

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/1842e978056b4031ac78178e76779015)](https://app.codacy.com/gh/R0mb0/Phil-Fresles-Rijndael/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
 
## License

- **FILENAME:**     Rijndael.asp
- **AUTHOR:**       Phil Fresle
- **CREATED:**      19-Feb-2001
- **COPYRIGHT:**    Copyright 2001 Phil Fresle
- **EMAIL:**        phil@frez.co.uk
- **WEB:**          http://www.frez.co.uk

- **DESCRIPTION:**
  Implementation of the AES Rijndael Block Cipher. Inspired by Mike Scott's
  implementation in C. 



### `rijndael.asp`'s interface

- `Public Function EncryptData(ByVal message, ByVal password)`
- `Public Function DecryptData(ByVal message, ByVal password)`

### Example how to encrypt and decrypt

```
<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="rijndael.asp"-->
<%
Dim key
Dim text 
Dim crypted
Dim decrypted

key = "protect"
text = "Something to be protected"

Response.write("<br> <h2> Informations </h2>" & crypted)

Response.write("<br> Key: " & key)
Response.write("<br> Text: " & text)

crypted = EncryptData(text, key)

Response.write("<br> <h2> Crypted message: </h2>" & crypted)

decrypted = DecryptData(crypted, key)

Response.write("<br> <h2> Decrypted message: </h2>" & decrypted)
%>
```

## ⚠️ I've modified the original library for working with strings directly rather than transforms it in bytes
