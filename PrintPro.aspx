<%@ page language="C#" autoeventwireup="true" enableviewstate="false" inherits="Duogu.Yusuan.PrintPro, App_Web_xtghf2up" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%= Session["cmp"] %>����Ԥ��ϵͳ--��ӡԤ�㵥</title>
	<LINK href="css.css" type="text/css" rel="stylesheet">
	<style type="text/css">
 table{border:1px solid #000;border-width:1px 0 0 1px;margin:2px 0 2px 0;text-align:center;border-collapse:collapse;}
 td,th{border:1px solid #000;border-width:0 1px 1px 0;margin:2px 0 2px 0;text-align:left;}
 th{text-align:center;font-weight:600;font-size:12px;background-color:#F4F4F4;} 
 .title{center;font-weight:800;font-size:12px;}
	</style>
	<style media="print">.noprint { DISPLAY: none }
	.pagenext { PAGE-BREAK-AFTER: always }
		</style>
</head>
<body>
  <object id="factory" width="0" height="0" border="0"   classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" codebase="js/smsx.cab"></object>
<script type="text/javascript" src="js/print.js"></script>
<script defer>
function window.onload() {
  factory.printing.header = ""
  factory.printing.footer = "����ⱾԤ��,ͬ��ʩ��,ҵ��ǩ��:_________����:______��___��___�� ��˾��ϵ�绰:<%=Session["contact"].ToString()%>&b&p/&P��."
  factory.printing.leftMargin = 0.75;
  factory.printing.topMargin = 15;
  factory.printing.rightMargin = 0.75;
  factory.printing.bottomMargin =0;
  factory.printing.portrait = true    // �����ӡ
  pageBreak("printtable",70,920);
  }
</script>
    <form id="form1" runat="server">
    <div align=center>
			<div class="noprint">
				<INPUT class="Button" onclick="factory.printing.Preview();" type="button" value="��ӡԤ��" name="Print">
				<INPUT class="Button" onclick="factory.printing.Print(false);" type="button" value="��ӡ" name="Print">
				<INPUT class="Button" onclick="factory.printing.PageSetup();" type="button" value="ҳ������" name="Print">
				<INPUT class="Button" onclick="window.close();" type="button" value="�ر�" name="CloseWindow">
		<INPUT class="Button" onclick="window.location='PrintProp.aspx?proid=<%=proid%>'" type="button" value="���򰴹�����Ŀ��ӡ" name="Print"><br />
				<b><br />������ܴ�ӡ���밲װ��ӡ�������������װ���밴F5����ˢ��ҳ�氲װ��<br /><a href="js/smsx.exe"><font color=red>Ҳ����ֱ�ӵ���˴����ذ�װ�ļ�����װ</font></a></b>
				<br />����Ҫ��ӡ��ɫ�ı���������IE������һ�£��� ����-->internet ѡ��-->�߼�,�ҵ�����ӡ����<br />
				�ѡ���ӡ������ɫ��ͼ�񡱵�ѡ���ϴ򹴣�Ȼ��ȷ�����ٽ��д�ӡ 
			
			</div>
			
    <img src="images/ss.jpg" border=0 width=700px height=58 />
    <table border=1 cellspacing=0 cellpadding=0 width=700px><tr><td style="height: 21px" width=210>�ͻ�������<asp:Label ID="lblName" runat="server"></asp:Label></td>
        <td style="height: 21px" width=220>
            ���̸����ˣ�<asp:Label ID="lblRen" runat="server"></asp:Label></td>
        <td style="height: 21px" width=200>
            ���ʦ��<asp:Label ID="lblDesigner" runat="server"></asp:Label></td>
        <td style="height: 21px" width=200>
            �Ƶ����ڣ�<asp:Label ID="lblDate" runat="server"></asp:Label></td>
    </tr>
        <tr>
            <td style="height: 21px" colspan=4>
                �ͻ���ַ��<asp:Label ID="lblAddress" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 21px" colspan=2>
                �ͻ��绰��<asp:Label ID="lblTel" runat="server"></asp:Label></td>
            <td style="height: 21px">
                ����ʱ�䣺<asp:Label ID="lblFinish" runat="server"></asp:Label></td>
            <td style="height: 21px">
                ���������<asp:Label ID="lblArea" runat="server"></asp:Label>
                ƽ����</td>
        </tr>
    </table>

    
 
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>���</td><td width=150 nowrap>��Ŀ����</td><td width=40 nowrap>��λ</td><td width=40 nowrap>����</td><td width=70 nowrap>���ۣ�Ԫ��</td><td width=60 nowrap>���</td><td nowrap>���ϼ���������</td></tr>
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
       <tr bgcolor=gray  class="title"><td><%#Eval("OrderID") %></td><td colspan=4><%#Eval("Name") %></td><td><%#Eval("Amt","{0:C}") %></td><td>&nbsp;</td></tr> 
       <asp:Repeater ID=r runat=server DataSource='<%#GetDetail(Eval("ID").ToString(),proid) %>'>
       <ItemTemplate><tr><td valign=top><%#Eval("orderNO") %></td><td valign=top>
           <%#Eval("ProjectName") %></td><td valign=top>
               <%#Eval("Unit") %>
           </td><td valign=top><%#Eval("Num") %></td><td valign=top><%#Eval("Price","{0:C}")%></td><td valign=top><%#Eval("Amt","{0:C}") %></td><td valign=top><%#Eval("Techics") %></td></tr></ItemTemplate>
       </asp:Repeater>
        </ItemTemplate>
        </asp:Repeater>
        <tr><td colspan=2 align="right">ֱ�ӹ��̿�:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">����ѣ�</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>������ʣ�<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                ��Ʒѣ�</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                ��Ʒ��ʣ�<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">˰��</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>˰����ʣ�<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">�ϼƣ�</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>���</td><td width=150 nowrap>��Ŀ����</td><td width=40 nowrap>��λ</td><td width=40 nowrap>����</td><td width=70 nowrap>���ۣ�Ԫ��</td><td width=60 nowrap>���</td><td nowrap>���ϼ���������</td></tr>
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
       <tr bgcolor=gray  class="title"><td><%#Eval("OrderID") %></td><td colspan=4><%#Eval("Name") %></td><td><%#Eval("Amt","{0:C}") %></td><td>&nbsp;</td></tr> 
       <asp:Repeater ID=r runat=server DataSource='<%#GetDetail(Eval("ID").ToString(),proid) %>'>
       <ItemTemplate><tr><td valign=top><%#Eval("orderNO") %></td><td valign=top>
           <%#Eval("ProjectName") %></td><td valign=top>
               <%#Eval("Unit") %>
           </td><td valign=top><%#Eval("Num") %></td><td valign=top><%#Eval("Price","{0:C}")%></td><td valign=top><%#Eval("Amt","{0:C}") %></td><td valign=top><%#Eval("Techics") %></td></tr></ItemTemplate>
       </asp:Repeater>
        </ItemTemplate>
        </asp:Repeater>
        <tr><td colspan=2 align="right">ֱ�ӹ��̿�:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">����ѣ�</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>������ʣ�<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                ��Ʒѣ�</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                ��Ʒ��ʣ�<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">˰��</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>˰����ʣ�<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">�ϼƣ�</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>���</td><td width=150 nowrap>��Ŀ����</td><td width=40 nowrap>��λ</td><td width=40 nowrap>����</td><td width=70 nowrap>���ۣ�Ԫ��</td><td width=60 nowrap>���</td><td nowrap>���ϼ���������</td></tr>
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
       <tr bgcolor=gray  class="title"><td><%#Eval("OrderID") %></td><td colspan=4><%#Eval("Name") %></td><td><%#Eval("Amt","{0:C}") %></td><td>&nbsp;</td></tr> 
       <asp:Repeater ID=r runat=server DataSource='<%#GetDetail(Eval("ID").ToString(),proid) %>'>
       <ItemTemplate><tr><td valign=top><%#Eval("orderNO") %></td><td valign=top>
           <%#Eval("ProjectName") %></td><td valign=top>
               <%#Eval("Unit") %>
           </td><td valign=top><%#Eval("Num") %></td><td valign=top><%#Eval("Price","{0:C}")%></td><td valign=top><%#Eval("Amt","{0:C}") %></td><td valign=top><%#Eval("Techics") %></td></tr></ItemTemplate>
       </asp:Repeater>
        </ItemTemplate>
        </asp:Repeater>
        <tr><td colspan=2 align="right">ֱ�ӹ��̿�:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">����ѣ�</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>������ʣ�<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                ��Ʒѣ�</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                ��Ʒ��ʣ�<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">˰��</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>˰����ʣ�<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">�ϼƣ�</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>���</td><td width=150 nowrap>��Ŀ����</td><td width=40 nowrap>��λ</td><td width=40 nowrap>����</td><td width=70 nowrap>���ۣ�Ԫ��</td><td width=60 nowrap>���</td><td nowrap>���ϼ���������</td></tr>
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
       <tr bgcolor=gray  class="title"><td><%#Eval("OrderID") %></td><td colspan=4><%#Eval("Name") %></td><td><%#Eval("Amt","{0:C}") %></td><td>&nbsp;</td></tr> 
       <asp:Repeater ID=r runat=server DataSource='<%#GetDetail(Eval("ID").ToString(),proid) %>'>
       <ItemTemplate><tr><td valign=top><%#Eval("orderNO") %></td><td valign=top>
           <%#Eval("ProjectName") %></td><td valign=top>
               <%#Eval("Unit") %>
           </td><td valign=top><%#Eval("Num") %></td><td valign=top><%#Eval("Price","{0:C}")%></td><td valign=top><%#Eval("Amt","{0:C}") %></td><td valign=top><%#Eval("Techics") %></td></tr></ItemTemplate>
       </asp:Repeater>
        </ItemTemplate>
        </asp:Repeater>
        <tr><td colspan=2 align="right">ֱ�ӹ��̿�:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">����ѣ�</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>������ʣ�<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                ��Ʒѣ�</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                ��Ʒ��ʣ�<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">˰��</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>˰����ʣ�<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">�ϼƣ�</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>���</td><td width=150 nowrap>��Ŀ����</td><td width=40 nowrap>��λ</td><td width=40 nowrap>����</td><td width=70 nowrap>���ۣ�Ԫ��</td><td width=60 nowrap>���</td><td nowrap>���ϼ���������</td></tr>
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
       <tr bgcolor=gray  class="title"><td><%#Eval("OrderID") %></td><td colspan=4><%#Eval("Name") %></td><td><%#Eval("Amt","{0:C}") %></td><td>&nbsp;</td></tr> 
       <asp:Repeater ID=r runat=server DataSource='<%#GetDetail(Eval("ID").ToString(),proid) %>'>
       <ItemTemplate><tr><td valign=top><%#Eval("orderNO") %></td><td valign=top>
           <%#Eval("ProjectName") %></td><td valign=top>
               <%#Eval("Unit") %>
           </td><td valign=top><%#Eval("Num") %></td><td valign=top><%#Eval("Price","{0:C}")%></td><td valign=top><%#Eval("Amt","{0:C}") %></td><td valign=top><%#Eval("Techics") %></td></tr></ItemTemplate>
       </asp:Repeater>
        </ItemTemplate>
        </asp:Repeater>
        <tr><td colspan=2 align="right">ֱ�ӹ��̿�:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">����ѣ�</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>������ʣ�<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                ��Ʒѣ�</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                ��Ʒ��ʣ�<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">˰��</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>˰����ʣ�<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">�ϼƣ�</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>���</td><td width=150 nowrap>��Ŀ����</td><td width=40 nowrap>��λ</td><td width=40 nowrap>����</td><td width=70 nowrap>���ۣ�Ԫ��</td><td width=60 nowrap>���</td><td nowrap>���ϼ���������</td></tr>
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
       <tr bgcolor=gray  class="title"><td><%#Eval("OrderID") %></td><td colspan=4><%#Eval("Name") %></td><td><%#Eval("Amt","{0:C}") %></td><td>&nbsp;</td></tr> 
       <asp:Repeater ID=r runat=server DataSource='<%#GetDetail(Eval("ID").ToString(),proid) %>'>
       <ItemTemplate><tr><td valign=top><%#Eval("orderNO") %></td><td valign=top>
           <%#Eval("ProjectName") %></td><td valign=top>
               <%#Eval("Unit") %>
           </td><td valign=top><%#Eval("Num") %></td><td valign=top><%#Eval("Price","{0:C}")%></td><td valign=top><%#Eval("Amt","{0:C}") %></td><td valign=top><%#Eval("Techics") %></td></tr></ItemTemplate>
       </asp:Repeater>
        </ItemTemplate>
        </asp:Repeater>
        <tr><td colspan=2 align="right">ֱ�ӹ��̿�:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">����ѣ�</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>������ʣ�<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                ��Ʒѣ�</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                ��Ʒ��ʣ�<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">˰��</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>˰����ʣ�<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">�ϼƣ�</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>���</td><td width=150 nowrap>��Ŀ����</td><td width=40 nowrap>��λ</td><td width=40 nowrap>����</td><td width=70 nowrap>���ۣ�Ԫ��</td><td width=60 nowrap>���</td><td nowrap>���ϼ���������</td></tr>
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
       <tr bgcolor=gray  class="title"><td><%#Eval("OrderID") %></td><td colspan=4><%#Eval("Name") %></td><td><%#Eval("Amt","{0:C}") %></td><td>&nbsp;</td></tr> 
       <asp:Repeater ID=r runat=server DataSource='<%#GetDetail(Eval("ID").ToString(),proid) %>'>
       <ItemTemplate><tr><td valign=top><%#Eval("orderNO") %></td><td valign=top>
           <%#Eval("ProjectName") %></td><td valign=top>
               <%#Eval("Unit") %>
           </td><td valign=top><%#Eval("Num") %></td><td valign=top><%#Eval("Price","{0:C}")%></td><td valign=top><%#Eval("Amt","{0:C}") %></td><td valign=top><%#Eval("Techics") %></td></tr></ItemTemplate>
       </asp:Repeater>
        </ItemTemplate>
        </asp:Repeater>
        <tr><td colspan=2 align="right">ֱ�ӹ��̿�:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">����ѣ�</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>������ʣ�<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                ��Ʒѣ�</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                ��Ʒ��ʣ�<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">˰��</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>˰����ʣ�<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">�ϼƣ�</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>���</td><td width=150 nowrap>��Ŀ����</td><td width=40 nowrap>��λ</td><td width=40 nowrap>����</td><td width=70 nowrap>���ۣ�Ԫ��</td><td width=60 nowrap>���</td><td nowrap>���ϼ���������</td></tr>
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
       <tr bgcolor=gray  class="title"><td><%#Eval("OrderID") %></td><td colspan=4><%#Eval("Name") %></td><td><%#Eval("Amt","{0:C}") %></td><td>&nbsp;</td></tr> 
       <asp:Repeater ID=r runat=server DataSource='<%#GetDetail(Eval("ID").ToString(),proid) %>'>
       <ItemTemplate><tr><td valign=top><%#Eval("orderNO") %></td><td valign=top>
           <%#Eval("ProjectName") %></td><td valign=top>
               <%#Eval("Unit") %>
           </td><td valign=top><%#Eval("Num") %></td><td valign=top><%#Eval("Price","{0:C}")%></td><td valign=top><%#Eval("Amt","{0:C}") %></td><td valign=top><%#Eval("Techics") %></td></tr></ItemTemplate>
       </asp:Repeater>
        </ItemTemplate>
        </asp:Repeater>
        <tr><td colspan=2 align="right">ֱ�ӹ��̿�:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">����ѣ�</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>������ʣ�<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                ��Ʒѣ�</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                ��Ʒ��ʣ�<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">˰��</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>˰����ʣ�<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">�ϼƣ�</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
         </div>
    </form>
      
</body>
</html>

