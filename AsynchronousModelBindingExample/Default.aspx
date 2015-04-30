<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="Default.aspx.cs" Inherits="AsynchronousModelBindingExample.Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asynchronous Model Binding Support in .NET 4.6</title>
</head>
<body>
    <form id="form1" runat="server">
		<!-- Define a GridView to wire up all of the available methods for the Grid (e.g. Select, Update, Delete) -->
		<asp:GridView ID="WidgetsGrid" runat="server"
					  DataKeyNames="WidgetID"
					  ItemType="AsynchronousModelBindingExample.Models.Widget"
					  SelectMethod="GetWidgets"
					  UpdateMethod="UpdateWidget"
					  DeleteMethod="DeleteWidget">
					  <Columns>
						  <asp:DynamicField DataField="WidgetID" />
						  <asp:DynamicField DataField="WidgetName" />
						  <asp:TemplateField HeaderText="Working Parts">
							  <ItemTemplate>
								  <asp:Label Text="<%# Item.Parts.Count(p => p.IsFunctioning) %>" runat="server"></asp:Label>
							  </ItemTemplate>
						  </asp:TemplateField>
					  </Columns>
		</asp:GridView>
    </form>
</body>
</html>
