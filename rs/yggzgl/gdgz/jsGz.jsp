<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String xh = request.getParameter("xh");

  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1 = null;

try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	String ssfgs = null;
	String ygbh = null;
	String dsx = null;
	double qqts = 0;
	double cqts = 0;

	double khgz = 0;
	double jxfz = 0;
	double byjxgz = 0;

	double jtbt=0;

	double mrcb=0;
	double cb=0;

	double jbgz=0;
	double gwgz=0;

	double sjts=0;
	double bjts=0;
	double kgts=0;

	double buzhu=0;
	double glgz=0;
	double jbf=0;
	double dhbt=0;
	double yjsxe=0;
	double tc=0;
	double jf=0;
	double cjkk=0;
	double qtkk=0;

	sql=" select ssfgs,ygbh,dsx,qqts,cqts,khgz,jxfz,mrcb,jbgz,gwgz,sjts,bjts,kgts  ,buzhu,glgz,jbf,dhbt,yjsxe,tc,jf,cjkk,qtkk" ;
	sql+=" from rs_yggzb" ;
	sql+=" where rs_yggzb.xh='"+xh+"'";
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	while(rs.next())
	{         
		ssfgs = rs.getString("ssfgs");			    
		ygbh = rs.getString("ygbh");			    
		dsx = rs.getString("dsx");			    
		qqts = rs.getDouble("qqts");		
		cqts = rs.getDouble("cqts");	

		khgz = rs.getDouble("khgz");		
		jxfz = rs.getDouble("jxfz");	
		mrcb = rs.getDouble("mrcb");	

		jbgz = rs.getDouble("jbgz");	
		gwgz = rs.getDouble("gwgz");	
		
		sjts = rs.getDouble("sjts");	
		bjts = rs.getDouble("bjts");	
		kgts = rs.getDouble("kgts");	
		
		buzhu = rs.getDouble("buzhu");	
		glgz = rs.getDouble("glgz");	
		jbf = rs.getDouble("jbf");	
		dhbt = rs.getDouble("dhbt");	
		yjsxe = rs.getDouble("yjsxe");	
		tc = rs.getDouble("tc");	
		jf = rs.getDouble("jf");	
		cjkk = rs.getDouble("cjkk");	
		qtkk = rs.getDouble("qtkk");	

		//绩效工资
		if (jxfz>=80)
		{
			byjxgz=khgz;
		}
		else if (jxfz>=70 && jxfz<80)
		{
			byjxgz=khgz*0.8;
		}
		else if (jxfz>=60 && jxfz<70)
		{
			byjxgz=khgz*0.6;
		}
		else{
			byjxgz=0;
		}

		//交通补贴
		if (cqts>qqts/2)
		{
			jtbt=jtbt;
		}
		else{
			jtbt=0;
		}

		//餐补
		cb=mrcb*cqts;

		double sjkk=0;
		double bjkk=0;
		double kgkk=0;

		//事假扣款
		if (dsx.equals("1"))//1：单休；2：双休
		{
			sjkk=(jbgz+gwgz)/26*sjts; //单休的计算公式：(基本工资+岗位工资)/26*天数
		}
		else {
			sjkk=(jbgz+gwgz)/21.75*sjts; //双休的计算公式：(基本工资+岗位工资)/21.75*天数
		}

		//病假扣款
		if (dsx.equals("1"))//1：单休；2：双休
		{
			bjkk=gwgz/26*sjts; //单休的计算公式：岗位工资/26*天数
		}
		else {
			bjkk=gwgz/21.75*sjts; //双休的计算公式：岗位工资/21.75*天数
		}

		//旷工扣款
		if (dsx.equals("1"))//1：单休；2：双休
		{
			kgkk=(jbgz+gwgz)/26*sjts; //单休的计算公式：(基本工资+岗位工资)/26*天数
		}
		else {
			kgkk=(jbgz+gwgz)/21.75*sjts; //双休的计算公式：(基本工资+岗位工资)/21.75*天数
		}

		//应发工资=基本工资+岗位工资+(绩效基数*绩效分值)+津贴+工龄工资+加班费+交通补贴+通讯补贴+餐饮补贴-扣保险+提成小计+奖罚-缺勤扣款+其他款项		
		double sqgz=jbgz+gwgz+byjxgz+buzhu+glgz+jbf+jtbt+dhbt+cb-yjsxe+tc+jf-(sjkk+bjkk+cjkk+kgkk)+qtkk;

		String dqbm="";
		sql=" select dqbm" ;
		sql+=" from sq_dwxx" ;
		sql+=" where dwbh='"+ssfgs+"'";
		ps1= conn.prepareStatement(sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{         
			dqbm = rs1.getString("dqbm");		
		}
		rs1.close();
		ps1.close();


		//扣个税
		double oldsqgz=sqgz;
		double ksk=0;
		if (dqbm.equals("01"))
		{
			oldsqgz=oldsqgz-2000;
			if (oldsqgz>0)
			{
				oldsqgz=oldsqgz-4000;

				if (oldsqgz>0)
				{
					oldsqgz=oldsqgz-4000;

					if (oldsqgz>0)
					{
						ksk=4000*0.05+4000*0.06+oldsqgz*0.07;
					}
					else{
						ksk=4000*0.05+(oldsqgz+4000)*0.06;
					}
				}
				else{
					ksk=(oldsqgz+4000)*0.05;
				}
			}
			else{
				ksk=0;
			}
		}
		else{
			oldsqgz=oldsqgz-2000;
			if (oldsqgz>0)
			{
				ksk=oldsqgz*0.03;
			}
			else{
				ksk=0;
			}
		}

		//实发工资
		double shgz=sqgz-ksk;


		sql="update rs_yggzb set byjxgz="+byjxgz+",jtbt="+jtbt+",cb="+cb+",sjkk="+sjkk+",bjkk="+bjkk+",kgkk="+kgkk+",sqgz="+sqgz+",ksk="+ksk+",shgz="+shgz;
		sql+=" where  (xh='"+xh+"' and ygbh='"+ygbh+"') ";
		ps1= conn.prepareStatement(sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();




	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
