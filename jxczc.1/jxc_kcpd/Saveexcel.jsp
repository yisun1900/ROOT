<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="xym" scope="page" class="jxc.xym.Xym"/>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();
String wherepdph=request.getParameter("pdph");
long pdph=0;
if (wherepdph!=null && !wherepdph.trim().equals(""))
		{
			try{
				pdph=Long.parseLong(wherepdph.trim());
			}
			catch (Exception e) {
				out.print("出错！[盘点批号]非数字：" + wherepdph);
				return;
			}
		}
	else
	{out.print("错误！没有取得到盘点批号");}
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String pdbh=cf.GB2Uni(request.getParameter("pdbh"));
String[] xuhaojh =request.getParameterValues("xuhao");
String[] ckbhjh =request.getParameterValues("ckbh");
String[] clbmjh =request.getParameterValues("clbm");
String[] ggjh =request.getParameterValues("gg");
String[] zcpsljh =request.getParameterValues("zcpsl");
String[] ccpsljh =request.getParameterValues("ccpsl");
String[] bfpsljh =request.getParameterValues("bfpsl");
String[] dqbmjh =request.getParameterValues("dqbm");

String dqbm=null;
String xuhao=null;
String ckbh=null;
String hjbh=null;
String hwbh=null;
String clbm=null;
String gg =null;
String xh=null;
String nbbm=null;
String clmc=null;
double pdzcyl=0;
double kczcpsl =0;
double kcccpsl =0;
double kcbfpsl =0;
double pdzcpsl =0;
double pdccpsl =0;
double pdbfpsl =0;
double pdcl=0;
double zcppdcyl=0;
double pdkczsl=0;
double sjkczsl=0;
String pdjg="3";
long pdxh=0;
int bbu=0;  
int ssds=0;

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

int i=0;

try {
	conn=cf.getConnection();    //得到连接
	

	conn.setAutoCommit(false);

	for (i=0;i<xuhaojh.length ;i++ )
	{
		bbu++;
		//序号
		xuhao=cf.GB2Uni(xuhaojh[i]);
		//地区
		dqbm=cf.GB2Uni(dqbmjh[i]);
		//仓库
		ckbh=cf.GB2Uni(ckbhjh[i]);
		//材料编码
		clbm=cf.GB2Uni(clbmjh[i]);
		//盘点正常品数量
		pdzcpsl=0;
		if (zcpsljh[i]!=null && !zcpsljh[i].equals(""))
		{
			pdzcpsl=Double.parseDouble(zcpsljh[i]);
		}
		//盘点残次品数量
		pdccpsl=0;
		if (ccpsljh[i]!=null && !ccpsljh[i].equals(""))
		{
			pdccpsl=Double.parseDouble(ccpsljh[i]);
		}
		//盘点报废品数量
		pdbfpsl=0;
		if (bfpsljh[i]!=null && !bfpsljh[i].equals(""))
		{
			pdbfpsl=Double.parseDouble(bfpsljh[i]);
		}
		
		//生成盘点序号
		ls_sql="select MAX(pdxh)+1 pdxh ";
		ls_sql+=" from  jxc_kcpdmx";
		ls_sql+=" where  (pdph="+pdph+")  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			pdxh=rs.getLong("pdxh");
			if (pdxh==0)
			{pdxh=pdxh+1;}
		}
		rs.close();
		ps.close();
		//检查材料编码是否已经导入
		ls_sql="select count(*) ";
		ls_sql+=" from  jxc_kcpdmx";
		ls_sql+=" where  (clbm="+clbm+") and (pdph="+pdph+")  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ssds=rs.getInt(1);
			
		}
		rs.close();
		ps.close();
		if (ssds>0)
		{
			out.print("<font color=red>错误！材料编码:["+clbm+"]已经导入，不可重复导入！！！</font>");
			conn.rollback();return;
		}
		//查询材料基本信息
		ls_sql="select clmc,xh,gg,nbbm ";
		ls_sql+=" from  jxc_clbm ";
		ls_sql+=" where  (clbm="+clbm+")  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clmc=cf.fillNull(rs.getString("clmc"));
			xh=cf.fillNull(rs.getString("xh"));
			gg=cf.fillNull(rs.getString("gg"));
			nbbm=cf.fillNull(rs.getString("nbbm"));
		}
		else
		{
			out.print("<font color=red>错误！不存在的材料编码:["+clbm+"]</font>");
			conn.rollback();return;
		}
		rs.close();
		ps.close();
		//查询库存正常品数量
		for (int m=1;m<4;m++)//1：正常品；2：残次品；3：报废品；
		{
			ls_sql="SELECT sum(kcsl) kcsl ";
			ls_sql+=" FROM jxc_kcb ";
			ls_sql+=" where jxc_kcb.ckbh='"+ckbh+"' and cllb='0' and clbm='"+clbm+"' and zljb='"+m+"'  ";
			ps= conn.prepareStatement(ls_sql+"<br>");
			rs =ps.executeQuery(ls_sql);
//			out.print(ls_sql);
			if (rs.next())
			{
				if (m==1)
				{
					kczcpsl=rs.getDouble("kcsl");
				}
				else if (m==2)
				{
					kcccpsl=rs.getDouble("kcsl");
				}
				else if (m==3)
				{
					kcbfpsl=rs.getDouble("kcsl");
				}
			}
			else
			{
				if (m==1)
				{kczcpsl=0;}
				else if (m==2)
				{kcccpsl=0;}
				else if (m==3)
				{kcbfpsl=0;}
			}
			rs.close();
			ps.close();
		}
		zcppdcyl=pdzcpsl-kczcpsl;
		sjkczsl=kczcpsl+kcccpsl+kcbfpsl;
		pdkczsl=pdzcpsl+pdccpsl+pdbfpsl;
		pdzcyl=pdkczsl-sjkczsl;
		if (pdzcyl>0)//1：盘盈；2：盘亏；3：盘平
		{pdjg="1";}
		else if (pdzcyl<0)
		{pdjg="2";}
		else
		{pdjg="3";}


//将盘点结果写入数据库
		ls_sql="insert into jxc_kcpdmx ( pdph,pdxh,dqbm,ckbh,clbm,clmc,xh,gg,nbbm,kczcpsl,kcccpsl,kcbfpsl,pdzcpsl,pdccpsl,pdbfpsl,zcppdcyl,pdzcyl,pdjg ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,pdph);
		ps.setLong(2,pdxh);
		ps.setString(3,dqbm);
		ps.setString(4,ckbh);
		ps.setString(5,clbm);
		ps.setString(6,clmc);
		ps.setString(7,xh);
		ps.setString(8,gg);
		ps.setString(9,nbbm);

		ps.setDouble(10,kczcpsl);
		ps.setDouble(11,kcccpsl);
		ps.setDouble(12,kcbfpsl);
		ps.setDouble(13,pdzcpsl);
		ps.setDouble(14,pdccpsl);
		ps.setDouble(15,pdbfpsl);

		ps.setDouble(16,zcppdcyl);
		ps.setDouble(17,pdzcyl);
		ps.setString(18,pdjg);
		if (ps.executeUpdate()!=1)
		{
			out.println("<BR>存盘失败！");
			conn.rollback();return;
		}
		if (ps != null) ps.close(); 
	}
	conn.commit();
	%>
	<SCRIPT language=javascript >
	<!--
		alert("[ <%=bbu%> ]条数据存盘成功！！");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>出错序号：" + xuhaojh[i]);
	out.print("<P>存盘失败,发生意外: " + e);
	out.print("<P>sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
