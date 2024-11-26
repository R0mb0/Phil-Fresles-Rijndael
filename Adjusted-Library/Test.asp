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