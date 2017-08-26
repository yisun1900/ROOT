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

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String px=request.getParameter("px");
String jzbz="1";
String sjs=cf.GB2Uni(request.getParameter("sjs"));

String wheresql="";

if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
if (!(sjs.equals("")))	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";

if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
String getsjs=null;
String olddm="";
String dm=null;
String dmbh=null;
String sjsfgs="";
int qys=0;
double zqye=0;
double sjf=0;
int allqys=0;
double allzqye=0;
double allsjf=0;

double zcsxe=0;//主材实销额
double allzcsxe=0;//主材实销总额
double jzk=0;//家装款
double alljzk=0;//家装款总额
double jzkyf=0;//家装款预付款
double alljzkyf=0;//家装款预付款总额


int sjfnum=0;
int allsjfnum=0;

int row=0;

String bgcolor="#FFFFFF";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xtrzip=request.getRemoteHost();
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String xtrzyhmc=(String)session.getAttribute("yhmc");
	ls_sql="insert into sq_xtrz ( xh,ip,yhdlm,dlsj,bz ) ";
	ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_xtrz),?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xtrzip);
	ps.setString(2,xtrzyhdlm);
	ps.setString(3,xtrzyhmc+"：设计师业绩统计："+sjfw+"："+sjfw2+"："+fgs+"："+dwbh+"：");
	ps.executeUpdate();
	ps.close();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>设计师家装产值统计<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center" >
  <td  width="7%">分公司</td>
  <td  width="7%">店面</td>
  <td  width="5%">设计师</td>
  <td  width="5%">家装产值</td>
  <td  width="9%">主材实收款</td>
  <td  width="7%">设计费</td>
</tr>
<%
	//获取最大数
	double maxqye=0;

		ls_sql="SELECT TRUNC(max(sum(qye)))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(sjf) sjf ";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(sjf) sjf ";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 sjf";
			ls_sql+=" FROM sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
			}
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by zqye desc";

//		out.println(ls_sql);

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			sjf=rs.getDouble("sjf");

//所属分公司
			ls_sql="";
			ls_sql+=" SELECT b.dwmc fgs ";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
			ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N' and a.dwbh='"+dmbh+"' ";
			ls_sql+=" group by b.dwmc ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjsfgs=rs1.getString("fgs");
			}
			rs1.close();
			ps1.close();
//收设计费数
			ls_sql="SELECT count(*) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where sjf is not null and sjf!='0' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjfnum=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allsjfnum+=sjfnum;

//主材实收款
			ls_sql="SELECT sum(cw_khfkjl.fkje) fkje ";
			ls_sql+=" FROM crm_khxx,cw_khfkjl";
			ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and cw_khfkjl.sjs='"+getsjs+"'";
			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and cw_khfkjl.fklxbm='23' and crm_khxx.zt='2'  ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcsxe=rs1.getDouble(1);//主材实销金额
			}
			rs1.close();
			ps1.close();		
			allzcsxe+=zcsxe;

//家装款
			ls_sql="SELECT sum(cw_khfkjl.fkje) fkje ";
			ls_sql+=" FROM crm_khxx,cw_khfkjl";
			ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and cw_khfkjl.sjs='"+getsjs+"'";
			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and cw_khfkjl.fklxbm='11' and crm_khxx.zt='2' ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				jzk=rs1.getDouble(1);//家装款
			}
			rs1.close();
			ps1.close();		
			alljzk+=jzk;

//家装款预付款
			ls_sql="SELECT sum(cw_khfkjl.fkje) fkje ";
			ls_sql+=" FROM crm_khxx,cw_khfkjl";
			ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and cw_khfkjl.sjs='"+getsjs+"'";
			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and cw_khfkjl.fklxbm='61' and crm_khxx.zt='2' ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				jzkyf=rs1.getDouble(1);//家装款预付款
			}
			rs1.close();
			ps1.close();		
			alljzk+=jzkyf;
			jzk+=jzkyf;

			allqys+=qys;
			allzqye+=zqye;
			allsjf+=sjf;
			row++;

			if (dm.equals(olddm))
			{
			}
			else{
				olddm=dm;
				if (bgcolor.equals("#FFFFFF"))
				{
					bgcolor="#E8E8FF";
				}
				else{
					bgcolor="#FFFFFF";
				}
			}
			%>
			<tr align="center" bgcolor="<%=bgcolor%>">
				<td><%=sjsfgs%></td>
				<td><%=dm%></td>
				<td><%=getsjs%></td>
				<td><%=cf.formatDouble((int)jzk)%></td>
				<td><%=cf.formatDouble((int)zcsxe)%></td>
				<td><%=cf.formatDouble((int)sjf)%></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();


%>
<tr align="center">
	<td	><font color="#FF0000">总计</font></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble((long)alljzk)%></td>
	<td><%=cf.formatDouble((long)allzcsxe)%></td>
	<td><%=cf.formatDouble((long)allsjf)%></td>
</tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs!= null) rs1.close(); 
		if (ps!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
