<%@ page language="C#" autoeventwireup="true" enableviewstate="false" inherits="Duogu.Yusuan.PrintPro, App_Web_xtghf2up" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%= Session["cmp"] %>工程预算系统--打印预算单</title>
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
  factory.printing.footer = "　理解本预算,同意施工,业主签字:_________日期:______年___月___日 公司联系电话:<%=Session["contact"].ToString()%>&b&p/&P　."
  factory.printing.leftMargin = 0.75;
  factory.printing.topMargin = 15;
  factory.printing.rightMargin = 0.75;
  factory.printing.bottomMargin =0;
  factory.printing.portrait = true    // 纵向打印
  pageBreak("printtable",70,920);
  }
</script>
    <form id="form1" runat="server">
    <div align=center>
			<div class="noprint">
				<INPUT class="Button" onclick="factory.printing.Preview();" type="button" value="打印预览" name="Print">
				<INPUT class="Button" onclick="factory.printing.Print(false);" type="button" value="打印" name="Print">
				<INPUT class="Button" onclick="factory.printing.PageSetup();" type="button" value="页面设置" name="Print">
				<INPUT class="Button" onclick="window.close();" type="button" value="关闭" name="CloseWindow">
		<INPUT class="Button" onclick="window.location='PrintProp.aspx?proid=<%=proid%>'" type="button" value="纵向按工程项目打印" name="Print"><br />
				<b><br />如果不能打印，请安装打印插件！如果错过安装，请按F5重新刷新页面安装！<br /><a href="js/smsx.exe"><font color=red>也可以直接点击此处下载安装文件来安装</font></a></b>
				<br />如需要打印灰色的背景，请在IE里设置一下，在 工具-->internet 选项-->高级,找到“打印”，<br />
				把“打印背景颜色和图像”的选项上打勾，然后按确定，再进行打印 
			
			</div>
			
    <img src="images/ss.jpg" border=0 width=700px height=58 />
    <table border=1 cellspacing=0 cellpadding=0 width=700px><tr><td style="height: 21px" width=210>客户姓名：<asp:Label ID="lblName" runat="server"></asp:Label></td>
        <td style="height: 21px" width=220>
            工程负责人：<asp:Label ID="lblRen" runat="server"></asp:Label></td>
        <td style="height: 21px" width=200>
            设计师：<asp:Label ID="lblDesigner" runat="server"></asp:Label></td>
        <td style="height: 21px" width=200>
            制单日期：<asp:Label ID="lblDate" runat="server"></asp:Label></td>
    </tr>
        <tr>
            <td style="height: 21px" colspan=4>
                客户地址：<asp:Label ID="lblAddress" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 21px" colspan=2>
                客户电话：<asp:Label ID="lblTel" runat="server"></asp:Label></td>
            <td style="height: 21px">
                竣工时间：<asp:Label ID="lblFinish" runat="server"></asp:Label></td>
            <td style="height: 21px">
                建筑面积：<asp:Label ID="lblArea" runat="server"></asp:Label>
                平方米</td>
        </tr>
    </table>

    
 
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>序号</td><td width=150 nowrap>项目名称</td><td width=40 nowrap>单位</td><td width=40 nowrap>数量</td><td width=70 nowrap>单价（元）</td><td width=60 nowrap>金额</td><td nowrap>材料及工艺做法</td></tr>
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
        <tr><td colspan=2 align="right">直接工程款:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">管理费：</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>管理费率：<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                设计费：</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                设计费率：<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">税金：</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>税金费率：<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">合计：</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>序号</td><td width=150 nowrap>项目名称</td><td width=40 nowrap>单位</td><td width=40 nowrap>数量</td><td width=70 nowrap>单价（元）</td><td width=60 nowrap>金额</td><td nowrap>材料及工艺做法</td></tr>
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
        <tr><td colspan=2 align="right">直接工程款:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">管理费：</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>管理费率：<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                设计费：</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                设计费率：<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">税金：</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>税金费率：<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">合计：</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>序号</td><td width=150 nowrap>项目名称</td><td width=40 nowrap>单位</td><td width=40 nowrap>数量</td><td width=70 nowrap>单价（元）</td><td width=60 nowrap>金额</td><td nowrap>材料及工艺做法</td></tr>
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
        <tr><td colspan=2 align="right">直接工程款:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">管理费：</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>管理费率：<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                设计费：</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                设计费率：<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">税金：</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>税金费率：<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">合计：</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>序号</td><td width=150 nowrap>项目名称</td><td width=40 nowrap>单位</td><td width=40 nowrap>数量</td><td width=70 nowrap>单价（元）</td><td width=60 nowrap>金额</td><td nowrap>材料及工艺做法</td></tr>
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
        <tr><td colspan=2 align="right">直接工程款:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">管理费：</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>管理费率：<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                设计费：</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                设计费率：<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">税金：</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>税金费率：<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">合计：</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>序号</td><td width=150 nowrap>项目名称</td><td width=40 nowrap>单位</td><td width=40 nowrap>数量</td><td width=70 nowrap>单价（元）</td><td width=60 nowrap>金额</td><td nowrap>材料及工艺做法</td></tr>
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
        <tr><td colspan=2 align="right">直接工程款:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">管理费：</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>管理费率：<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                设计费：</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                设计费率：<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">税金：</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>税金费率：<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">合计：</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>序号</td><td width=150 nowrap>项目名称</td><td width=40 nowrap>单位</td><td width=40 nowrap>数量</td><td width=70 nowrap>单价（元）</td><td width=60 nowrap>金额</td><td nowrap>材料及工艺做法</td></tr>
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
        <tr><td colspan=2 align="right">直接工程款:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">管理费：</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>管理费率：<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                设计费：</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                设计费率：<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">税金：</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>税金费率：<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">合计：</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>序号</td><td width=150 nowrap>项目名称</td><td width=40 nowrap>单位</td><td width=40 nowrap>数量</td><td width=70 nowrap>单价（元）</td><td width=60 nowrap>金额</td><td nowrap>材料及工艺做法</td></tr>
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
        <tr><td colspan=2 align="right">直接工程款:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">管理费：</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>管理费率：<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                设计费：</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                设计费率：<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">税金：</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>税金费率：<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">合计：</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
    <table  id="printtable"  border=1 cellspacing=0 cellpadding=0 width=700px><tr  class="title"><td width=40 nowrap>序号</td><td width=150 nowrap>项目名称</td><td width=40 nowrap>单位</td><td width=40 nowrap>数量</td><td width=70 nowrap>单价（元）</td><td width=60 nowrap>金额</td><td nowrap>材料及工艺做法</td></tr>
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
        <tr><td colspan=2 align="right">直接工程款:</td><td colspan=5><asp:Label ID="lblTaxB" runat="server"></asp:Label></td></tr>
       <tr><td colspan=2 align="right">管理费：</td><td colspan=4><asp:Label ID="lblMange" runat="server"></asp:Label></td> <td>管理费率：<asp:Label ID="lblManPer" runat="server"></asp:Label></td></tr>
        <tr>
            <td align="right" colspan="2">
                设计费：</td>
            <td colspan="4">
                <asp:Label ID="lblDesignFee" runat="server"></asp:Label></td>
            <td>
                设计费率：<asp:Label ID="lblDesignRate" runat="server"></asp:Label></td>
        </tr>
           <tr><td colspan=2 align="right">税金：</td><td colspan=4><asp:Label ID="lblTax" runat="server"></asp:Label> </td> <td>税金费率：<asp:Label ID="lblTaxPer" runat="server"></asp:Label></td></tr>
        <tr><td colspan=2 align="right">合计：</td><td colspan=5><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
        </table>
         </div>
    </form>
      
</body>
</html>

