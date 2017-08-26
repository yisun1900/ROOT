<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	cf.ckxxrz(request,session,"17030303",1);
%>



<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>店面主材统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="3%" >序号</td>
  <td  width="13%" >店面</td>
  <td  width="11%" >材料销售额</td>
  <td  width="11%" >远程费</td>
  <td  width="11%" >安装加工费</td>
  <td  width="11%" >成本额</td>
  <td  width="11%" >毛利</td>
  <td  width="11%" >实际收款</td>
  </tr>
<%
	//获取最大数
	double zjsskje=0;
	double zjclf=0;
	double zjycf=0;
	double zjjgf=0;
	double zjcbje=0;

	int row=0;


	
	String getfgsbh=null;
	String fgsmc=null;
	String getdwbh=null;
	String dmmc=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";


	ls_sql =" SELECT dwbh,dwmc ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where sq_dwxx.dwlx='F0'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	ls_sql+=" order by sq_dwxx.dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		getfgsbh=rs2.getString("dwbh");
		fgsmc=rs2.getString("dwmc");
	

		double xjsskje=0;
		double xjclf=0;
		double xjycf=0;
		double xjjgf=0;
		double xjcbje=0;

		
		ls_sql =" SELECT dwbh,dwmc,kdsj,gdsj,cxbz ";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where sq_dwxx.dwlx='F2'";
		ls_sql+=" and sq_dwxx.ssfgs='"+getfgsbh+"'";

		if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

		if (!(dwbh.equals("")))
		{
			ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
		}
		ls_sql+=" and sq_dwxx.cxbz='N'";
		ls_sql+=" order by sq_dwxx.dwbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getdwbh=rs.getString("dwbh");
			dmmc=rs.getString("dwmc");
			cxbz=rs.getString("cxbz");
			kdsj=cf.fillNull(rs.getDate("kdsj"));
			gdsj=cf.fillNull(rs.getDate("gdsj"));


			//实收款
			double sskje=0;
			ls_sql =" SELECT sum(cw_khfkjl.fkje)";
			ls_sql+=" FROM cw_khfkjl,crm_khxx";
			ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh";
			ls_sql+=" and crm_khxx.zt='2'";
			ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";

			ls_sql+=" and cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材

			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sskje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();


			//签单
			double clf=0;
			double ycf=0;
			double jgf=0;
			double cbje=0;
			ls_sql =" SELECT sum(bj_khzcmx.je),sum(bj_khzcmx.ycf),sum(bj_khzcmx.qtfyje),sum(bj_khzcmx.cbj*bj_khzcmx.sl)";
			ls_sql+=" FROM bj_khzcmx,crm_khxx";
			ls_sql+=" where crm_khxx.khbh=bj_khzcmx.khbh";
			ls_sql+=" and crm_khxx.zt='2'";
			ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				clf=rs1.getDouble(1);
				ycf=rs1.getDouble(2);
				jgf=rs1.getDouble(3);
				cbje=rs1.getDouble(4);
			}
			rs1.close();
			ps1.close();

			double mll=0;
			if (clf!=0)
			{
				mll=cf.round((clf-cbje)*100/clf,2);
			}

			//最新
			double clfnew=0;
			double ycfnew=0;
			double jgfnew=0;
			double cbjenew=0;
			ls_sql =" SELECT sum(bj_khzcmxnew.je),sum(bj_khzcmxnew.ycf),sum(bj_khzcmxnew.qtfyje),sum(bj_khzcmxnew.cbj*bj_khzcmxnew.sl)";
			ls_sql+=" FROM bj_khzcmxnew,crm_khxx";
			ls_sql+=" where crm_khxx.khbh=bj_khzcmxnew.khbh";
			ls_sql+=" and crm_khxx.zt='2'";
			ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				clfnew=rs1.getDouble(1);
				ycfnew=rs1.getDouble(2);
				jgfnew=rs1.getDouble(3);
				cbjenew=rs1.getDouble(4);
			}
			rs1.close();
			ps1.close();

			xjsskje+=sskje;
			xjclf+=clf;
			xjycf+=ycf;
			xjjgf+=jgf;
			xjcbje+=cbje;

			zjsskje+=sskje;
			zjclf+=clf;
			zjycf+=ycf;
			zjjgf+=jgf;
			zjcbje+=cbje;


			row++;

			%>
			<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td ><%=row%></td>
				<td ><%=dmmc%></td>

				<td><%=clf%></td>
				<td><%=ycf%></td>
				<td><%=jgf%></td>
				<td><%=cbje%></td>
				<td><%=mll%>%</td>
				<td><%=sskje%></td>

			</tr>
			<%	
		}
		rs.close();
		ps.close();


		double mll=0;
		if (xjclf!=0)
		{
			mll=cf.round((xjclf-xjcbje)*100/xjclf,2);
		}

		%>
		<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td colspan="2"><strong><font color="#ff0000">[<%=fgsmc%>]小计</strong></td>
			<td><%=cf.formatDouble(xjclf)%></td>
			<td><%=cf.formatDouble(xjycf)%></td>
			<td><%=cf.formatDouble(xjjgf)%></td>
			<td><%=cf.formatDouble(xjcbje)%></td>
				<td><%=mll%>%</td>
			<td><%=cf.formatDouble(xjsskje)%></td>
		  </tr>
		<%
	}
	rs2.close();
	ps2.close();

	double mll=0;
	if (zjclf!=0)
	{
		mll=cf.round((zjclf-zjcbje)*100/zjclf,2);
	}

%>

<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="2"><strong><font color="#ff0000">总计</strong></td>
	
	<td><%=cf.formatDouble(zjclf)%></td>
	<td><%=cf.formatDouble(zjycf)%></td>
	<td><%=cf.formatDouble(zjjgf)%></td>
	<td><%=cf.formatDouble(zjcbje)%></td>
				<td><%=mll%>%</td>
	<td><%=cf.formatDouble(zjsskje)%></td>
  </tr>
</table>


</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 