<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<!DOCTYPE html>

<script runat="server">

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //1-Create Connection Object
        SqlConnection conn = new SqlConnection();
         conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|User.mdf;Integrated Security=True";

        //2-Create Sql Select statement string
        string StrSelect = "SELECT* from Member "
        + "WHERE Username ='" + txtusername.Text + "'AND Password ='" + txtPassword.Text + "'";

        //3-Create Sql command
        SqlCommand cmdSelect = new SqlCommand(StrSelect, conn);

        //4-Create sql data reader
        SqlDataReader reader;

        //5-Open the Database
        conn.Open();

        //6-Execute Sql command
        reader = cmdSelect.ExecuteReader();

        //7-check reader
        if (reader.Read())
        {
            lblMsg.Text = "User Found";
        }

        else
        {
            lblMsg.Text = "User not found";
        }

        //8-Close the dataBase
        conn.Close();

            
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family:Monotype Corsiva;
        }
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            height: 34px;
        }
        .style4
        {
            height: 34px;
        }
        .style5
        {
            width: 96px;
        }
        .style6
        {
            height: 34px;
            width: 96px;
        }

    </style>
</head>
<body>

    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Font-Names="Arial" 
            Font-Size="X-Large" ForeColor="#000066" 
            Text="sign in form "></asp:Label>
        <br />
        <br />
        <table class="style1">
            <tr>
                <td class="style5">
                    <asp:Label ID="Label2" runat="server" Font-Names="Times New Roman (Headings CS)" Font-Size="Medium" 
                        ForeColor="#000066" Text="Username:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtusername" runat="server" Font-Names="Times New Roman (Headings CS)" 
                        Font-Size="Medium" ForeColor="#000066" Width="175px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    <asp:Label ID="Label3" runat="server" Font-Names="Times New Roman (Headings CS)" Font-Size="Medium" 
                        ForeColor="#000066" Text="Password:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" Font-Names="Times New Roman (Headings CS)" 
                        Font-Size="Medium" ForeColor="#000066" TextMode="Password" Width="175px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6">
                </td>
                <td class="style4">
                </td>
            </tr>
            <tr>
                <td class="style5">
                    <asp:Button ID="btnLogin" runat="server" Font-Names="Times New Roman (Headings CS)" Font-Size="Medium" 
                        ForeColor="#000066"  Text="Login" onclick="btnLogin_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    <table class="style1">
        <tr>
            <td class="style3">
                <asp:Label ID="lblMsg" runat="server" Font-Names="Monotype Corsiva" 
                    Font-Size="X-Large" ForeColor="#000066"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
    <p>
        &#39;</p>
</body>
</html>


