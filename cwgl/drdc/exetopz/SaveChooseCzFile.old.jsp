<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

String[] hth =request.getParameterValues("hth");
String[] hjsfstr =request.getParameterValues("hjsf");
String kmdm=request.getParameter("kmdm");
String fgsbh=request.getParameter("fgsbh");
String fexp=cf.GB2Uni(request.getParameter("fexp"));

String rootPath=getServletContext().getRealPath("");
%>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

Connection conn1  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;

String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String url = "jdbc:odbc:impcgdd";
String user = "";
String passwd = "";

int count=0;
	

String kmmc=null;//科目名称

java.sql.Date sksj=cf.getDate();

String fclsname1=null;//第一个核算项目所属类别名称
String fobjid1=null;//第一个核算项目ID
String fobjname1=null;//第一个核算项目名称
String fclsname2=null;//第二个核算项目所属类别名称
String fobjid2=null;//第二个核算项目ID
String fobjname2=null;//第二个核算项目名称
String fclsname3=null;//第三个核算项目所属类别名称
String fobjid3=null;//第三个核算项目ID
String fobjname3=null;//第三个核算项目名称
String fclsname4=null;//第4个核算项目所属类别名称
String fobjid4=null;//第4个核算项目ID
String fobjname4=null;//第4个核算项目名称


try {
	//拷贝标准凭证文件
	String DBFSourece=rootPath+"\\foxpro\\JINDIEPZ.DBF";
	String DownFile=rootPath+"\\foxpro\\"+yhdlm+".dbf";

	FileInputStream fis=new FileInputStream(DBFSourece);
	FileOutputStream fos=new FileOutputStream(DownFile);
	byte[] buffer=new byte[1024];
	int len=0;
	while ((len=fis.read(buffer))!=-1)
	{
		fos.write(buffer,0,len);
	}
	fis.close();
	fos.close();

	DBFSourece=rootPath+"\\foxpro\\JINDIEPZCF.dbf";
	DownFile=rootPath+"\\foxpro\\"+yhdlm+"CF.dbf";

	fis=new FileInputStream(DBFSourece);
	fos=new FileOutputStream(DownFile);
	while ((len=fis.read(buffer))!=-1)
	{
		fos.write(buffer,0,len);
	}
	fis.close();
	fos.close();
	

	Class.forName (driver);
	conn = DriverManager.getConnection(url, user, passwd);

	conn1=cf.getConnection();    //得到连接

	conn.setAutoCommit(false);

	int row=0;
	double allhjsf=0;
	for (int i=0;i<hth.length ;i++ )
	{
		//合计实发
		double hjsf=0;
		if (hjsfstr[i]!=null && !hjsfstr[i].trim().equals(""))
		{
			try{
				hjsf=Double.parseDouble(hjsfstr[i].trim());
			}
			catch (Exception e) {
				conn.rollback();
				out.print("序号["+i+"]出错！[合计实发]非数字：" + hjsfstr[i]);
				return;
			}
		}

		allhjsf+=hjsf;

		
		String fdc="1";//D：借；C：贷,1：借（退款）；0：贷（收款）
		double fdebit=hjsf;//借方发生额
		double fcredit=0;//贷方发生额


		kmmc="";//科目名称

		ls_sql=" select kmmc" ;
		ls_sql+=" from cw_jzkmdm " ;
		ls_sql+=" where kmdm='"+kmdm+"' and fgsbh='"+fgsbh+"'";
		ps2= conn1.prepareStatement(ls_sql);
		rs2=ps2.executeQuery();
		if(rs2.next())
		{         
			kmmc = rs2.getString("kmmc");			    
		}
		else{
			conn.rollback();
			out.println("<BR>错误！科目代码：["+kmdm+"]不存在");
			return;
		}
		rs2.close();
		ps2.close();


		String khbh=null;//客户编号
		String khxm=null;//客户姓名
		String sjs=null;//设计师
		String sjsbh=null;//所属设计室编号
		String dwbh=null;//店面编码

		ls_sql=" select khbh,khxm,sjs,sjsbh,dwbh" ;
		ls_sql+=" from crm_khxx " ;
		ls_sql+=" where hth='"+hth[i]+"' and fgsbh='"+fgsbh+"'";
		ps1= conn1.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{         
			khbh = rs1.getString("khbh").trim();			    
			khxm = rs1.getString("khxm");			    
			sjs = rs1.getString("sjs");			    
			sjsbh = rs1.getString("sjsbh");			    
			dwbh = rs1.getString("dwbh");			    
		}
		else{
			conn.rollback();
			out.println("<BR>错误！合同号["+hth[i]+"]不存在");
			return;
		}
		rs1.close();
		ps1.close();
		
		
		String bianhao=null;//员工编号
		ls_sql=" select bianhao" ;
		ls_sql+=" from sq_yhxx " ;
		ls_sql+=" where dwbh='"+dwbh+"' and yhmc='"+sjs+"'";
		ps2= conn1.prepareStatement(ls_sql);
		rs2=ps2.executeQuery();
		if(rs2.next())
		{         
			bianhao = rs2.getString("bianhao");			    
		}
		else{
//			conn.rollback();
			bianhao="未知";
			out.println("<BR>警告！合同号[<A HREF=\"/khxx/ViewHthCrm_khxx.jsp?hth="+hth[i]+"\" target=\"_blank\">"+hth[i]+"</A>]，设计师["+sjs+"]不存在");
//			return;
		}
		rs2.close();
		ps2.close();

		if (bianhao==null || bianhao.equals(""))
		{
//			conn.rollback();
			bianhao="未知";
			out.println("<BR>警告！合同号[<A HREF=\"/khxx/ViewHthCrm_khxx.jsp?hth="+hth[i]+"\" target=\"_blank\">"+hth[i]+"</A>]，设计师["+sjs+"]工号不存在");
//			return;
		}

		String cwdm=null;//财务代码
		String dwmc=null;//财务代码
		ls_sql=" select dwmc,cwdm" ;
		ls_sql+=" from sq_dwxx " ;
		ls_sql+=" where dwbh='"+dwbh+"'";
		ps2= conn1.prepareStatement(ls_sql);
		rs2=ps2.executeQuery();
		if(rs2.next())
		{         
			dwmc = rs2.getString("dwmc");			    
			cwdm = rs2.getString("cwdm");			    
		}
		else{
			conn.rollback();
			out.println("<BR>错误！店面编码["+dwbh+"]不存在");
			return;
		}
		rs2.close();
		ps2.close();

		if (cwdm==null || cwdm.equals(""))
		{
			conn.rollback();
			out.println("<BR>错误！店面["+dwmc+"]的财务代码不存在");
			return;
		}


		fclsname1="客户";
		fobjid1=hth[i];
		fobjname1=khxm;

		fclsname2="部门";
		fobjid2=cwdm;//财务代码
		fobjname2=dwmc;

		fclsname3="";
		fobjid3="";
		fobjname3="";

		fclsname4="";
		fobjid4="";
		fobjname4="";


		ls_sql="insert into "+yhdlm+"(fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid,fclsname1,fobjid1";
		ls_sql+=" ,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4 ";
		ls_sql+=" ,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8";
		ls_sql+=" ,fobjid8,fobjname8,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit";
		ls_sql+=" ,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted ";
		ls_sql+=" ,fmodule,fdeleted,fserialno,funitname,freference,fcashflow)";
		ls_sql+= " values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sksj);
		ps.setDate(2,sksj);
		ps.setInt(3,0);//会计期间
		ps.setString(4,"记");//凭证字
		ps.setInt(5,0);//凭证号
		ps.setInt(6,row);//分录号
		ps.setString(7,fexp);//凭证摘要
		ps.setString(8,kmdm);//科目号
		ps.setString(9,fclsname1);//第一个核算项目所属类别名称
		ps.setString(10,fobjid1);//第一个核算项目ID

		ps.setString(11,fobjname1);//第一个核算项目名称
		ps.setString(12,fclsname2);
		ps.setString(13,fobjid2);
		ps.setString(14,fobjname2);
		ps.setString(15,fclsname3);
		ps.setString(16,fobjid3);
		ps.setString(17,fobjname3);
		ps.setString(18,fclsname4);//第四个核算项目所属类别名称
		ps.setString(19,fobjid4);//第四个核算项目ID
		ps.setString(20,fobjname4);//第四个核算项目名称

		ps.setString(21,"");
		ps.setString(22,"");
		ps.setString(23,"");
		ps.setString(24,"");
		ps.setString(25,"");
		ps.setString(26,"");
		ps.setString(27,"");
		ps.setString(28,"");
		ps.setString(29,"");
		ps.setString(30,"");

		ps.setString(31,"");
		ps.setString(32,"");
		ps.setString(33,"");//业务编号
		ps.setString(34,"RMB");//币种
		ps.setDouble(35,1);//汇率
		ps.setString(36,fdc);//D：借；C：贷
		ps.setDouble(37,hjsf);//原币金额
		ps.setDouble(38,0);//数量
		ps.setDouble(39,0);//单价
		ps.setDouble(40,fdebit);//借方发生额

		ps.setDouble(41,fcredit);//贷方发生额
		ps.setString(42,"*");//结算方式名称
		ps.setString(43,"");//结算号
		ps.setString(44,yhmc);//制单人
		ps.setString(45,"");//
		ps.setString(46,"");//
		ps.setString(47,"");//过账人
		ps.setString(48,"");//审核人
		ps.setInt(49,0);//附件张数
		ps.setInt(50,0);//过账标记

		ps.setString(51,"");//机制凭证模块标识
		ps.setInt(52,0);//删除标记
		ps.setInt(53,0);//凭证序号
		ps.setString(54,"");//单位
		ps.setString(55,"");//参考信息
		ps.setInt(56,0);//是否已指定现金流量
		
		ps.executeUpdate();
		ps.close();

		row++;
	}

/*
	if (row>0)
	{
		kmdm="501.01";
		
		String fdc="0";//D：借；C：贷,1：借（退款）；0：贷（收款）
		double fdebit=0;//借方发生额
		double fcredit=allhjsf;//贷方发生额

		fclsname1="部门";
		fobjid1="02.07.01.79";
		fobjname1=kmmc;

		fclsname2="";
		fobjid2="";
		fobjname2="";

		fclsname3="";
		fobjid3="";
		fobjname3="";

		fclsname4="";
		fobjid4="";
		fobjname4="";

		ls_sql="insert into "+yhdlm+"(fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid,fclsname1,fobjid1";
		ls_sql+=" ,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4 ";
		ls_sql+=" ,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8";
		ls_sql+=" ,fobjid8,fobjname8,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit";
		ls_sql+=" ,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted ";
		ls_sql+=" ,fmodule,fdeleted,fserialno,funitname,freference,fcashflow)";
		ls_sql+= " values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sksj);
		ps.setDate(2,sksj);
		ps.setInt(3,0);//会计期间
		ps.setString(4,"记");//凭证字
		ps.setInt(5,0);//凭证号
		ps.setInt(6,0);//分录号
		ps.setString(7,fexp);//凭证摘要
		ps.setString(8,kmdm);//科目号
		ps.setString(9,fclsname1);//第一个核算项目所属类别名称
		ps.setString(10,fobjid1);//第一个核算项目ID

		ps.setString(11,fobjname1);//第一个核算项目名称
		ps.setString(12,fclsname2);
		ps.setString(13,fobjid2);
		ps.setString(14,fobjname2);
		ps.setString(15,fclsname3);
		ps.setString(16,fobjid3);
		ps.setString(17,fobjname3);
		ps.setString(18,fclsname4);//第四个核算项目所属类别名称
		ps.setString(19,fobjid4);//第四个核算项目ID
		ps.setString(20,fobjname4);//第四个核算项目名称

		ps.setString(21,"");
		ps.setString(22,"");
		ps.setString(23,"");
		ps.setString(24,"");
		ps.setString(25,"");
		ps.setString(26,"");
		ps.setString(27,"");
		ps.setString(28,"");
		ps.setString(29,"");
		ps.setString(30,"");

		ps.setString(31,"");
		ps.setString(32,"");
		ps.setString(33,"");//业务编号
		ps.setString(34,"RMB");//币种
		ps.setDouble(35,1);//汇率
		ps.setString(36,fdc);//D：借；C：贷
		ps.setDouble(37,allhjsf);//原币金额
		ps.setDouble(38,0);//数量
		ps.setDouble(39,0);//单价
		ps.setDouble(40,fdebit);//借方发生额

		ps.setDouble(41,fcredit);//贷方发生额
		ps.setString(42,"*");//结算方式名称
		ps.setString(43,"");//结算号
		ps.setString(44,yhmc);//制单人
		ps.setString(45,"");//
		ps.setString(46,"");//
		ps.setString(47,"");//过账人
		ps.setString(48,"");//审核人
		ps.setInt(49,0);//附件张数
		ps.setInt(50,0);//过账标记

		ps.setString(51,"");//机制凭证模块标识
		ps.setInt(52,0);//删除标记
		ps.setInt(53,0);//凭证序号
		ps.setString(54,"");//单位
		ps.setString(55,"");//参考信息
		ps.setInt(56,0);//是否已指定现金流量
		
		ps.executeUpdate();
		ps.close();

		row++;
	}
*/

	conn.commit();

	out.print("<P>成功导出凭证："+yhdlm+".dbf、"+yhdlm+"CF.dbf，共导出记录数："+row);
}
catch (Exception e) {
	conn.rollback();

	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);

	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) conn.close();
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn1 != null) cf.close(conn1);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
<BR><BR>点击鼠标右键下载凭证（两个文件）：
<A HREF="/foxpro/<%=yhdlm%>.dbf"><%=yhdlm%>.dbf</A> 
&nbsp;&nbsp;
<A HREF="/foxpro/<%=yhdlm%>CF.dbf"><%=yhdlm%>CF.dbf</A>