<%@ Page Title="" Language="C#" MasterPageFile="~/Inland.master" AutoEventWireup="true" CodeFile="ITAssetsIns.aspx.cs" Inherits="ITAssetsIns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Incore" runat="Server">
    <style>
        #divwidth1 {
            font-size: small;
        }

        .auto-style1 {
            width: 55%;
            height: 142px;
        }

        .auto-style3 {
            color: #0000FF;
        }
    </style>
    <table style="align-content: center;" align="center" class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label1" Style="font-size: small" runat="server" Text="Location Name:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLLoc" Style="font-size: small" runat="server" Width="100px">
                </asp:DropDownList>
            </td>

            <td>
                <asp:Label ID="Label2" Style="font-size: small" runat="server" Text="Asset Type:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLAtype" runat="server" Width="100px">
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label3" Style="font-size: small" runat="server" Text="Model :"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLMdl" runat="server" Width="100px">
                </asp:DropDownList>
            </td>

            <td>
                <asp:Label ID="Label4" Style="font-size: small" runat="server" Text="Make :"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLMake" runat="server" Width="100px">
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Style="font-size: small" Text="Serial No :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtSerno" runat="server" Width="100px"></asp:TextBox>
            </td>

            <td>
                <asp:Label ID="Label6" runat="server" Style="font-size: small" Text="OS :"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLOS" runat="server" Width="100px">
                </asp:DropDownList>
            </td>
        </tr>


        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Style="font-size: small" Text="Office :"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLOffce" runat="server" Width="100px">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="Label8" runat="server" Style="font-size: small" Text="RAM :"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLRam" runat="server" Width="100px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Style="font-size: small" Text="HardDisk :"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLHD" runat="server" Width="100px">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="Label10" runat="server" Style="font-size: small" Text="Employee :"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLEmp" runat="server" Width="100px">
                </asp:DropDownList>
            </td>
        </tr>
      
        <tr> 
            <td></td>
            <td style="height: 17px; margin-right: 250px;">
                <strong>
                    <asp:Button ID="BttnSave" runat="server" Text="Save" OnClick="Button_Save" ClientIDMode="AutoID" EnableViewState="False" CssClass="auto-style3" />
                </strong>
            </td>
            <td style="height: 17px;">
                <strong>
                    <asp:Button ID="BttnClear" runat="server" Text="Clear" OnClick="BttnClear_Click" CssClass="auto-style3" />
                </strong>
            </td>
        </tr>
    </table>
    <br />

    <center>
        <asp:Panel ID="panel1" runat="server" Width="1000px" ScrollBars="Horizontal">
    
            <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" CssClass="align"  
            CellPadding="4" Width="800px" Height="53px" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" OnRowCommand="GridView1_RowCommand">
            <Columns>
             
              <%--  <asp:TemplateField HeaderText="Id" Visible="false">
                    <ItemTemplate>
                        <%#Eval("ITAssid") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAssetId" runat="server" Visible="false" Text='<%# Eval("ITAssid")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>--%>
                

                <asp:TemplateField HeaderText="LocationName">
                    <ItemTemplate>
                        
                        <asp:Label Id="lblLoca" runat="server" Text='<%#Eval("Locationname") %>'></asp:Label>
                    </ItemTemplate>
                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AssetTypeDesc">
                    <ItemTemplate>
                        
                        <asp:Label Id="lblAssetTypeDesc" runat="server" Text='<%#Eval("AssetTypeDesc") %>'></asp:Label>
                    </ItemTemplate>
                 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Model">
                    <ItemTemplate>
                       
                        <asp:Label Id="lblModel" runat="server" Text=' <%#Eval("Model")%>'></asp:Label>
                    </ItemTemplate>
                  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MakeDesc">
                    <ItemTemplate>
                      
                        <asp:Label Id="lblMakeDesc" runat="server" Text=' <%#Eval("MakeDesc")%>'></asp:Label>
                    </ItemTemplate>
                 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="serialno">
                    <ItemTemplate>
                       
                        <asp:Label Id="lblserialno" runat="server" Text=' <%#Eval("serialno")%>'></asp:Label>
                    </ItemTemplate>
                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="OS">
                    <ItemTemplate>
                     
                        <asp:Label Id="lblOS" runat="server" Text=' <%#Eval("OS") %>'></asp:Label>
                    </ItemTemplate>
                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Office">
                    <ItemTemplate>
                        
                        <asp:Label Id="lblOffice" runat="server" Text='<%#Eval("Office") %>'></asp:Label>
                    </ItemTemplate>
                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RAM">
                    <ItemTemplate>
                        
                        <asp:Label Id="lblRAM" runat="server" Text=' <%#Eval("RAM") %>'></asp:Label>
                    </ItemTemplate>
                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="HDISCK">
                    <ItemTemplate>
                       
                        <asp:Label Id="lblHDISCK" runat="server" Text=' <%#Eval("HDISCK") %>'></asp:Label>
                    </ItemTemplate>
                   
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EMPNM">
                    <ItemTemplate>
                       
                        <asp:Label Id="lblEMPNM" runat="server" Text='<%#Eval("EMPNM") %>'></asp:Label>
                    </ItemTemplate>
                    
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Action">
                <%--    <ItemTemplate>  
                        <asp:CheckBox ID="chck" runat="server" AutoPostBack="true" OnCheckedChanged="chck_CheckedChanged" />
                    </ItemTemplate>  --%>
                   
            <ItemTemplate>
                <asp:LinkButton Text="Select" ID="lnkSelect" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>"/>
            </ItemTemplate>
        
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" HorizontalAlign="Center" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
            <asp:SqlDataSource runat="server"></asp:SqlDataSource>
         </asp:Panel>
    </center>
    

   
</asp:Content>

