<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String fgs=request.getParameter("fgs");

	String wheresql="";
	String ls_sql=null;
	if (!(fgs.equals("")))
	{
		wheresql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>工程统计表
  <BR>(统计时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
      <table border="1" width="150%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="9%" rowspan="3">分公司</td>
          <td  width="6%" rowspan="3">签约数</td>
          <td  width="8%" rowspan="3">签约额</td>
          <td colspan="4">未开工工地</td>
          <td colspan="3">在施工工地</td>
          <td colspan="4">本期竣工工地</td>
        </tr>
        <tr bgcolor="#CCCCCC"  align="center">
          <td colspan="2">本期之前未开</td>
          <td colspan="2">本期签单未开</td>
          <td width="7%" rowspan="2">5：本期新开工工地</td>
          <td width="7%" rowspan="2">6：在施遗留</td>
          <td width="7%" rowspan="2">7：在施延期</td>
          <td colspan="2">本期竣工未结算工地</td>
          <td colspan="2">本期完结工地</td>
        </tr>
        <tr bgcolor="#CCCCCC"  align="center">
          <td width="7%">1：未交首款</td>
          <td width="7%">2：已交首款</td>
          <td width="7%">3：未交首款</td>
          <td width="7%">4：已交首款</td>
          <td width="7%">8：正常工期竣工工地（未延期）</td>
          <td width="7%">9：延期竣工工地</td>
          <td width="7%">10：正常工期完结工地（未延期）</td>
          <td width="7%">11：延期完结工地</td>
        </tr>
<%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String fgsbh=null;
String fgsmc=null;

int qys=0;
double qye=0;

int qqwjk=0;//前期未交首款
int qqyjk=0;//前期已交首款
int bqwjk=0;//本期未交首款
int bqyjk=0;//本期已交首款

int bqxk=0;//本期新开工工地
int zsyl=0;//在施遗留
int zsyq=0;//在施延期

int zcjg=0;//正常竣工
int yqjg=0;//延期竣工
int zcwj=0;//正常完结
int yqwj=0;//延期完结


int allqys=0;//总签约数
double allqye=0;//总签约额

int allqqwjk=0;//前期未交首款
int allqqyjk=0;//前期已交首款
int allbqwjk=0;//本期未交首款
int allbqyjk=0;//本期已交首款

int allbqxk=0;//本期新开工工地
int allzsyl=0;//在施遗留
int allzsyq=0;//在施延期

int allzcjg=0;//正常竣工
int allyqjg=0;//延期竣工
int allzcwj=0;//正常完结
int allyqwj=0;//延期完结

try {
	conn=cf.getConnection();
	ls_sql="SELECT sq_dwxx.dwmc fgs,sq_dwxx.dwbh fgsbh ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		fgsmc=rs.getString("fgs");

		//签约数 签约额 
		ls_sql="select count(*) qye,sum(qye) qye";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' ";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			qys=rs1.getInt(1);
			qye=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();
		
		allqys+=qys;
		allqye+=qye;

		//前期未交首款
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq<TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and (cwsfke<=100 OR cwsfke is null)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			qqwjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allqqwjk+=qqwjk;

		//前期已交首款
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq<TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and cwsfke>100 ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			qqyjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allqqyjk+=qqyjk;

		//本期未交首款
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and (cwsfke<=100 OR cwsfke is null)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqwjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allbqwjk+=bqwjk;

		//本期已交首款
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cwsfke>100 ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqyjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allbqyjk+=bqyjk;

		//本期新开工工地
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and sjkgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and sjkgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqxk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allbqxk+=bqxk;

		//在施遗留
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and sjkgrq<TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and (TO_DATE('"+sjfw2+"','YYYY-MM-DD')-sjkgrq) <= (jgrq-kgrq)+NVL(hzts,0) ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsyl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsyl+=zsyl;

		//在施延期
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and (TO_DATE('"+sjfw2+"','YYYY-MM-DD')-sjkgrq) > (jgrq-kgrq)+NVL(hzts,0) ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsyq=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsyq+=zsyq;

		//正常竣工
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='4'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-sjkgrq <= jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zcjg=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzcjg+=zcjg;

		//延期竣工
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='4'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-sjkgrq > jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			yqjg=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allyqjg+=yqjg;

		//正常完结
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='5'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-sjkgrq <= jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zcwj=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzcwj+=zcwj;

		//延期完结
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='5'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-sjkgrq > jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			yqwj=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allyqwj+=yqwj;
%>
		<tr align="center">
          <td><%=fgsmc%></td>
          <td ><A HREF="Crm_khxxxQd.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=qys%></A></td>
          <td><%=cf.formatDouble((int)qye)%></td>
          <td align="right"><A HREF="Crm_khxxxQqwjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=qqwjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxQqyjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=qqyjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxBqwjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqwjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxBqyjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqyjk%></A></td>

          <td align="right"><A HREF="Crm_khxxxBqxk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqxk%></A></td>
          <td align="right"><A HREF="Crm_khxxxZsyl.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsyl%></A></td>
          <td align="right"><A HREF="Crm_khxxxZsyq.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsyq%></A></td>

          <td align="right"><A HREF="Crm_khxxxZcjg.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zcjg%></A></td>
          <td align="right"><A HREF="Crm_khxxxYqjg.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=yqjg%></A></td>
          <td align="right"><A HREF="Crm_khxxxZcwj.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zcwj%></A></td>
          <td align="right"><A HREF="Crm_khxxxYqwj.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=yqwj%></A></td>
        </tr>
<%
	}
	ps.close();
	rs.close();
%>

        <tr align="center" >
          <td><font color=red><B>总计</B></font></td>
          <td><B><%=allqys%></B></td>
          <td><B><%=cf.formatDouble((int)allqye)%></B></td>
          <td><B><%=allqqwjk%></B></td>
          <td><B><%=allqqyjk%></B></td>
          <td><B><%=allbqwjk%></B></td>
          <td><B><%=allbqyjk%></B></td>

          <td><B><%=allbqxk%></B></td>
          <td><B><%=allzsyl%></B></td>
          <td><B><%=allzsyq%></B></td>

          <td><B><%=allzcjg%></B></td>
          <td><B><%=allyqjg%></B></td>
          <td><B><%=allzcwj%></B></td>
          <td><B><%=allyqwj%></B></td>
        </tr>
        <tr align="center" >
          <td colspan="3"><font color=red><B>分 类 总 计</B></font></td>
          <td colspan="4"><B><%=(allqqwjk+allqqyjk+allbqwjk+allbqyjk)%></B></td>

          <td colspan="3"><B><%=(allbqxk+allzsyl+allzsyq)%></B></td>

          <td colspan="4"><B><%=(allzcjg+allyqjg+allzcwj+allyqwj)%></B></td>
        </tr>

<%}
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

&nbsp;<br>
说明：

<BR>本期是指：[<%=sjfw%>]--[<%=sjfw2%>]之间。												
<BR>本期之前是指：[<%=sjfw%>]之前。												
<BR>合同工期：合同竣工－合同开工。												
<BR>实际工期：实际竣工－实际开工（完工） 或 [<%=sjfw2%>]－实际开工（未完工）。												
<BR>合法工期：合同工期＋延期单天数。												
<BR>1、本期之前已签单未缴纳首期款的未开工工地数。												
<BR>2、本期之前已签单已缴纳首期款的未开工工地数。												
<BR>4、本期已签单已缴纳首期款的未开工工地数。												
<BR>5、本期开工的工地数。
<BR>6、[<%=sjfw%>]之前开工工地，到[<%=sjfw2%>]时未完工，且实际工期<合法工期。
<BR>7、到[<%=sjfw2%>]时未完工工地，且实际工期>合法工期。
<BR>8、本期办理竣工手续未交齐款项的工地并且实际竣工日期不大于合法工期的。（未延期）
<BR>9、本期办理竣工手续未交齐款项的工地并且实际竣工日期大于合法工期的。（延期）
<BR>10、客户在本期缴纳完全部的款项并与财务办理完各项款项的工地并且实际竣工日期不大于合法工期的。（未延期）
<BR>11、客户在本期缴纳完全部的款项并与财务办理完各项款项的工地并且实际竣工日期大于合法工期的。（延期）
