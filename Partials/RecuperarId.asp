<%
dim id 
id = Request.form("id")
if id = null or  id = "" then
%>
<meta http-equiv="<%response.write("refresh")%>" content="<%response.write("0; url=/./Default.asp")%>" />
<%
End If
%>