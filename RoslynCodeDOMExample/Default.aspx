<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RoslynCodeDOMExample.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Roslyn Code DOM Compiler Support in .NET 4.6</title>
</head>
<body>
    <form id="form1" runat="server">
        <pre>Example One: String Interpolation</pre>
        <%
			// Define two example variables to concatenate using C# 6.0 String Interpolation
			var firstName = "Rion";
			var lastName = "Williams";

			// Attempt to use the C# 6.0 String Interpolation feature for formatting strings
			var output = $"{lastName}, {firstName}";
        %>

        <!-- Write out the result -->
        <%= output %>

       <pre>Example Two: Exception Filters</pre>
        <%
			// Define a variable that will be "caught" by in the Exception Filter
			var x = 42;

			try
			{
				// Define a null object
				object result = null;
				// Trigger a null reference exception
				var stringifiedResult = result.ToString();
			}
			catch(NullReferenceException ex) if (x == 42){
				// This will explicitly handle the exception
				Response.Write("The exception was handled in the Null Reference block as x was 42.");
			}
            catch(Exception ex){
				// Otherwise fall through to this block and handle here
				Response.Write($"x was {x} and not 42, so it was handled in the generic catch block.");
			}
        %>

        <pre>Example Three: Null Conditional Operator</pre>
        <%
			// The null conditional operator (?.) can be used to simplify null checking to avoid
			// Null Reference exceptions without the traditional if-null statements
			var cookieName = Request?.Cookies["Example"]?.Value ?? "No Example Cookie was found";
        %>
        <%= cookieName %>
    </form>
</body>
</html>
