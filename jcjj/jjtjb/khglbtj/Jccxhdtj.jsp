<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String zgsmc=(String)session.getAttribute("zgsmc");

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String sjfw=null;
	String sjfw2=null;
	String dwbh=request.getParameter("dwbh");
	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");
	String fgs=request.getParameter("fgs");
	String wheresql="";
	String khbh=null;

	if (fgs!=null)
	{
			if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
			if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	
	String ddrq=null;
	int sl5=0;
	int allsl=0;
	int sl2=0;
	double allzje=0;
	
	
	Connection conn  = null;
	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	String ls_sql=null;
	ResultSet rs=null;
	String yhmc=null;
	String mmsl=null;
	int allwjsl=0;
	
%>

      <div align="center"><b>完结客户参加促销活动类别统计</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>

<table  width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:12">
<tr bgcolor="#CCCCCC"  align="center">
   
	<td  width="6%">参加活动</td>
	<td  width="6%">订购户数</td>
	<td  width="6%">户均额</td>
	<td  width="6%">总额</td>

</tr>
<%

try {
		conn=cf.getConnection();
		

		ls_sql="select cxhdbm,count(*) from crM_khxx where zt='2' and gcjdbm='5'";
		ls_sql+="  and qyrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+="  and cxhdbm is not  null ";
		ls_sql+=wheresql;
		ls_sql+=" group by cxhdbm";
		//out.print(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{	
			String cxhdbm="";
			
			int sl1=0;
			
			int sl3=0;
			int sl4=0;
			int sl6=0;
			double mmje=0;
			double cgje=0;
			double jjje=0;
			double zcje=0;
			double allje=0;
			
			int temp1=0;
			int temp2=0;
			int temp3=0;
			int temp4=0;
			cxhdbm=rs.getString("cxhdbm");
			//统计木门
			ls_sql=" SELECT distinct(jc_mmydd.khbh),sum(zjhze)";
			ls_sql+=" from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh and jc_mmydd.htrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.cxhdbm='"+cxhdbm+"' and crm_khxx.gcjdbm='5' ";
			ls_sql+=" group by jc_mmydd.khbh ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			while (rs1.next())
			{
				temp1++;
				mmje+=rs1.getDouble(2);

			}
			rs1.close();
			ps1.close();
			//统计橱柜
			ls_sql=" SELECT distinct(jc_cgdd.khbh),sum(zjhze)";
			ls_sql+=" from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.cxhdbm='"+cxhdbm+"' and crm_khxx.gcjdbm='5' ";
			ls_sql+=" group by jc_cgdd.khbh ";
			//ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			while (rs1.next())
			{
				temp2++;
				cgje+=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();
            //统计家具
			ls_sql=" SELECT distinct(jc_jjdd.khbh),sum(jjzjje) ";
			ls_sql+=" from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.cxhdbm='"+cxhdbm+"' and crm_khxx.gcjdbm='5' ";
			ls_sql+=" group by jc_jjdd.khbh ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			while(rs1.next())
			{
				temp3++;
				jjje+=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();
             //统计主材
			ls_sql=" SELECT distinct(jc_zcdd.khbh),sum(hkze+zjhze)  ";
			ls_sql+=" from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.cxhdbm='"+cxhdbm+"' and crm_khxx.gcjdbm='5' ";
			ls_sql+=" group by jc_zcdd.khbh ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			while(rs1.next())
			{
				temp4++;
				zcje+=rs1.getDouble(2);

			}
			rs1.close();
			ps1.close();

			sl6=temp1+temp2+temp3+temp4;
			sl2+=sl6;
			allje=zcje+jjje+cgje+mmje;
			allzje+=allje;
			
%>
		<tr align="center">
		<td  width="15%" ><%=cxhdbm%></td>
		<td  width="10%"><%=sl6%></td>
<%
			if(sl6==0)//订购数量为零的情况
			{
%>
				<td  width="6%">0.0</td>
<%
			}else
			{
%>
				<td  width="6%"><%=cf.formatDouble(allje/sl6)%></td>
<%
			}
%>
		<td align="left" width="20%"><img src="/images/ColuGif.gif" width="<%=allje/100000%>" height=20>&nbsp;(<%=cf.formatDouble(allje)%>)</td>

		
		
<%
	}
	rs.close();
	ps.close();

			
%>
 
		<tr align="center">
		<td  width="4%"><b><font color="blue">综合户均额</b></td>
		<td  width="6%"><%=sl2%></td>
<%
			if(sl2==0)//订购数量为零的情况
			{
%>
				<td  width="12%" ><font color="blue"><b>0.0</b></font></td>

<%
			}
			else
			{
%>
				<td  width="12%" ><font color="blue"><b><%=cf.formatDouble(allzje/sl2)%></b></font></td>

<%
			}
%>
		<td  width="6%">&nbsp;&nbsp;&nbsp;</td>

		</tr>

		
</table>
<br>
    <div align="center"><b>完结客户集成家居产品各类别的户均额</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
	<tr bgcolor="#CCCCCC"  align="center">
  <td  width="7%">类型</td>
  <td  width="7%">数量</td>
 <td  width="11%" >户均额</td>
</tr>
<%
	//获取最大数
	double maxqye=0;
	String getfgs=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;
	String lx=null;
	Hashtable spanColHash=null;
	int qys=0;
	double zqye=0;
	double wdzgce=0;
	long fwmj=0;
	double sjf=0;
	int allqys=0;
	double allzqye=0;
	double allwdzgce=0;
	long allfwmj=0;
	double allsjf=0;
	double zkl=0;
	int pjde=0;
	int pmjj=0;
	int row=0;
	ls_sql="select ROUND(sum(fkje)) from cw_khfkjl,crm_khxx";
	ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh and scbz='N' and fklxbm in ('21','22','23','24')";
	ls_sql+=" and sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxqye=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (maxqye==0)
	{
		return;
	}
	ls_sql="select lx,lstscs, htje from ";
	ls_sql+="( ";
	ls_sql+=" SELECT '木门' as lx,count(*) lstscs,ROUND(sum(jc_mmydd.htje)/count(*)) htje from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh and zt='2' and gcjdbm='5' ";
	ls_sql+=" union all ";
	ls_sql+=" SELECT '橱柜' as lx, count(*) lstscs,ROUND(sum(jc_cgdd.htze)/count(*)) htje from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh and zt='2' and gcjdbm='5' ";
	ls_sql+=" union all ";
	ls_sql+=" SELECT '家具' as lx,count(*) lstscs,ROUND(sum(jc_jjdd.htze)/count(*)) htje from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh and zt='2' and gcjdbm='5' ";
	ls_sql+=" union all ";
	ls_sql+=" SELECT '主材' as lx,count(*) lstscs,ROUND(sum(jc_zcdd.hkze)/count(*)) htje from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh and zt='2' and gcjdbm='5' ";
	ls_sql+=" ) ";
	ls_sql+=" order by lx";
	//out.print(ls_sql);
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//设置每页显示记录数
	//pageObj.alignStr[1]="align='center'";//设置每页显示记录数

//设置显示合并列
	spanColHash=new Hashtable();
	spanColHash.put("lx","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>

</table>

<%	
}

catch (Exception e) {
	out.print("Exception: " + e);
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



<table  width="100%" border="0" cellpadding="1" cellspacing="0" style="FONT-SIZE:16">
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right"><%=zgsmc%>家居管理中心</td><td>&nbsp;&nbsp;</td></tr>
</table></body>
</html>
