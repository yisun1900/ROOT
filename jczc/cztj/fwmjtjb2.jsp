<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='090414'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[房屋面积分析]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[房屋面积分析]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>

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
String jzbz=request.getParameter("jzbz");
String tjsj=request.getParameter("tjsj");

String wheresql="";
String wheresql1="";


if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (ssfgs='"+fgs+"')";
}

if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

if (tjsj.equals("1"))
{
	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("2"))
{
	wheresql+=" and jzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and jzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("3"))
{
	wheresql+=" and cwjzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and cwjzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("4"))
{
	wheresql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}


String nian=request.getParameter("nian");
String yue=request.getParameter("yue");
String yhdlm=(String)session.getAttribute("yhdlm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String fgsbh=null;
String fgsmc=null;
String hxmjbm=null;
String hxmjmc=null;
int qys=0;
double qye=0;
double fwmj=0;
int pjde=0;
int pmjj=0;

try {
	conn=cf.getConnection();


%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>房屋面积分析 </B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>


<table border="1" width="130%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%" >分公司</td>
  <td  width="9%" >面积分类</td>
  <td  width="7%" >平米均价</td>
  <td  width="7%" >总签单数</td>
  <td  width="7%" >签约数</td>
  <td  width="7%" >签约数比重</td>

  <td  width="13%" >签约数比重柱状图</td>

  <td  width="10%" >总签约额</td>
  <td  width="9%" >签约额</td>
  <td  width="8%" >签约额比重</td>
  <td  width="13%" >签约额比重柱状图</td>

</tr>
<%
	//获取最大数
	int fgsqys=0;
	double fgsqye=0;
	double fgsfwmj=0;
	int fgspjde=0;
	int fgspmjj=0;

	int sl=0;
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM dm_hxmjbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	int hh=0;
	String bgcolor="#E8E8FF";

	ls_sql=" SELECT crm_khxx.fgsbh,dwmc,count(*) qys,sum(qye) qye,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh(+) and  crm_khxx.zt in('2','5')";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.fgsbh,dwmc";
	ls_sql+=" order by crm_khxx.fgsbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		fgsmc=rs.getString("dwmc");
		fgsqys=rs.getInt("qys");
		fgsqye=rs.getDouble("qye");
		fgsfwmj=rs.getDouble("fwmj");

		hh++;
		if (hh%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (fgsqys==0)
		{
			fgspjde=0;
		}
		else{
			fgspjde=(int)(fgsqye/fgsqys);
		}

		if (fgsfwmj==0)
		{
			fgspmjj=0;
		}
		else{
			fgspmjj=(int)(fgsqye/fgsfwmj);
		}

		int row=0;

		ls_sql=" SELECT hxmjbm,hxmjmc";
		ls_sql+=" FROM dm_hxmjbm";
		ls_sql+=" order by hxmjbm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			hxmjbm=rs2.getString("hxmjbm");
			hxmjmc=rs2.getString("hxmjmc");

			row++;

			ls_sql=" SELECT count(*) qys,sum(qye) qye,sum(fwmj) fwmj";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.zt in('2','5')";
			ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
			ls_sql+=" and crm_khxx.hxmjbm='"+hxmjbm+"'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				qys=rs1.getInt("qys");
				qye=rs1.getDouble("qye");
				fwmj=rs1.getDouble("fwmj");

				if (qys==0)
				{
					pjde=0;
				}
				else{
					pjde=(int)(qye/qys);
				}

				if (fwmj==0)
				{
					pmjj=0;
				}
				else{
					pmjj=(int)(qye/fwmj);
				}

				double qysbl=0;
				double qyebl=0;
				if (fgsqys==0)
				{
					qysbl=0;
				}
				else{
					qysbl=qys*100.0/fgsqys;
				}
				if (fgsqye==0)
				{
					qyebl=0;
				}
				else{
					qyebl=qye*100.0/fgsqye;
				}

				if (row==1)
				{
					%>
					<tr align="center" bgcolor="<%=bgcolor%>" >
						<td rowspan="<%=sl%>"><%=fgsmc%></td>
						<td><%=hxmjmc%></td>
						<td align="right"><%=cf.formatDouble(pmjj)%></td>
						<td rowspan="<%=sl%>"><%=cf.formatDouble(fgsqys)%></td>
						<td align="right"><%=cf.formatDouble(qys)%></td>
						<td ><%=cf.formatDouble(qysbl)%>%</td>
						<td align="left"><img src="/images/ColuGif.gif" width="<%=qysbl*3%>" height="14"></td>
						<td rowspan="<%=sl%>"  align="right"><%=cf.formatDouble((long)fgsqye)%></td>
						<td  align="right"><%=cf.formatDouble((long)qye)%></td>
						<td ><%=cf.formatDouble(qyebl)%>%</td>
						<td align="left"><img src="/images/ColuGif.gif" width="<%=qyebl*3%>" height="14"></td>
					</tr>
					<%	
				}
				else{
					%>
					<tr align="center" bgcolor="<%=bgcolor%>" >
						<td ><%=hxmjmc%></td>
						<td align="right"><%=cf.formatDouble(pmjj)%></td>
						<td align="right"><%=cf.formatDouble(qys)%></td>
						<td ><%=cf.formatDouble(qysbl)%>%</td>
						<td align="left"><img src="/images/ColuGif.gif" width="<%=qysbl*3%>" height="14"></td>
						<td  align="right"><%=cf.formatDouble((long)qye)%></td>
						<td ><%=cf.formatDouble(qyebl)%>%</td>
						<td align="left"><img src="/images/ColuGif.gif" width="<%=qyebl*3%>" height="14"></td>
					</tr>
					<%	
				}

			}
			rs1.close();
			ps1.close();
		}
		rs2.close();
		ps2.close();

	}
	rs.close();
	ps.close();



		
		
	

%>

</table>


  </body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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

