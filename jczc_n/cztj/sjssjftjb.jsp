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
String sjs=cf.GB2Uni(request.getParameter("sjs"));

String wheresql="";
String dwbh_c=dwbh;
if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
if (!(sjs.equals("")))	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";


wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
String rzsj="";
String getsjs=null;
String dm=null;
String dmbh=null;
String sjsfgs="";
int qys=0;
double qye=0;
long fwmj=0;
int allqys=0;
double allqye=0;
long allfwmj=0;

int pjde=0;
int pmjj=0;
double sjf=0;
double allsjf=0;
int sjfnum=0;
int allsjfnum=0;
double cwsssjf=0;
double allcwsssjf=0;
int cwsssjfnum=0;
int allcwsssjfnum=0;

double sjsbfb=0;//设计数百分比
double sjebfb=0;//设计额百分比

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


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>设计师设计费统计<BR>
  (时间范围：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="3%" rowspan="2" >排名</td>
  <td  width="5%" rowspan="2" >设计师</td>
  <td  width="6%" rowspan="2" >入职时间</td>
  <td  width="7%" rowspan="2" >分公司</td>
  <td  width="8%" rowspan="2" >店面</td>
  <td colspan="8" >签单录入</td>
  <td colspan="2" bgcolor="#FFFFFF" >财务实收</td>
  </tr>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="5%" >签约数</td>
  <td  width="8%" >签约额</td>
  <td  width="5%" >设计费数</td>
  <td  width="7%" >设计费额</td>
  <td  width="6%" >平均设计费</td>
  <td  width="6%" >平米设计费</td>
  <td  width="6%" >设计/签单(金额)</td>
  <td  width="6%" >设计/签单(数量)</td>
  <td  width="5%" bgcolor="#FFFFFF" >实收设计费数</td>
  <td  width="7%" bgcolor="#FFFFFF" >实收设计费金额</td>
</tr>
<%
	//获取最大数

	ls_sql=" SELECT sjs,fgsmc,dmmc,dwbh,sum(qys) qys,sum(qye) qye,sum(sjf) sjf";
	ls_sql+=" from ";
	ls_sql+=" ( ";
	ls_sql+=" SELECT sjs,a.dwmc fgsmc,b.dwmc dmmc,crm_khxx.dwbh,count(*) qys,sum(qye) qye,sum(NVL(sjf,0)) sjf,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where crm_khxx.fgsbh=a.dwbh and crm_khxx.dwbh=b.dwbh and crm_khxx.zt!='3'";
	ls_sql+=wheresql;
	ls_sql+=" group by sjs,a.dwmc,b.dwmc,crm_khxx.dwbh";

	if (sjs.equals(""))
	{
		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT yhmc sjs,a.dwmc fgsmc,b.dwmc dmmc,sq_yhxx.dwbh,0 qys,0 qye,0 sjf,0 fwmj";
		ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b";
		ls_sql+=" where sq_yhxx.ssfgs=a.dwbh and sq_yhxx.dwbh=b.dwbh and zwbm='04' and sfzszg in('Y','N')";
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

	ls_sql+=" group by sjs,fgsmc,dmmc,dwbh";
	ls_sql+=" order by sjf desc,qye desc";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getsjs=rs.getString("sjs");
		sjsfgs=rs.getString("fgsmc");
		dm=rs.getString("dmmc");
		dmbh=rs.getString("dwbh");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		sjf=rs.getDouble("sjf");

//入职时间
		rzsj=null;
		ls_sql="SELECT TO_CHAR(sq_yhxx.rzsj,'YYYY-MM-DD') rzsj";
		ls_sql+=" FROM sq_yhxx ";
		ls_sql+=" where yhmc='"+getsjs+"' and dwbh='"+dmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rzsj=rs1.getString("rzsj");
		}
		rs1.close();
		ps1.close();


		//收设计费数
		ls_sql="SELECT count(khbh),sum(fwmj) fwmj ";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where sjf!='0' and dwbh='"+dmbh+"' and sjs='"+getsjs+"' and zt!='3'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjfnum=rs1.getInt(1);
			fwmj=rs1.getLong("fwmj");
		}
		rs1.close();
		ps1.close();

		//财务实收设计费
		ls_sql=" SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.dwbh='"+dmbh+"' and crm_khxx.sjs='"+getsjs+"'";
		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cwsssjfnum=rs1.getInt(1);
			cwsssjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	
//		out.print(ls_sql);


		if (rzsj==null)
		{
			rzsj="未录入";
		}

		if (sjfnum==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(sjf/sjfnum);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(sjf/fwmj);
		}

		allqys+=qys;
		allqye+=qye;
		allfwmj+=fwmj;
		allsjf+=sjf;
		allsjfnum+=sjfnum;
		allcwsssjf+=cwsssjf;
		allcwsssjfnum+=cwsssjfnum;
		row++;

		sjsbfb=sjfnum*100.0/qys;
		sjebfb=sjf*100.0/qye;

		if (bgcolor.equals("#FFFFFF"))
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr align="center" bgcolor="<%=bgcolor%>">
			<td ><%=row%></td>
			<td ><A HREF="ViewSjssjf.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>" target="_blank"><%=getsjs%></A></td>
			<td ><%=rzsj%></td>
			<td ><%=sjsfgs%></td>
			<td ><%=dm%></td>
			<td ><%=qys%></td>
			<td ><%=cf.formatDouble((int)qye)%></td>
			<td ><%=sjfnum%>
			<td ><%=cf.formatDouble((int)sjf)%></td>
			<td ><%=cf.formatDouble((int)pjde)%></td>
			<td ><%=cf.formatDouble((int)pmjj)%></td>
			<td ><%=cf.formatDouble(sjebfb)%>%</td>
			<td ><%=cf.formatDouble(sjsbfb)%>%</td>
			<!-- <td ><%=cwsssjfnum%></td> -->
			 <td ><a href="ly-ViewSjssjf.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>" target="_blank"><%=cwsssjfnum%></a></td> 
			<td ><%=cf.formatDouble((int)cwsssjf)%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();



	if (allsjfnum==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(allsjf/allsjfnum);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allsjf/allfwmj);
	}

%>
<tr align="center">
	<td colspan="4" >合计	</td>
	<td>&nbsp;</td>
	<td ><%=allqys%></td>
	<td ><%=cf.formatDouble((long)allqye)%></td>
	<td ><%=allsjfnum%>
	<td ><%=cf.formatDouble((long)allsjf)%></td>
	<td ><%=cf.formatDouble((long)pjde)%></td>
	<td ><%=cf.formatDouble((long)pmjj)%></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td ><%=allcwsssjfnum%>
	<td ><%=cf.formatDouble((long)allcwsssjf)%></td>
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


