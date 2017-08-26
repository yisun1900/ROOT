<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));

String xh=null;
String zcbm=null;
double zqdj=0;
double dpzk=0;
double dj=0;
double sl=0;
double zqje=0;
double je=0;
double ycf=0;
String zcpzwzbm=null;
String zcysbm=null;
String cxhdbz=null;
String bz=null;
String jldwbm=null;
String qtfy=null;
String xzjg=null;
String zcmc=null;
String zclbbm=null;
String xinghao=null;
String gg=null;
String sfbhpj=null;
String pjts=null;
String lsj=null;
String yhj=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String bjbz=null;
double qtfyje=0;
String cxhdbl=null;
String cxhdje=null;
String gys=null;
String ppmc=null;
double cbj=0;
double jsbl=0;
double bzcbj=0;
double bzcxhdbl=0;
double cxcbj=0;
double lscxhdbl=0;
String sftjcp=null;
String sxbz=null;
String sxbzmc=null;
String sxhtyy=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int row=0;

try {
	conn=cf.getConnection();
%>

<html>
<head>
<title>请修改主材订单明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>


 <div align="center">审核手写项目结算比例－批量录入（订单编号：<%=ddbh%>）</div>


<DIV style="DISPLAY: inline; OVERFLOW: auto;  WIDTH: 100%;  HEIGHT:97%"> 

<TABLE  bgcolor="#999999" cellpadding="0" cellspacing="0" border=1 width="270%" style='FONT-SIZE: 12px'>
<form method="post" action="" name="editform">
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
	<td  width="5%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">主材名称</td>
	<td  width="5%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">型号</td>
	<td  width="4%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">规格</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">修改</td>
	<td  width="4%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">手写合同原因</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">数量</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">折前单价</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">折扣</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">折后单价</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">结算比例</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">结算单价</span></td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">颜色</td>
	<td  width="3%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">铺装位置</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">计量单位</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">折前材料费</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">折后材料费</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">远程费</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">选择其它费</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">其它费金额</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">参加促销活动</td>
	<td  width="3%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">计入促销活动比率</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">计入促销活动金额</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">手写标志</td>
	<td  width="20%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">备注</td>
	<td  width="8%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">系列</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">是否包含配件</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">配件数</td>
</tr>


<%
	ls_sql="select xh,zcbm,zcmc,zclbbm,xinghao,gg,zqdj,dpzk,dj,sl,zqje,je,ycf,zcpzwzbm,zcysbm,DECODE(cxhdbz,'Y','参加','N','不参加') cxhdbz,bz,jldwbm,DECODE(qtfy,'1','安装费','2','加工费','3','其它收费','W','无') qtfy,xzjg,DECODE(sfbhpj,'Y','包含','N','不包含') sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,jsbl,cbj,bzcbj,bzcxhdbl,cxcbj,lscxhdbl,DECODE(sftjcp,'Y','是','N','否') sftjcp";
	ls_sql+=" ,sxbz,DECODE(sxbz,'1','非手写','2','手写') sxbzmc,sxhtyy ";
	ls_sql+=" from  jc_zcddmx";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' and jc_zcddmx.sxbz='2'";//1：非手写；2：手写
	ls_sql+=" order by sxbz,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		sxbz=cf.fillNull(rs.getString("sxbz"));
		sxbzmc=cf.fillNull(rs.getString("sxbzmc"));
		sxhtyy=cf.fillHtml(rs.getString("sxhtyy"));
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillHtml(rs.getString("zcmc"));
		zclbbm=cf.fillHtml(rs.getString("zclbbm"));
		xinghao=cf.fillHtml(rs.getString("xinghao"));
		gg=cf.fillHtml(rs.getString("gg"));
		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		zqje=rs.getDouble("zqje");
		je=rs.getDouble("je");
		ycf=rs.getDouble("ycf");
		zcpzwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		cxhdbz=cf.fillNull(rs.getString("cxhdbz"));
		bz=cf.fillNull(rs.getString("bz"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		xzjg=cf.fillNull(rs.getString("xzjg"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		qtfyje=rs.getDouble("qtfyje");
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		cxhdje=cf.fillNull(rs.getString("cxhdje"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		jsbl=rs.getDouble("jsbl");
		cbj=rs.getDouble("cbj");
		bzcbj=rs.getDouble("bzcbj");
		bzcxhdbl=rs.getDouble("bzcxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		lscxhdbl=rs.getDouble("lscxhdbl");
		sftjcp=cf.fillNull(rs.getString("sftjcp"));


		%>
		<tr bgcolor="#E8E8FF"  align="center">
			<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
				<%=zcmc%>
			</td>
			<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
				<%=xinghao%>
			</td>
			<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
				<%=gg%>
			</td>
			<td>
				<A HREF="LrJsblJc_zcddmx.jsp?ddbh=<%=ddbh%>&xh=<%=xh%>" target="_blank">修改</A>
				<input type="hidden" name="xh"  value="<%=xh%>" >
			</td>
			<td ><%=sxhtyy%></td>
			<td ><%=sl%></td>
			<td ><%=zqdj%></td>
			<td ><%=dpzk%></td>
			<td ><%=dj%>
				<input type="hidden" name="dj"  value="<%=dj%>" >
			</td>
			<td bgcolor="#CC99FF" >
				<input type="text" name="jsbl" size="5" maxlength="9"  value="<%=jsbl%>" onChange="f_jsjg(editform,<%=row%>)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">%
			</td>
			<td >
				<input type="text" name="cbj" size="9" maxlength="16"  value="<%=cbj%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
			</td>
			<td><%=zcysbm%></td>
			<td><%=zcpzwzbm%></td>
			<td ><%=jldwbm%></td>
			<td ><%=zqje%></td>
			<td><%=je%></td>
			<td ><%=ycf%></td>
			<td ><%=qtfy%></td>
			<td ><%=qtfyje%>
			<td><%=cxhdbz%></td>
			<td  ><%=cxhdbl%>%</td>
			<td ><%=cxhdje%></td>
			<td ><%=sxbzmc%></td>
			<td ><%=bz%></td>
			<td ><%=zclbbm%></td>
			<td ><%=sfbhpj%></td>
			<td ><%=pjts%></td>
		</tr>
		<%

		row++;

	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr> 
	<td colspan="3" align="center" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
		<input type="hidden" name="ddbh" value="<%=ddbh%>">
		<input type="button" value="保存" onClick="f_do(editform)" >
	</td>
	<td colspan="23" >&nbsp;</td>
</tr>
</form>
</table>
</DIV>





</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_jsjg(FormName,row)//参数FormName:Form的名称
{
	if (<%=row%>==1)
	{
		var cbj=FormName.dj.value*FormName.jsbl.value/100;
		cbj=round(cbj,2);

		FormName.cbj.value=cbj;
	}
	else{
		var cbj=FormName.dj[row].value*FormName.jsbl[row].value/100;
		cbj=round(cbj,2);

		FormName.cbj[row].value=cbj;
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if (<%=row%>==1)
	{
		f_jsjg(FormName,1);

		if(	javaTrim(FormName.jsbl)=="") {
			alert("请输入[结算比例]！");
			FormName.jsbl.focus();
			return false;
		}
		if(!(isFloat(FormName.jsbl, "结算比例"))) {
			return false;
		}

		if (parseFloat(FormName.jsbl.value)<=0 || parseFloat(FormName.jsbl.value)>100)
		{
			alert("[结算比例]只能在0到100之间！");
			FormName.jsbl.select();
			return false;
		}

		
		if(	javaTrim(FormName.cbj)=="") {
			alert("请输入[结算价]！");
			FormName.cbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cbj, "结算价"))) {
			return false;
		}
	}
	else{
		for (var i=0;i< <%=row%> ;i++ )
		{
			f_jsjg(FormName,i);

			if(	javaTrim(FormName.jsbl[i])=="") {
				alert("请输入[结算比例]！");
				FormName.jsbl[i].focus();
				return false;
			}
			if(!(isFloat(FormName.jsbl[i], "结算比例"))) {
				return false;
			}

			if (parseFloat(FormName.jsbl[i].value)<=0 || parseFloat(FormName.jsbl[i].value)>100)
			{
				alert("[结算比例]只能在0到100之间！");
				FormName.jsbl[i].select();
				return false;
			}

			
			if(	javaTrim(FormName.cbj[i])=="") {
				alert("请输入[结算价]！");
				FormName.cbj[i].focus();
				return false;
			}
			if(!(isFloat(FormName.cbj[i], "结算价"))) {
				return false;
			}
		}
	}


	FormName.action="SavePlLrJsblJc_zcddmx.jsp";
	FormName.submit();
	return true;
}




//-->
</SCRIPT>
