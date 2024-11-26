# Phil Fresle's Rijndael library for ASP

> The enclosed VB project includes a VB class that implements the Rijndael AES block encryption algorithm. The form in the project runs some test data through the class.
>
>The rijndael.asp file is a VBScript ASP file that can be used as a server side include for encryption using the Rijndael AES block cipher algorithm. The rijndaeltest.asp shows how the encryption routine can be called by running some test data through the algorithm.

## `CRijndael.cls`

-  **MODULE:**       CRijndael
-  **FILENAME:**     CRijndael.cls
-  **AUTHOR:**       Phil Fresle
-  **CREATED:**      16-Feb-2001
- **COPYRIGHT:**    Copyright 2001 Phil Fresle
- **EMAIL:**        phil@frez.co.uk
- **WEB:**          http://www.frez.co.uk

- **DESCRIPTION:**
 Implementation of the AES Rijndael Block Cipher. Inspired by Mike Scott's
 implementation in C. Permission for free direct or derivative use is granted
 subject to compliance with any conditions that the originators of the
 algorithm place on its exploitation.

- **MODIFICATION HISTORY:**
   - **16-Feb-2001   Phil Fresle**     Initial Version
   - **03-Apr-2001   Phil Fresle**     Added EncryptData and DecryptData functions to
                               make it easier to use by VB developers for
                               encrypting and decrypting strings. These procs
                               take large byte arrays, the resultant encoded
                               data includes the message length inserted on
                               the front four bytes prior to encryption.
   - **19-Apr-2001   Phil Fresle**     Thanks to Paolo Migliaccio for finding a bug
                               with 256 bit key. Problem was in the gkey
                               function. Now properly matches NIST values.

## `FTestRijndael.frm`

- **MODULE:**       FTestRijndael
- **FILENAME:**     FTestRijndael.frm
- **AUTHOR:**       Phil Fresle
- **CREATED:**      19-Feb-2001
- **COPYRIGHT:**    Copyright 2001 Phil Fresle
- **EMAIL:**        phil@frez.co.uk
- **WEB:**          http://www.frez.co.uk

- **DESCRIPTION:**
 Tests out the Rijndael classes attached. Do not expect this to be blisteringly
 fast. Implement in C if you want speed.

- **MODIFICATION HISTORY:**
  - **19-Feb-2001   Phil Fresle**     Initial Version
  - **03-Apr-2001   Phil Fresle**     Also tests EncryptData and DecryptData functions
 
## `rijndael.asp`

- **FILENAME:**     Rijndael.asp
- **AUTHOR:**       Phil Fresle
- **CREATED:**      19-Feb-2001
- **COPYRIGHT:**    Copyright 2001 Phil Fresle
- **EMAIL:**        phil@frez.co.uk
- **WEB:**          http://www.frez.co.uk

- **DESCRIPTION:**
  Implementation of the AES Rijndael Block Cipher. Inspired by Mike Scott's
  implementation in C. 

- **PERMISSION:**
 Permission for free direct or derivative use is granted
 subject to compliance with any conditions that the originators of the
 algorithm place on its exploitation.

- **MODIFICATION HISTORY:**
  - **3-Apr-2001 Phil Fresle** Functions added to the bottom for encrypting/decrypting large
 arrays of data. The entire length of the array is inserted as the first four
 bytes onto the front of the first block of the resultant byte array before
 encryption.
  - **19-Apr-2001 Phil Fresle** Thanks to Paolo Migliaccio for finding a bug with 256 bit 
 key. Problem was in the gkey function. Now properly matches NIST values. 

### `rijndael.asp`'s interface

- `Public Function EncryptData(bytMessage, bytPassword)`
- `Public Function DecryptData(bytIn, bytPassword)`

### Example how to encrypt and decrypt

```
    sPlain = "Plain text"
    sPassword = "Key"

    Response.Write "String Plain= " & sPlain & "<BR>"
    Response.Write "String Password =" & sPassword & "<BR>"

    lLength = Len(sPlain)
    ReDim bytIn(lLength-1)
    For lCount = 1 To lLength
        bytIn(lCount-1)=CByte(AscB(Mid(sPlain,lCount,1)))
    Next
    lLength = Len(sPassword)
    ReDim bytPassword(lLength-1)
    For lCount = 1 To lLength
        bytPassword(lCount-1)=CByte(AscB(Mid(sPassword,lCount,1)))
    Next

    bytOut = EncryptData(bytIn, bytPassword)

    sTemp = ""
    For lCount = 0 To UBound(bytOut)
        sTemp = sTemp & Right("0" & Hex(bytOut(lCount)), 2)
    Next
    Response.Write "Encrypted=" & sTemp & "<BR>"

    bytClear = DecryptData(bytOut, bytPassword)

    lLength = UBound(bytClear) + 1
    sTemp = ""
    For lCount = 0 To lLength - 1
        sTemp = sTemp & Chr(bytClear(lCount))
    Next
    Response.Write "Decrypted=" & sTemp & "<BR>"

    Response.Write "<BR>"
```

## ⚠️ I didn't make these files, they're open for public use though. ⚠️
