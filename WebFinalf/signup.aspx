<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="WebFinal.signupaspx" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<script runat="server">

    protected void btnregister_Click (object sender, EventArgs e)
    {
        // 1- Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|User.mdf;Integrated Security=True";
        // 2- Create SQL Insert statement string

        string strInsert = String.Format("INSERT INTO Member VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}','{6}')" ,txtFname.Text, txtLname.Text, rbgender.SelectedValue, txtEmail.Text,txtdate_of_birth.Text,txtusername.Text

             , txtpassword.Text);
        // 3- Create SQL Command
        SqlCommand cmdInsert = new SqlCommand(strInsert, conn);
        try
        {
            // 4- Open the database
            conn.Open();

            // 5- Execute SQL Command
            cmdInsert.ExecuteNonQuery();

            // 6- Close the database
            conn.Close();
            lblMsg.Text = "Welcome " + txtFname.Text + "Your account created successfully";
        }
        catch (SqlException err)
        {
            if (err.Number == 2627)
                lblMsg.Text = "The username " + txtusername.Text + " already used, Please Choose another !!";
            else
                lblMsg.Text = "Sorry, database problem, please try later !!";
        }

        catch
        {
            lblMsg.Text = "Sorry, the system is not available at the moment, you may try later !!";
        }

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style5 {
            width: 194px;
        }
        .auto-style6 {
            height: 26px;
            width: 194px;
        }
        .auto-style7 {
            width: 244px;
        }
        .auto-style8 {
            height: 26px;
            width: 244px;
        }
        .auto-style10 {
            width: 194px;
            height: 29px;
        }
        .auto-style11 {
            width: 244px;
            height: 29px;
        }
        .auto-style12 {
            height: 29px;
        }
        .auto-style14 {
            height: 9px;
            width: 194px;
        }
        .auto-style15 {
            height: 9px;
            width: 244px;
        }
        .auto-style16 {
            height: 9px;
        }
        .auto-style17 {
            width: 160px;
        }
        .auto-style18 {
            height: 26px;
            width: 160px;
        }
        .auto-style19 {
            height: 9px;
            width: 160px;
        }
        .auto-style20 {
            width: 160px;
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Monotype Corsiva" ForeColor="#660066" Text="Please fill all the following fields "></asp:Label>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style17">
                    <asp:Label ID="Label2" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="First Name:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtFname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFname" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Label ID="Label3" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Last Name:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtLname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLname" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style19">
                    <asp:Label ID="lblGender" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Gender:"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:RadioButtonList ID="rbgender" runat="server" Width="160px" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
                    <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="rbgender" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style16"></td>
                <td class="auto-style16"></td>
                <td class="auto-style16"></td>
                <td class="auto-style16"></td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Date_OF_Birth:"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtdate_of_birth" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11"></td>
                <td class="auto-style12"></td>
                <td class="auto-style12"></td>
                <td class="auto-style12"></td>
                <td class="auto-style12"></td>
            </tr>
            <tr>
                <td class="auto-style17">
                    <asp:Label ID="Label6" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Email:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">
                    <asp:Label ID="Label7" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Username:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtusername" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">
                    <asp:Label ID="Label8" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Password:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtpassword" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">
                    <asp:Button ID="btnregister" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" OnClick="btnregister_Click" Text="Register" />
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">
                    &nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <p>
                <asp:Label ID="lblMsg" runat="server" Font-Names="Monotype Corsiva" 
                    Font-Size="X-Large" ForeColor="#000066"></asp:Label>
                </p>
    </form>
</body>
</html>
