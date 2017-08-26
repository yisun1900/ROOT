<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwbh=null;
String dwmc=null;
String dwjc=null;
String ssdw=null;
String dwlx=null;
String dwdz=null;
String dwfzr=null;
String dwdh=null;
String dwcz=null;
String email=null;
String dqbm=null;
String bz=null;
String wheredwbh=null;
wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select dwbh,dwmc,dwjc,ssdw,dwlx,dwdz,dwfzr,dwdh,dwcz,email,bz,dqbm ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where (1=1) and  (dwbh='"+wheredwbh+"')  ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dwjc=cf.fillNull(rs.getString("dwjc"));
		ssdw=cf.fillNull(rs.getString("ssdw"));
		dwlx=cf.fillNull(rs.getString("dwlx"));
		dwdz=cf.fillNull(rs.getString("dwdz"));
		dwfzr=cf.fillNull(rs.getString("dwfzr"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dwcz=cf.fillNull(rs.getString("dwcz"));
		email=cf.fillNull(rs.getString("email"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();



		int count=0;

		int curNian=0;
		int curYue=0;
		int curRi=0;
		int curHH=0;

		
		//获取规定结转日期
		String jzyf=null;//结转月份:1：结转本月；2：结转上月
		int gdjzrq=0;//结转日期
		int drjs=0;//当日几时

		String jzrqstr=null;
		ls_sql="select jzyf,gdjzrq,drjs,TO_CHAR(SYSDATE,'YYYY') nian,TO_CHAR(SYSDATE,'MM') yue,TO_CHAR(SYSDATE,'DD') ri,TO_CHAR(SYSDATE,'HH24') hh";
		ls_sql+="  from sq_dwxx";  
		ls_sql+="  where dwlx='A0' ";  
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();
		if (rs.next())
		{
			jzyf=cf.fillNull(rs.getString("jzyf"));//结转月份 
			gdjzrq=rs.getInt("gdjzrq");//结转日期 
			drjs=rs.getInt("drjs");//当日几时 

			curNian=rs.getInt("nian");//当前年 
			curYue=rs.getInt("yue");//当前月份 
			curRi=rs.getInt("ri");//当前日期 
			curHH=rs.getInt("hh");//当前小时 
		} 
		rs.close();
		ps.close();

		if (jzyf.equals("1"))//1：结转本月；2：结转上月
		{
			if (curRi>gdjzrq)
			{
			}
			else if (curRi==gdjzrq)
			{
				if (curHH>=drjs)
				{
				}
				else{
					curYue=curYue-1;
				}
			}
			else if (curRi<gdjzrq)
			{
				curYue=curYue-1;
			}
		}
		else if (jzyf.equals("2"))//1：结转本月；2：结转上月
		{
			if (curYue==1)
			{
				curNian=curNian-1;
			}

			if (curRi>gdjzrq)
			{
				curYue=curYue-1;
			}
			else if (curRi==gdjzrq)
			{
				if (curHH>=drjs)
				{
					curYue=curYue-1;
				}
				else{
					curYue=curYue-2;
				}
			}
			else if (curRi<gdjzrq)
			{
				curYue=curYue-2;
			}
		}
		else{
			throw new Exception("单位信息表中『结转月份』设置不正确");
		}

		jzrqstr=cf.lastDay(curNian,curYue); 


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

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">查看信息 </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">单位编号</div>
    </td>
    <td width="35%"> <%=dwbh%> </td>
    <td width="15%"> 
      <div align="right">单位类型</div>
    </td>
    <td width="35%"><%
	cf.selectToken(out,"A0+总部&A1+总部各部门&F0+分公司&F1+分公司各部门&F2+店面&J0+加盟商",dwlx,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">单位名称</td>
    <td width="35%"><%=dwmc%></td>
    <td width="15%" align="right">单位简称</td>
    <td width="35%"><%=dwjc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">上级单位</div>
    </td>
    <td width="35%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssdw+"'",ssdw,true);
%> </td>
    <td width="15%"> 
      <div align="right">所属地区</div>
    </td>
    <td width="35%"><%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">单位地址</td>
    <td colspan="3"><%=dwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">单位负责人</div>
    </td>
    <td width="35%"> <%=dwfzr%> </td>
    <td width="15%"> 
      <div align="right">单位电话</div>
    </td>
    <td width="35%"> <%=dwdh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">单位传真</div>
    </td>
    <td width="35%"> <%=dwcz%> </td>
    <td width="15%"> 
      <div align="right">单位EMail</div>
    </td>
    <td width="35%"> <%=email%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">备注</div>
    </td>
    <td colspan="3"> <%=bz%> </td>
  </tr>
</table>
</body>
</html>
