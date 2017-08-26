<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%

String lrr=(String)session.getAttribute("yhmc");
java.sql.Date lrsj=java.sql.Date.valueOf(cf.today());

String[] fgsbh =request.getParameterValues("fgsbh");
String[] dwbh =request.getParameterValues("dwbh");
String[] bianhao =request.getParameterValues("bianhao");
String[] yhmc =request.getParameterValues("yhmc");
String[] xb =request.getParameterValues("xb");
String[] sfzh =request.getParameterValues("sfzh");
String[] xzzwbm =request.getParameterValues("xzzwbm");
String[] zwbm =request.getParameterValues("zwbm");
String[] bjjb =request.getParameterValues("bjjb");
String[] bjjbbm =request.getParameterValues("bjjbbm");
String[] nxdh =request.getParameterValues("nxdh");
String[] wxdh =request.getParameterValues("wxdh");

String[] dh =request.getParameterValues("dh");
String[] email =request.getParameterValues("email");
String[] csrq=request.getParameterValues("csrq");
String[] rzsj=request.getParameterValues("rzsj");
String[] hjszd=request.getParameterValues("hjszd");
String[] xlbm=request.getParameterValues("xlbm");
String[] zy=request.getParameterValues("zy");


String ls_sql = null;
String sql=null;
Connection conn  = null;
PreparedStatement ps=null;
PreparedStatement ps1=null;
ResultSet rs = null;

int ygbh=0;
String bgdh=null;

int i=0;
int count=0;
try {
	conn=cf.getConnection();    //得到连接




	conn.setAutoCommit(false);

	ls_sql="select NVL(max(ygbh),0)";
	ls_sql+=" from  sq_yhxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ygbh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ygbh++;

	for (i=0;i<yhmc.length ;i++ )
	{
		bgdh="";
		if (!nxdh[i].equals(""))
		{
			bgdh+="内线："+cf.GB2Uni(nxdh[i]);
		}
		if (!wxdh[i].equals(""))
		{
			bgdh+="外线："+cf.GB2Uni(wxdh[i]);
		}
		
		ls_sql="insert into sq_yhxx (ygbh,bianhao,yhmc,xb,sfzszg,dh,bgdh,email,sfzh,xzzwbm";
		ls_sql+=" ,zwbm,sfytj,ssfgs,dwbh,lrr,lrsj,sfydbs,gzlb,rzcs,rzsj,bjjb,csrq,hjszd,xlbm,zy";
		ls_sql+=" ,sfqs,sfcjbx,ylbx,jylbx,sybx,gsby,syx   ,sfjgjj,ckjgbz,zdyhbz,kdlxtbz,sjxzbz   ,ipxzbz,wkxzbz,khdhbz,kkglfx,kfgssq,dhsfgb,wgzsj,kkbbz   ,mmsyzq,yxdlsbcs,bsxtsmmzq) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,TO_DATE(?,'YYYY-MM-DD'),?,TO_DATE(?,'YYYY-MM-DD'),?,?,? ";
		ls_sql+="  ,'N','N','N','N','N','N','N'  ,'N','Y','N','N','N'   ,'N','N','N','N','0','N','0','Y'    ,360,300,360) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,ygbh+i);
		ps.setString(2,bianhao[i]);
		ps.setString(3,cf.GB2Uni(yhmc[i]));
		ps.setString(4,xb[i]);
		ps.setString(5,"Y");
		ps.setString(6,cf.GB2Uni(dh[i]));
		ps.setString(7,bgdh);
		ps.setString(8,cf.GB2Uni(email[i]));
		ps.setString(9,sfzh[i]);
		ps.setString(10,cf.GB2Uni(xzzwbm[i]));

		ps.setString(11,cf.GB2Uni(zwbm[i]));
		ps.setString(12,"Y");
		ps.setString(13,fgsbh[i]);
		ps.setString(14,dwbh[i]);
		ps.setString(15,lrr);
		ps.setDate(16,lrsj);
		ps.setString(17,"N");
		ps.setString(18,"1");
		ps.setInt(19,1);
		ps.setString(20,rzsj[i]);
		ps.setString(21,cf.GB2Uni(bjjb[i]));
		ps.setString(22,csrq[i]);
		ps.setString(23,cf.GB2Uni(hjszd[i]));
		ps.setString(24,cf.GB2Uni(xlbm[i]));
		ps.setString(25,cf.GB2Uni(zy[i]));
		ps.executeUpdate();
		ps.close();

		if (!bjjbbm[i].equals(""))
		{
			ls_sql="insert into sq_sjsbjjb (ygbh,bjjbbm)";
			ls_sql+=" values ( ?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,ygbh+i);
			ps.setString(2,bjjbbm[i]);
			ps.executeUpdate();
			ps.close();
		}
	}

	
	conn.commit();

	

	%>
	<SCRIPT language=javascript >
	<!--
		alert("[增加新的员工资料]成功！");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>出错序号：" + i);
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
