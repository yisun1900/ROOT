<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String ssdqbm=request.getParameter("ssdqbm");
	String fgs=request.getParameter("fgs");
	String wheredwbh=request.getParameter("dwbh");
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='290109'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[店面产值按月统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[店面产值按月统计]："+xtrzyhmc+"') ";
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

String jzbz=request.getParameter("jzbz");
String tjsj=request.getParameter("tjsj");

String wheresql="";
String wheresql1="";
String wheresql2="";



if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

if (tjsj.equals("1"))
{
	wheresql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("2"))
{
	wheresql+=" and crm_khxx.jzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and crm_khxx.jzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("3"))
{
	wheresql+=" and crm_khxx.cwjzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and crm_khxx.cwjzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("4"))
{
	wheresql+=" and crm_khxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and crm_khxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}

if (!(ssdqbm.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql1+=" and  (a.ssdqbm='"+ssdqbm+"')";
//	wheresql2+=" and  (crm_zxkhxx.ssfgs in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
}

if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
//	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
//	wheresql2+=" and  (crm_zxkhxx.ssfgs='"+fgs+"')";
}

if (!(wheredwbh.equals("")))
{
	wheresql+=" and  crm_khxx.dwbh='"+wheredwbh+"'";
//	wheresql1+=" and  a.dwbh='"+dwbh+"'";
//	wheresql2+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
}



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
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
  <B>店面产值按月统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>


<%
		int yfsl=0;//月数量
		ls_sql=" select count(*)";
		ls_sql+=" FROM crm_rqb";
		ls_sql+=" where crm_rqb.nian||'-'||crm_rqb.yue>='"+sjfw.substring(0,7)+"'";
		ls_sql+=" and crm_rqb.nian||'-'||crm_rqb.yue<='"+sjfw2.substring(0,7)+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yfsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		double[] yfxj=new double[yfsl];//分公司月小计
		double[] yzxj=new double[yfsl];//总公司月小计



		%>
	<TABLE cellSpacing=0 cellPadding=2 border=1 width="<%=(300+yfsl*120+150+80)%>" style='FONT-SIZE: 14px'>
		<tr align="center" bgcolor="#CCCCCC" >
		  <td  width="30" >序号</td>
		  <td  width="110" >分公司</td>
		  <td  width="160" >店面</td>
		<%	

		String xsyue=null;
		ls_sql=" select crm_rqb.nian||'-'||crm_rqb.yue";
		ls_sql+=" FROM crm_rqb";
		ls_sql+=" where crm_rqb.nian||'-'||crm_rqb.yue>='"+sjfw.substring(0,7)+"'";
		ls_sql+=" and crm_rqb.nian||'-'||crm_rqb.yue<='"+sjfw2.substring(0,7)+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xsyue=rs.getString(1);

			%>
				<td width="120"><%=xsyue%></td>
			<%	
		}
		rs.close();
		ps.close();

		%>
			<td width="150">小计</td>
		</tr>
		<%	


		String oldfgsmc="";
		String fgsbh=null;
		String fgsmc=null;
		String dwbh=null;
		String dwmc=null;
		String nian=null;
		int qys=0;
		double qye=0;
		double wdzgce=0;

		double dmxj=0;

		int col=yfsl;
		int row=0;

		if (tjsj.equals("1"))
		{
			ls_sql=" SELECT fgsbh,fgsmc,dwbh,dwmc,nian,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce";
			ls_sql+=" from ( ";
			
			ls_sql+=" SELECT crm_khxx.fgsbh,a.dwmc fgsmc,crm_khxx.dwbh,b.dwmc,TO_CHAR(crm_khxx.qyrq,'YYYY-MM') nian,count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce";
			ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b";
			ls_sql+=" where crm_khxx.zt in('2','5')";
			ls_sql+=" and crm_khxx.fgsbh=a.dwbh and crm_khxx.dwbh=b.dwbh";
			ls_sql+=wheresql;
			ls_sql+=" group by crm_khxx.fgsbh,a.dwmc,crm_khxx.dwbh,b.dwmc,TO_CHAR(crm_khxx.qyrq,'YYYY-MM')";

			ls_sql+=" UNION ALL ";
		
			ls_sql+=" SELECT b.dwbh fgsbh,b.dwmc fgsmc,a.dwbh,a.dwmc,crm_rqb.nian||'-'||crm_rqb.yue,0 qys,0 qye,0 wdzgce";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b,crm_rqb";
			ls_sql+=" where a.dwlx='F2' and (a.cxbz='N' OR a.dwbh in(select distinct dwbh from crm_khxx where zt in('2','5') "+wheresql+"))";
			ls_sql+=" and a.ssfgs=b.dwbh";
			ls_sql+=" and crm_rqb.nian||'-'||crm_rqb.yue>='"+sjfw.substring(0,7)+"'";
			ls_sql+=" and crm_rqb.nian||'-'||crm_rqb.yue<='"+sjfw2.substring(0,7)+"'";
		
			ls_sql+=" ) ";
			ls_sql+=" group by fgsbh,fgsmc,dwbh,dwmc,nian";
			ls_sql+=" order by fgsbh,fgsmc,dwbh,dwmc,nian";
		}
		else if (tjsj.equals("2"))
		{
			ls_sql=" SELECT fgsbh,fgsmc,dwbh,dwmc,nian,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce";
			ls_sql+=" from ( ";
			
			ls_sql+=" SELECT crm_khxx.fgsbh,a.dwmc fgsmc,crm_khxx.dwbh,b.dwmc,TO_CHAR(crm_khxx.jzkscsj,'YYYY-MM') nian,count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce";
			ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b";
			ls_sql+=" where crm_khxx.zt in('2','5')";
			ls_sql+=" and crm_khxx.fgsbh=a.dwbh and crm_khxx.dwbh=b.dwbh";
			ls_sql+=wheresql;
			ls_sql+=" group by crm_khxx.fgsbh,a.dwmc,crm_khxx.dwbh,b.dwmc,TO_CHAR(crm_khxx.jzkscsj,'YYYY-MM')";

			ls_sql+=" UNION ALL ";
		
			ls_sql+=" SELECT b.dwbh fgsbh,b.dwmc fgsmc,a.dwbh,a.dwmc,crm_rqb.nian||'-'||crm_rqb.yue,0 qys,0 qye,0 wdzgce";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b,crm_rqb";
			ls_sql+=" where a.dwlx='F2' and (a.cxbz='N' OR a.dwbh in(select distinct dwbh from crm_khxx where zt in('2','5') "+wheresql+"))";
			ls_sql+=" and a.ssfgs=b.dwbh";
			ls_sql+=" and crm_rqb.nian||'-'||crm_rqb.yue>='"+sjfw.substring(0,7)+"'";
			ls_sql+=" and crm_rqb.nian||'-'||crm_rqb.yue<='"+sjfw2.substring(0,7)+"'";
		
			ls_sql+=" ) ";
			ls_sql+=" group by fgsbh,fgsmc,dwbh,dwmc,nian";
			ls_sql+=" order by fgsbh,fgsmc,dwbh,dwmc,nian";
		}
		else if (tjsj.equals("3"))
		{
			ls_sql=" SELECT fgsbh,fgsmc,dwbh,dwmc,nian,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce";
			ls_sql+=" from ( ";
			
			ls_sql+=" SELECT crm_khxx.fgsbh,a.dwmc fgsmc,crm_khxx.dwbh,b.dwmc,TO_CHAR(crm_khxx.cwjzkscsj,'YYYY-MM') nian,count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce";
			ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b";
			ls_sql+=" where crm_khxx.zt in('2','5')";
			ls_sql+=" and crm_khxx.fgsbh=a.dwbh and crm_khxx.dwbh=b.dwbh";
			ls_sql+=wheresql;
			ls_sql+=" group by crm_khxx.fgsbh,a.dwmc,crm_khxx.dwbh,b.dwmc,TO_CHAR(crm_khxx.cwjzkscsj,'YYYY-MM')";

			ls_sql+=" UNION ALL ";
		
			ls_sql+=" SELECT b.dwbh fgsbh,b.dwmc fgsmc,a.dwbh,a.dwmc,crm_rqb.nian||'-'||crm_rqb.yue,0 qys,0 qye,0 wdzgce";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b,crm_rqb";
			ls_sql+=" where a.dwlx='F2' and (a.cxbz='N' OR a.dwbh in(select distinct dwbh from crm_khxx where zt in('2','5') "+wheresql+"))";
			ls_sql+=" and a.ssfgs=b.dwbh";
			ls_sql+=" and crm_rqb.nian||'-'||crm_rqb.yue>='"+sjfw.substring(0,7)+"'";
			ls_sql+=" and crm_rqb.nian||'-'||crm_rqb.yue<='"+sjfw2.substring(0,7)+"'";
		
			ls_sql+=" ) ";
			ls_sql+=" group by fgsbh,fgsmc,dwbh,dwmc,nian";
			ls_sql+=" order by fgsbh,fgsmc,dwbh,dwmc,nian";
		}
		else if (tjsj.equals("4"))
		{
			ls_sql=" SELECT fgsbh,fgsmc,dwbh,dwmc,nian,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce";
			ls_sql+=" from ( ";
			
			ls_sql+=" SELECT crm_khxx.fgsbh,a.dwmc fgsmc,crm_khxx.dwbh,b.dwmc,TO_CHAR(crm_khxx.lrsj,'YYYY-MM') nian,count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce";
			ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b";
			ls_sql+=" where crm_khxx.zt in('2','5')";
			ls_sql+=" and crm_khxx.fgsbh=a.dwbh and crm_khxx.dwbh=b.dwbh";
			ls_sql+=wheresql;
			ls_sql+=" group by crm_khxx.fgsbh,a.dwmc,crm_khxx.dwbh,b.dwmc,TO_CHAR(crm_khxx.lrsj,'YYYY-MM')";

			ls_sql+=" UNION ALL ";
		
			ls_sql+=" SELECT b.dwbh fgsbh,b.dwmc fgsmc,a.dwbh,a.dwmc,crm_rqb.nian||'-'||crm_rqb.yue,0 qys,0 qye,0 wdzgce";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b,crm_rqb";
			ls_sql+=" where a.dwlx='F2' and (a.cxbz='N' OR a.dwbh in(select distinct dwbh from crm_khxx where zt in('2','5') "+wheresql+"))";
			ls_sql+=" and a.ssfgs=b.dwbh";
			ls_sql+=" and crm_rqb.nian||'-'||crm_rqb.yue>='"+sjfw.substring(0,7)+"'";
			ls_sql+=" and crm_rqb.nian||'-'||crm_rqb.yue<='"+sjfw2.substring(0,7)+"'";
		
			ls_sql+=" ) ";
			ls_sql+=" group by fgsbh,fgsmc,dwbh,dwmc,nian";
			ls_sql+=" order by fgsbh,fgsmc,dwbh,dwmc,nian";
		
		}
		ps= conn.prepareStatement(ls_sql);
//		out.println(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			fgsbh=rs.getString("fgsbh");
			fgsmc=rs.getString("fgsmc");
			dwbh=rs.getString("dwbh");
			dwmc=rs.getString("dwmc");
			nian=rs.getString("nian");
			qys=rs.getInt("qys");
			qye=rs.getDouble("qye");
			wdzgce=rs.getDouble("wdzgce"); 
//			out.print(fgsbh+"===="+fgs);

			if (!(fgs.equals("")))
			{
				if (!(fgsbh.equals(fgs)))
					continue;
			}

			if (!(wheredwbh.equals("")))
			{
				if (!(wheredwbh.equals(dwbh)))
					continue;
			}

			

//			out.println(fgsmc+dwmc+nian+","+col+","+yfsl+","+qye);


			if (col==yfsl)//新行开始
			{
				col=1;
				row++;


				//显示新的一行
				if (row==1)
				{
					%>
					<tr align="center">
						<td ><%=row%></td>
						<td ><%=fgsmc%></td>
						<td ><%=dwmc%></td>
						<td ><%=qye%></td>
					<%	
				}
				else{
					%>
						<td ><%=cf.formatDouble(dmxj)%></td>
					</tr>

					<%
					//显示分公司小计
					if (!oldfgsmc.equals(fgsmc) && row!=2)
					{
						%>
						<tr align="center" bgcolor="#FFFFCC">
							<td colspan="3"><%=oldfgsmc%>小计</td>

							<%
							double fgsyxj=0;//分公司月小计
							for (int j=0;j<yfsl ;j++ )
							{
								fgsyxj+=yfxj[j];
								%>
								<td ><%=cf.formatDouble(yfxj[j])%></td>
								<%
							}
							%>
							<td ><%=cf.formatDouble(fgsyxj)%></td>
						</tr>
						<%	

						//清空分公司小计
						for (int j=0;j<yfsl ;j++ )
						{
							yfxj[j]=0;
						}
					}


					oldfgsmc=fgsmc;
					

					%>
					<tr align="center">
						<td ><%=row%></td>
						<td ><%=fgsmc%></td>
						<td ><%=dwmc%></td>
						<td ><%=qye%></td>
					<%	
				}

				dmxj=qye;
			}
			else{
				col++;
				dmxj+=qye;//店面小计

				%>
					<td ><%=qye%></td>
				<%	
			}

			//计算分公司小计
			yfxj[col-1]+=qye;
			yzxj[col-1]+=qye;
	
		}
		rs.close();
		ps.close();
		
		
		%>
			<td ><%=cf.formatDouble(dmxj)%></td>
		</tr>

		<tr align="center" bgcolor="#FFFFCC">
			<td colspan="3"><%=oldfgsmc%>小计</td>

			<%
			double fgsyxj=0;//分公司月小计
			for (int j=0;j<yfsl ;j++ )
			{
				fgsyxj+=yfxj[j];
				%>
				<td ><%=cf.formatDouble(yfxj[j])%></td>
				<%
			}
			%>
			<td ><%=cf.formatDouble(fgsyxj)%></td>
		</tr>

		<tr align="center" bgcolor="#FFFFCC">
			<td colspan="3">总 计</td>

			<%
			double zgsyxj=0;//总公司月小计
			for (int j=0;j<yfsl ;j++ )
			{
				zgsyxj+=yzxj[j];
				%>
				<td ><%=cf.formatDouble(yzxj[j])%></td>
				<%
			}
			%>
			<td ><%=cf.formatDouble(zgsyxj)%></td>
		</tr>

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


