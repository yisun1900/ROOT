<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String hflxbm=request.getParameter("hflxbm");
String hflxmc=cf.executeQuery("select hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'");

String khbh[]=request.getParameterValues("khbh");
if (khbh==null)
{
	out.println("请选择客户!");
	return;
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2">回访明细（<%=cf.fillNull(hflxmc)%>）
</CENTER>
<table border="1"  cellspacing="0" cellpadding="1"  style='FONT-SIZE:12px' width="1107">
  <tr align="center"> 
    <td width="20" >&nbsp;</td>
    <td width="45"  >&nbsp;</td>
    <td colspan="10" >设计师满意度</td>
    <td colspan="10" >工程担当满意度</td>
    <td colspan="10" >工程质量满意度</td>
    <td rowspan="3" width="98">回访问题</td>
  </tr>
  <tr align="center"> 
    <td width="20" >&nbsp;</td>
    <td >客户</td>
    <td width="45" >设计师</td>
    <td colspan="3" bgcolor="#FF66FF" >满意</td>
    <td colspan="3" bgcolor="#9999FF" >较满意</td>
    <td colspan="3" bgcolor="#00CC00" >不满意</td>
    <td width="45" >工程担当</td>
    <td colspan="3" bgcolor="#FF66FF" >满意</td>
    <td colspan="3" bgcolor="#9999FF" >较满意</td>
    <td colspan="3" bgcolor="#00CC00" >不满意</td>
    <td width="45" >施工队</td>
    <td colspan="3" bgcolor="#FF66FF" >满意</td>
    <td colspan="3" bgcolor="#9999FF" >较满意</td>
    <td colspan="3" bgcolor="#00CC00" >不满意</td>
  </tr>
  <tr align="center"> 
    <td  width="20">序号</td>
    <td >姓名</td>
    <td width="45">姓名</td>
    <td width="25" bgcolor="#FF66FF">设计方案</td>
    <td width="25" bgcolor="#FF66FF">后期服务</td>
    <td width="25" bgcolor="#FF66FF">交底清楚</td>
    <td width="25" bgcolor="#9999FF">设计方案</td>
    <td width="25" bgcolor="#9999FF">后期服务</td>
    <td width="25" bgcolor="#9999FF">交底清楚</td>
    <td width="25" bgcolor="#00CC00">设计方案</td>
    <td width="25" bgcolor="#00CC00">后期服务</td>
    <td width="25" bgcolor="#00CC00">交底清楚</td>
    <td width="45" >姓名</td>
    <td width="25" bgcolor="#FF66FF" >服务</td>
    <td width="25" bgcolor="#FF66FF" >到位</td>
    <td width="25" bgcolor="#FF66FF" >尽责</td>
    <td width="25" bgcolor="#9999FF" >服务</td>
    <td width="25" bgcolor="#9999FF" >到位</td>
    <td width="25" bgcolor="#9999FF" >尽责</td>
    <td width="25" bgcolor="#00CC00" >服务</td>
    <td width="25" bgcolor="#00CC00" >到位</td>
    <td width="25" bgcolor="#00CC00" >尽责</td>
    <td width="45" >姓名</td>
    <td width="25" bgcolor="#FF66FF" >服务态度</td>
    <td width="25" bgcolor="#FF66FF" >施工质量</td>
    <td width="25" bgcolor="#FF66FF" >工人素质</td>
    <td width="25" bgcolor="#9999FF" >服务态度</td>
    <td width="25" bgcolor="#9999FF" >施工质量</td>
    <td width="25" bgcolor="#9999FF" >工人素质</td>
    <td width="25" bgcolor="#00CC00" >服务态度</td>
    <td width="25" bgcolor="#00CC00" >施工质量</td>
    <td width="25" bgcolor="#00CC00" >工人素质</td>
  </tr>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor=null;

int pos=0;
int row=0;
int count=0;

String khxm=null;
String sjs=null;
String sjs1=null;
String sjs2=null;
String sjs3=null;
String sjs4=null;
String sjs5=null;
String sjs6=null;
String sjs7=null;
String sjs8=null;
String sjs9=null;
String zjxm=null;
String zjxm1=null;
String zjxm2=null;
String zjxm3=null;
String zjxm4=null;
String zjxm5=null;
String zjxm6=null;
String zjxm7=null;
String zjxm8=null;
String zjxm9=null;
String sgdmc=null;
String dwmc1=null;
String dwmc2=null;
String dwmc3=null;
String dwmc4=null;
String dwmc5=null;
String dwmc6=null;
String dwmc7=null;
String dwmc8=null;
String dwmc9=null;
String hfnr=null;
try {
	conn=cf.getConnection();

	for (int i=0;i<khbh.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}

		count=0;

		ls_sql="SELECT khxm,sjs,DECODE(sjfa,'21','<font color=\"#FF66FF\">★</font>') sjs1,DECODE(hqfw,'21','<font color=\"#FF66FF\">★</font>') sjs2,DECODE(jdqk,'21','<font color=\"#FF66FF\">★</font>') sjs3,DECODE(sjfa,'22','<font color=\"#9999FF\">◆</font>') sjs4,DECODE(hqfw,'22','<font color=\"#9999FF\">◆</font>') sjs5,DECODE(jdqk,'22','<font color=\"#9999FF\">◆</font>') sjs6,DECODE(sjfa,'23','<font color=\"#00CC00\">▲</font>') sjs7,DECODE(hqfw,'23','<font color=\"#00CC00\">▲</font>') sjs8,DECODE(jdqk,'23','<font color=\"#00CC00\">▲</font>') sjs9";
		ls_sql+=" ,zjxm,DECODE(zjyfw,'21','<font color=\"#FF66FF\">★</font>') zjxm1,DECODE(zjydw,'21','<font color=\"#FF66FF\">★</font>') zjxm2,DECODE(zjyjz,'21','<font color=\"#FF66FF\">★</font>') zjxm3,DECODE(zjyfw,'22','<font color=\"#9999FF\">◆</font>') zjxm4,DECODE(zjydw,'22','<font color=\"#9999FF\">◆</font>') zjxm5,DECODE(zjyjz,'22','<font color=\"#9999FF\">◆</font>') zjxm6,DECODE(zjyfw,'23','<font color=\"#00CC00\">▲</font>') zjxm7,DECODE(zjydw,'23','<font color=\"#00CC00\">▲</font>') zjxm8,DECODE(zjyjz,'23','<font color=\"#00CC00\">▲</font>') zjxm9";
		ls_sql+=" ,sgdmc,DECODE(fwsz,'21','<font color=\"#FF66FF\">★</font>') dwmc1,DECODE(sgzl,'21','<font color=\"#FF66FF\">★</font>') dwmc2,DECODE(grsz,'21','<font color=\"#FF66FF\">★</font>') dwmc3,DECODE(fwsz,'22','<font color=\"#9999FF\">◆</font>') dwmc4,DECODE(sgzl,'22','<font color=\"#9999FF\">◆</font>') dwmc5,DECODE(grsz,'22','<font color=\"#9999FF\">◆</font>') dwmc6,DECODE(fwsz,'23','<font color=\"#00CC00\">▲</font>') dwmc7,DECODE(sgzl,'23','<font color=\"#00CC00\">▲</font>') dwmc8,DECODE(grsz,'23','<font color=\"#00CC00\">▲</font>') dwmc9";
		ls_sql+=" ,DECODE(sjshfnr,null,'',sjshfnr,'[设计师]：'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>[工程担当]：'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>[施工队]：'||sgdhfnr)||DECODE(crm_hfjl.bz,null,'',crm_hfjl.bz,'<BR>[备注]：'||crm_hfjl.bz) as hfnr";
		ls_sql+=" FROM crm_hfjl,sq_sgd,crm_khxx   ";
		ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) ";
		ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_khxx.khbh='"+khbh[i]+"'";

		if (!(hflxbm.equals("")))
		{
			ls_sql+=" and  (crm_hfjl.hflxbm='"+hflxbm+"')";
		}

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			khxm=cf.fillHtml(rs.getString("khxm"));
			sjs=cf.fillHtml(rs.getString("sjs"));
			sjs1=cf.fillHtml(rs.getString("sjs1"));
			sjs2=cf.fillHtml(rs.getString("sjs2"));
			sjs3=cf.fillHtml(rs.getString("sjs3"));
			sjs4=cf.fillHtml(rs.getString("sjs4"));
			sjs5=cf.fillHtml(rs.getString("sjs5"));
			sjs6=cf.fillHtml(rs.getString("sjs6"));
			sjs7=cf.fillHtml(rs.getString("sjs7"));
			sjs8=cf.fillHtml(rs.getString("sjs8"));
			sjs9=cf.fillHtml(rs.getString("sjs9"));

			zjxm=cf.fillHtml(rs.getString("zjxm"));
			zjxm1=cf.fillHtml(rs.getString("zjxm1"));
			zjxm2=cf.fillHtml(rs.getString("zjxm2"));
			zjxm3=cf.fillHtml(rs.getString("zjxm3"));
			zjxm4=cf.fillHtml(rs.getString("zjxm4"));
			zjxm5=cf.fillHtml(rs.getString("zjxm5"));
			zjxm6=cf.fillHtml(rs.getString("zjxm6"));
			zjxm7=cf.fillHtml(rs.getString("zjxm7"));
			zjxm8=cf.fillHtml(rs.getString("zjxm8"));
			zjxm9=cf.fillHtml(rs.getString("zjxm9"));

			sgdmc=cf.fillHtml(rs.getString("sgdmc"));
			dwmc1=cf.fillHtml(rs.getString("dwmc1"));
			dwmc2=cf.fillHtml(rs.getString("dwmc2"));
			dwmc3=cf.fillHtml(rs.getString("dwmc3"));
			dwmc4=cf.fillHtml(rs.getString("dwmc4"));
			dwmc5=cf.fillHtml(rs.getString("dwmc5"));
			dwmc6=cf.fillHtml(rs.getString("dwmc6"));
			dwmc7=cf.fillHtml(rs.getString("dwmc7"));
			dwmc8=cf.fillHtml(rs.getString("dwmc8"));
			dwmc9=cf.fillHtml(rs.getString("dwmc9"));

			hfnr=cf.fillHtml(rs.getString("hfnr"));
/*
*/

			count++;
			row++;

			%>
			<tr bgcolor="#FFFFFF"  align="center">
				<td align="center"><%=row%></td>
				<td align="center"><%=khxm%></td>
				<td align="center"><%=sjs%></td>
				<td align="center"><%=sjs1%></td>
				<td align="center"><%=sjs2%></td>
				<td align="center"><%=sjs3%></td>
				<td align="center"><%=sjs4%></td>
				<td align="center"><%=sjs5%></td>
				<td align="center"><%=sjs6%></td>
				<td align="center"><%=sjs7%></td>
				<td align="center"><%=sjs8%></td>
				<td align="center"><%=sjs9%></td>
				<td align="center"><%=zjxm%></td>
				<td align="center"><%=zjxm1%></td>
				<td align="center"><%=zjxm2%></td>
				<td align="center"><%=zjxm3%></td>
				<td align="center"><%=zjxm4%></td>
				<td align="center"><%=zjxm5%></td>
				<td align="center"><%=zjxm6%></td>
				<td align="center"><%=zjxm7%></td>
				<td align="center"><%=zjxm8%></td>
				<td align="center"><%=zjxm9%></td>
				<td align="center"><%=sgdmc%></td>
				<td align="center"><%=dwmc1%></td>
				<td align="center"><%=dwmc2%></td>
				<td align="center"><%=dwmc3%></td>
				<td align="center"><%=dwmc4%></td>
				<td align="center"><%=dwmc5%></td>
				<td align="center"><%=dwmc6%></td>
				<td align="center"><%=dwmc7%></td>
				<td align="center"><%=dwmc8%></td>
				<td align="center"><%=dwmc9%></td>
				<td align='left'><%=hfnr%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		if (count<1)//不存在
		{
			ls_sql="SELECT khxm FROM crm_khxx   ";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				khxm=cf.fillHtml(rs.getString("khxm"));
			}
			rs.close();
			ps.close();

			%>
			<tr bgcolor="#CC0000"> 
			  <td align="center"><%=(i+1)%></td>
			  <td align="center"><%=khxm%></td>
			  <td colspan="31" bgcolor="#CC0000">无回访数据</td>
			</tr>
			<%
		}
	}
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>

</table>
</body>
</html>

