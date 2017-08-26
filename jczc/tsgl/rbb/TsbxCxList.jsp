<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String wheresql="";
String sjfw=null;
String sjfw2=null;



String fgs=request.getParameter("fgs");
if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_tsjl.ssfgs='"+fgs+"')";
}

String dwbh=request.getParameter("dwbh");
if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_tsjl.slbm='"+dwbh+"'";
}



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;

String yzcdbm=null;
String yzcdmc=null;
String tsjlh=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String sjs=null;
String qydm=null;
String zjy=null;
String sgd=null;
String tslxmc=null;
String tsxlmc=null;
String tsyymc=null;
String slfsmc=null;
String slsj=null;
String slr=null;
String jazt=null;
String zrbm=null;
String slbm=null;
String tsnr=null;
String bz=null;

String clqk=null;
String lrsj=null;
String lrr=null;

String yhmc=null;
String hfr=null;
String hfsj=null;
String hfjgmc=null;
String khhfqk=null;
String cxxwt=null;

int lstscs=0;
int lssmcs=0;
int wjacs=0;

String bgcolor=null;

int count=0;

int row=0;

try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE17 {font-family: "楷体_GB2312"; font-weight: bold; font-size: 14px; color: #990000; }
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>未结案投诉报表</B>
</CENTER>
<%

//投诉严重程度编码，01：轻微违章；02：严重违章；03：特别严重
ls_sql=" SELECT khbh,count(*) wjacs";
ls_sql+=" from crm_tsjl";
ls_sql+=" where lx='1' and clzt in('1','2')";//1：投诉；2：报修
ls_sql+=" and  crm_tsjl.clzt in('0','1','2')";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
ls_sql+=wheresql;
ls_sql+=" group by khbh";
ls_sql+=" order by wjacs desc";
//out.println(ls_sql);
ps2= conn.prepareStatement(ls_sql);
rs2 =ps2.executeQuery();
while (rs2.next())
{
	khbh=rs2.getString("khbh");
	wjacs=rs2.getInt("wjacs");//目前未结案

	ls_sql="SELECT khbh,crm_khxx.khxm||'('||crm_khxx.lxfs||')' khxm";
	ls_sql+=" ,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm,dwmc,sgdmc sgd";
	ls_sql+=" FROM crm_khxx,sq_dwxx ,sq_sgd  ";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		zjy=cf.fillNull(rs.getString("zjxm"));
		qydm=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
	}
	rs.close();
	ps.close();


	//累计投诉报修
	ls_sql=" SELECT count(*) lstscs";
	ls_sql+=" from crm_tsjl";
	ls_sql+=" where crm_tsjl.khbh='"+khbh+"'";
	ls_sql+=" and lx='1' and clzt!='9'";//1：投诉；2：报修
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		lstscs=rs1.getInt("lstscs");
	}
	rs1.close();
	ps1.close();
		
	//其中来访
	ls_sql=" SELECT count(*) lssmcs";
	ls_sql+=" from crm_tsjl";
	ls_sql+=" where crm_tsjl.khbh='"+khbh+"' and slfsbm='3'";//3:来访
	ls_sql+=" and lx='1' and clzt!='9'";//1：投诉；2：报修
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		lssmcs=rs1.getInt("lssmcs");
	}
	rs1.close();
	ps1.close();
		
		
	row++;

	if (row%2==0)
	{
		bgcolor="#E8E8FF";
	}
	else{
		bgcolor="#FFFFFF";
	}
	%> 
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:12" bgcolor="<%=bgcolor%>">
  <tr> 
    <td align="center" rowspan="<%=(2+wjacs)%>" width="3%"><%=row%></td>
    <td colspan="4" height="50"> 
      <table width="100%" border="0" cellpadding="1" cellspacing="0" style="FONT-SIZE:12" bgcolor="<%=bgcolor%>">
        <tr height="16"> 
          <td colspan="3" ><span class="STYLE17">累计投诉：<%=lstscs%>次（其中来访：<%=lssmcs%>次）
		  &nbsp;&nbsp;&nbsp;&nbsp;目前未结案：<%=wjacs%>次&nbsp;&nbsp;&nbsp;&nbsp;已结案：<%=(lstscs-wjacs)%>次</span></td>
        </tr>
        <tr height="16"> 
          <td width="32%" >客户姓名：<%=khxm%></td>
          <td colspan="2" >地址：<%=fwdz%></td>
        </tr>
        <tr height="16"> 
          <td width="32%">设计师：<%=sjs%>（<%=qydm%>）</td>
          <td width="31%">施工队：<%=sgd%></td>
          <td width="37%">质检员：<%=zjy%></td>
        </tr>
      </table>    </td>
  </tr>
  <%
	int row1=0;
	ls_sql="SELECT tsjlh,slr,slsj,slfsmc,yzcdmc,tsnr,bz";
	ls_sql+=" FROM crm_tsjl,dm_slfsbm,dm_yzcdbm ";
	ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) ";
	ls_sql+=" and crm_tsjl.khbh='"+khbh+"' ";
	ls_sql+=" and lx='1' ";//1：投诉；2：报修
	ls_sql+=" and crm_tsjl.clzt in('0','1','2')";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
	ls_sql+=wheresql;
	ls_sql+=" order by tsjlh desc";
//	out.println(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		tsjlh=cf.fillHtml(rs1.getString("tsjlh"));
		slr=cf.fillHtml(rs1.getString("slr"));
		slsj=cf.fillHtml(rs1.getDate("slsj"));
		slfsmc=cf.fillHtml(rs1.getString("slfsmc"));
		yzcdmc=cf.fillHtml(rs1.getString("yzcdmc"));
		tsnr=cf.fillHtml(rs1.getString("tsnr"));
		bz=cf.fillHtml(rs1.getString("bz"));
		if (!bz.equals("&nbsp;"))
		{
			bz="<B>备注：</B><U>"+bz+"</U>";
		}

		row1++;
%>
  <tr>
    <td width="3%" align="center"><%=row1%></td>
    <td width="36%" valign="top" bgcolor="#FFFFCC"><b><%=tsjlh%>：<%=slr%>受理<%=slfsmc%>投诉（<%=slsj%>）（<%=yzcdmc%>）</b>： <br>
      &nbsp;&nbsp;&nbsp;&nbsp;<U><%=tsnr%></U> 
	  <br><br><%=bz%> </td>
    <td width="1%">&nbsp;</td>
    <td width="60%" valign="top" bgcolor="#FFFFCC">

<%			
		String 	tspp=null;	
		String 	clzt=null;	
		ls_sql=" SELECT crm_tsbm.tspp,dwmc,tsyymc,tsxlmc,hfjgmc,DECODE(crm_tsbm.clzt,'0','未通知','1','已通知未处理','2','在处理','3','已解决') clzt,clqk,lrsj,lrr  ";
		ls_sql+=" FROM crm_tsbm,sq_dwxx,dm_hfjgbm,dm_tsxlbm,dm_tsyybm";
		ls_sql+=" where crm_tsbm.tsjlh='"+tsjlh+"' and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+)";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+)";
		ls_sql+=" order by crm_tsbm.dwbh";
		ps3= conn.prepareStatement(ls_sql);
		rs3 =ps3.executeQuery(ls_sql);
		while (rs3.next())
		{
			tspp=rs3.getString("tspp");
			zrbm=rs3.getString("dwmc");
			hfjgmc=rs3.getString("hfjgmc");
			tsyymc=cf.fillHtml(rs3.getString("tsyymc"));
			tsxlmc=cf.fillHtml(rs3.getString("tsxlmc"));
			clzt=cf.fillHtml(rs3.getString("clzt"));
			clqk=rs3.getString("clqk");
			lrsj=cf.fillHtml(rs3.getDate("lrsj"));
			lrr=cf.fillHtml(rs3.getString("lrr"));

			if (clqk==null)
			{
				clqk="<B><font color=\"#CC0066\">责任部门未处理</font></B>";
			}
			else{
				clqk=lrr+"（"+lrsj+"）：<U>"+clqk+"</U>";
			}

			if (hfjgmc==null)
			{
				hfjgmc="未回访";
			}

			if (tspp!=null)
			{
				tspp="&nbsp;&nbsp;&nbsp;&nbsp;<B>涉及厂商</B>："+tspp;
			}
			else{
				tspp="";
			}
			%>
      <b>原因</b>：<%=tsyymc%>（<%=tsxlmc%>）
      <br><b>部门</b>：<U><font color=\"#0000CC\"><%=zrbm%></font></U>   <%=tspp%>
	  <br><b>进程</b>：<%=clzt%></b>（客服回访：<%=hfjgmc%>） 
      <br><b>处理</b>：<%=clqk%>
      <hr>
    <%
		}
		rs3.close();
		ps3.close();
		%></td>
  </tr>
  
<%
	}
	rs1.close();
	ps1.close();
%> 
  <tr> 
    <td colspan="4"> <%			
		int mark=0;
		ls_sql=" SELECT hfr,hfsj,khhfqk,cxxwt  ";
		ls_sql+=" FROM crm_tshfjl";
		ls_sql+=" where crm_tshfjl.khbh='"+khbh+"' and hfjlh in(select hfjlh from crm_tsjlhfmx where tsjlh='"+tsjlh+"')";
		ls_sql+=" order by hfsj desc";
		ps3= conn.prepareStatement(ls_sql);
		rs3 =ps3.executeQuery(ls_sql);
		while (rs3.next())
		{
			mark++;
			hfr=rs3.getString("hfr");
			hfsj=cf.fillHtml(rs3.getDate("hfsj"));
			khhfqk=cf.fillHtml(rs3.getString("khhfqk"));
			cxxwt=cf.fillHtml(rs3.getString("cxxwt"));
			if (!cxxwt.equals("&nbsp;"))
			{
				cxxwt="<BR><B>回访中出现的新问题：</B><U>"+cxxwt+"</U>";
			}
			%> <B><%=hfsj%><%=hfr%>回访：</B><U><%=khhfqk%></U> 
			<%=cxxwt%><HR>
      <%
		}
		rs3.close();
		ps3.close();
		if (mark==0)
		{
			out.println("未做回访");
		}
		%> </td>
  </tr>
  <%	
%> 
</table>
<%
	}
	rs2.close();
	ps2.close();

%>







<CENTER >
  <B>未结案报修报表</B>
</CENTER>

<%

//投诉严重程度编码，01：轻微违章；02：严重违章；03：特别严重
ls_sql=" SELECT khbh,count(*) wjacs";
ls_sql+=" from crm_tsjl";
ls_sql+=" where lx='2' and clzt in('0','1','2')";//1：投诉；2：报修
ls_sql+=wheresql;
ls_sql+=" group by khbh";
ls_sql+=" order by wjacs desc";
//out.println(ls_sql);
ps2= conn.prepareStatement(ls_sql);
rs2 =ps2.executeQuery(ls_sql);
while (rs2.next())
{
	khbh=rs2.getString("khbh");
	wjacs=rs2.getInt("wjacs");//目前未结案

	ls_sql="SELECT khbh,crm_khxx.khxm||'('||crm_khxx.lxfs||')' khxm";
	ls_sql+=" ,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm,dwmc,sgdmc sgd";
	ls_sql+=" FROM crm_khxx,sq_dwxx ,sq_sgd  ";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		zjy=cf.fillNull(rs.getString("zjxm"));
		qydm=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
	}
	rs.close();
	ps.close();

	//累计报修
	ls_sql=" SELECT count(*) lstscs";
	ls_sql+=" from crm_tsjl";
	ls_sql+=" where crm_tsjl.khbh='"+khbh+"'";
	ls_sql+=" and lx='2' and clzt!='9'";//1：投诉；2：报修
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		lstscs=rs1.getInt("lstscs");
	}
	rs1.close();
	ps1.close();
		
	//来访
	ls_sql=" SELECT count(*) lssmcs";
	ls_sql+=" from crm_tsjl";
	ls_sql+=" where crm_tsjl.khbh='"+khbh+"' and slfsbm='3'";
	ls_sql+=" and lx='2' and clzt!='9'";//1：投诉；2：报修
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		lssmcs=rs1.getInt("lssmcs");
	}
	rs1.close();
	ps1.close();
		
		
	row++;

	if (row%2==0)
	{
		bgcolor="#E8E8FF";
	}
	else{
		bgcolor="#FFFFFF";
	}
	%> 
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:12" bgcolor="<%=bgcolor%>">
  <tr> 
    <td align="center" rowspan="<%=(2+wjacs)%>" width="3%"><%=row%></td>
    <td colspan="6" height="50"> 
      <table width="100%" border="0" cellpadding="1" cellspacing="0" style="FONT-SIZE:12" bgcolor="<%=bgcolor%>">
        <tr height="16"> 
          <td colspan="3" ><span class="STYLE17">累计报修：<%=lstscs%>次（其中来访：<%=lssmcs%>次）
		  &nbsp;&nbsp;&nbsp;&nbsp;目前未结案：<%=wjacs%>次&nbsp;&nbsp;&nbsp;&nbsp;已结案：<%=(lstscs-wjacs)%>次</span></td>
        </tr>
        <tr height="16"> 
          <td width="32%" >客户姓名：<%=khxm%></td>
          <td colspan="2" >地址：<%=fwdz%></td>
        </tr>
        <tr height="16"> 
          <td width="32%">设计师：<%=sjs%>（<%=qydm%>）</td>
          <td width="31%">施工队：<%=sgd%></td>
          <td width="37%">质检员：<%=zjy%></td>
        </tr>
      </table>    </td>
  </tr>
  <%
	int row1=0;
	ls_sql="SELECT tsjlh,slr,slsj,slfsmc,yzcdmc,tsnr,bz";
	ls_sql+=" FROM crm_tsjl,dm_slfsbm,dm_yzcdbm ";
	ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) ";
	ls_sql+=" and crm_tsjl.khbh='"+khbh+"' ";
	ls_sql+=" and lx='2' and clzt in('1','2','0')";//1：投诉；2：报修
	ls_sql+=wheresql;
	ls_sql+=" order by tsjlh desc";
//	out.println(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		tsjlh=cf.fillHtml(rs1.getString("tsjlh"));
		slr=cf.fillHtml(rs1.getString("slr"));
		slsj=cf.fillHtml(rs1.getDate("slsj"));
		slfsmc=cf.fillHtml(rs1.getString("slfsmc"));
		yzcdmc=cf.fillHtml(rs1.getString("yzcdmc"));
		tsnr=cf.fillHtml(rs1.getString("tsnr"));
		bz=cf.fillHtml(rs1.getString("bz"));
		if (!bz.equals("&nbsp;"))
		{
			bz="<B>备注：</B><U>"+bz+"</U>";
		}

		row1++;
%>
  <tr>
    <td width="3%" align="center"><%=row1%></td>
    <td width="36%" bgcolor="#FFFFCC" valign="top"><b><%=slr%>受理<%=slfsmc%>报修（<%=slsj%>）</b>：
	<BR>&nbsp;&nbsp;&nbsp;&nbsp;<U><%=tsnr%></U>
	<br><br><%=bz%> </td>
    <td width="1%">&nbsp;</td>
    <td width="60%" bgcolor="#FFFFCC" valign="top">
<%			
		String tspp=null;		
		String 	clzt=null;	
		ls_sql=" SELECT crm_tsbm.tspp,dwmc,tsyymc,tsxlmc,hfjgmc,DECODE(crm_tsbm.clzt,'0','未通知','1','已通知未处理','2','在处理','3','已解决') clzt,clqk,lrsj,lrr  ";
		ls_sql+=" FROM crm_tsbm,sq_dwxx,dm_hfjgbm,dm_tsxlbm,dm_tsyybm";
		ls_sql+=" where crm_tsbm.tsjlh='"+tsjlh+"' and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+)";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+)";
		ls_sql+=" order by crm_tsbm.dwbh";
		ps3= conn.prepareStatement(ls_sql);
		rs3 =ps3.executeQuery(ls_sql);
		while (rs3.next())
		{
			tspp=rs3.getString("tspp");
			zrbm=rs3.getString("dwmc");
			hfjgmc=rs3.getString("hfjgmc");
			tsyymc=cf.fillHtml(rs3.getString("tsyymc"));
			tsxlmc=cf.fillHtml(rs3.getString("tsxlmc"));
			clzt=cf.fillHtml(rs3.getString("clzt"));
			clqk=rs3.getString("clqk");
			lrsj=cf.fillHtml(rs3.getDate("lrsj"));
			lrr=cf.fillHtml(rs3.getString("lrr"));

			if (clqk==null)
			{
				clqk="<B><font color=\"#CC0066\">责任部门未处理</font></B>";
			}
			else{
				clqk=""+lrr+"（"+lrsj+"）：<U>"+clqk+"</U>";
			}

			if (hfjgmc==null)
			{
				hfjgmc="未回访";
			}

			if (tspp!=null)
			{
				tspp="&nbsp;&nbsp;&nbsp;&nbsp;<B>涉及厂商</B>："+tspp;
			}
			else{
				tspp="";
			}

			%>
		  <b>原因</b>：<%=tsyymc%>（<%=tsxlmc%>）
		  <br><b>部门</b>：<U><font color=\"#0000CC\"><%=zrbm%></font></U>   <%=tspp%>
			<br><b>进程</b>：<%=clzt%>（客服回访结果：<%=hfjgmc%>） 
			<br><b>处理</b>：<%=clqk%>
			<HR>
			  <%
		}
		rs3.close();
		ps3.close();
		%>
</td>
  </tr>
<%
	}
	rs1.close();
	ps1.close();
%> 
  <tr> 
    <td colspan="4"> <%	
		int mark=0;
		ls_sql=" SELECT hfr,hfsj,khhfqk,cxxwt  ";
		ls_sql+=" FROM crm_tshfjl";
		ls_sql+=" where crm_tshfjl.khbh='"+khbh+"' and hfjlh in(select hfjlh from crm_tsjlhfmx where tsjlh='"+tsjlh+"')";
		ls_sql+=" order by hfsj desc";
		ps3= conn.prepareStatement(ls_sql);
		rs3 =ps3.executeQuery(ls_sql);
		while (rs3.next())
		{
			mark++;
			hfr=rs3.getString("hfr");
			hfsj=cf.fillHtml(rs3.getDate("hfsj"));
			khhfqk=cf.fillHtml(rs3.getString("khhfqk"));
			cxxwt=cf.fillHtml(rs3.getString("cxxwt"));
			if (!cxxwt.equals("&nbsp;"))
			{
				cxxwt="<BR><B>回访中出现的新问题：</B><U>"+cxxwt+"</U>";
			}
			%> 
			<B><%=hfsj%><%=hfr%>回访：</B><U><%=khhfqk%></U> 
			<%=cxxwt%><HR>
			<%
		}
		rs3.close();
		ps3.close();
		if (mark==0)
		{
			out.println("未做回访");
		}
		%> </td>
  </tr>
  <%	
%> 
</table>
<%

	}
	rs2.close();
	ps2.close();


}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (rs3!= null) rs3.close(); 
		if (ps3!= null) ps3.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</body>
</html>