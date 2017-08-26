<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
Connection conn=null;
PreparedStatement ps=null;
PreparedStatement ps1=null;
PreparedStatement ps2=null;
ResultSet rs=null;
ResultSet rs2=null;
String ls_sql=null;
String sql=null;
//get参数cUserID、cPassword
String n0=null;
String n1=null;
String n2=null;
String n3=null;
String n4=null;
String n5=null;
String n6=null;
String n7=null;
String n8=null;
String n9=null;
String n10=null;

String khbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String dwbh=null;
String sgd=null;
String bz=null;
double qye=0;
java.sql.Date qyrq=null;
java.sql.Date sjkgrq=null;
java.sql.Date sjjgrq=null;


String pdclzt="4";//1申请派单；2派单；3拒绝派单；4接受派单；5：保持原派
String hdbz="1";//1：非回单； 2：设计师回单；3：施工队回单
String gcjdbm="4";//4完工
String wgbz="Y";//Y：已完工；N：未完工
String ybjbz="N";//Y：是；N：否
String zt="2";//1：咨询客户；2：签约客户
String khlxbm="04";//04普通客户
String tsbz="N";//Y：有投诉；N：无投诉
String tkbz="N";//Y：有退款；N：无退款
String lrr="crm";//
java.sql.Date lrsj=cf.getDate();

//查询用户登陆信息

try {
	conn=cf.getConnection();   //得到连接

	sql="select n0,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10";
	sql+=" from KHXX";
	sql+=" order by n0";
//	out.println("<BR>sql="+sql);
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	while (rs.next())//用户存在
	{
		n0=rs.getString("n0");//
		n1=rs.getString("n1");//khxm客户姓名
		n2=rs.getString("n2");//lxfs联系方式
		n3=rs.getString("n3");//qye签约额

		n4=rs.getString("n4");//qyrq签约日
		n5=rs.getString("n5");//sjkgrq开工日
		n6=rs.getString("n6");//sjjgrq竣工日


		n7=rs.getString("n7");//sjs设计师
		n8=rs.getString("n8");//sgd工长
		n9=rs.getString("n9");//zjxm质检
		n10=rs.getString("n10");//fwdz施工地址

		khxm=n1;
		lxfs=n2;
		sjs=n7;
		zjxm=n9;
		fwdz=n10;
		bz=n0;

		int mark=0;
		if (n4!=null)
		{
			if (n4.length()==4 && n4.indexOf(".")==-1)
			{
				n4=n4.substring(0,2)+"."+n4.substring(2,4);
				out.println("n4="+n4);
				mark=1;
			}
			if (n4.endsWith("."))
			{
				out.println("n4="+n4);
				n4=n4.substring(0,n4.length()-1);
				out.println("n4="+n4);
				mark=1;
			}
		}
		if (n5!=null)
		{
			if (n5.length()==4 && n5.indexOf(".")==-1)
			{
				out.println("n5="+n5);
				n5=n5.substring(0,2)+"."+n5.substring(2,4);
				out.println(",n5="+n5);
				mark=1;
			}
			if (n5.endsWith("."))
			{
				out.println("n5="+n5);
				n5=n5.substring(0,n5.length()-1);
				out.println("n5="+n5);
				mark=1;
			}
		}
		if (n6!=null)
		{
			if (n6.length()==4 && n6.indexOf(".")==-1)
			{
				out.println("n6="+n6);
				n6=n6.substring(0,2)+"."+n6.substring(2,4);
				out.println(",n6="+n6);
				mark=1;
			}
			if (n6.endsWith("."))
			{
				out.println("n6="+n6);
				n6=n6.substring(0,n6.length()-1);
				out.println("n6="+n6);
				mark=1;
			}
		}

		if (mark==1)
		{
			ls_sql="update KHXX set n4=?,n5=?,n6=?";
			ls_sql+=" where n0='"+n0+"' and n10='"+n10+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setString(1,n4);
			ps1.setString(2,n5);
			ps1.setString(3,n6);
			ps1.executeUpdate();
			ps1.close();
		}
	}
	rs.close();
	ps.close();


	sql="select n0,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10";
	sql+=" from KHXX";
	sql+=" order by n0";
//	out.println("<BR>sql="+sql);
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	while (rs.next())//用户存在
	{
		n0=rs.getString("n0");//
		n1=rs.getString("n1");//khxm客户姓名
		n2=rs.getString("n2");//lxfs联系方式
		n3=rs.getString("n3");//qye签约额

		n4=rs.getString("n4");//qyrq签约日
		n5=rs.getString("n5");//sjkgrq开工日
		n6=rs.getString("n6");//sjjgrq竣工日


		n7=rs.getString("n7");//sjs设计师
		n8=rs.getString("n8");//sgd工长
		n9=rs.getString("n9");//zjxm质检
		n10=rs.getString("n10");//fwdz施工地址

		khxm=n1;
		lxfs=n2;
		sjs=n7;
		zjxm=n9;
		fwdz=n10;
		bz="档案号："+n0;


		int pos=0;
		String ls="";
		if (n4!=null)
		{
			n4=n4.trim();
			pos=n4.indexOf(".");
			ls="2003-"+n4.substring(0,pos)+"-"+n4.substring(pos+1);
			qyrq=java.sql.Date.valueOf(ls);
		}
		if (n5!=null)
		{
			n5=n5.trim();
			pos=n5.indexOf(".");
			ls="2003-"+n5.substring(0,pos)+"-"+n5.substring(pos+1);
			sjkgrq=java.sql.Date.valueOf(ls);
		}
		if (n6!=null)
		{
			n6=n6.trim();
			pos=n6.indexOf(".");
			ls="2003-"+n6.substring(0,pos)+"-"+n6.substring(pos+1);
			sjjgrq=java.sql.Date.valueOf(ls);
		}
		
		if (n8!=null)//施工队
		{
			sql="select dwbh";
			sql+=" from sq_dwxx";
			sql+=" where dwmc='"+n8+"' ";
	//		out.println("<BR>sql="+sql);
			ps2=conn.prepareStatement(sql);
			rs2=ps2.executeQuery();
			if (rs2.next())//用户存在
			{
				sgd=rs2.getString("dwbh");
			}
			else{
				bz+="；施工队："+n8;
				out.println("<BR>施工队不存在,n0="+n0+";  n8="+n8+";bz="+bz);
				sgd=null;
			}
			rs2.close();
			ps2.close();

		}

		if (n0!=null)//签约店面
		{
			n0=n0.substring(0,1);
			sql="select dwbh";
			sql+=" from sq_dwxx";
			sql+=" where dwjc='"+n0+"' ";
	//		out.println("<BR>sql="+sql);
			ps2=conn.prepareStatement(sql);
			rs2=ps2.executeQuery();
			if (rs2.next())//用户存在
			{
				dwbh=rs2.getString("dwbh");
			}
			else{
				out.println("<BR>签约店面不存在,n0="+n0+";bz="+bz);
				dwbh=null;
			}
			rs2.close();
			ps2.close();

		}


		if (n3!=null && !n3.equals(""))//签约额
		{
			qye=Double.parseDouble(n3);
		}
		else{
			qye=0;
		}

		//客户编号
		int xh=0;
		ls_sql="select NVL(max(TO_NUMBER(khbh))+1,1)";
		ls_sql+=" from  crm_khxx";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery(ls_sql);
		if (rs2.next())
		{
			xh=rs2.getInt(1);
		}
		ps2.close();
		rs2.close();
		khbh=cf.addZero(xh,7);


		ls_sql="insert into crm_khxx(khbh,khxm,lxfs,fwdz,sjs,zjxm,sgd,qye,qyrq,sjkgrq,sjjgrq,pdclzt,hdbz,gcjdbm,wgbz,ybjbz,zt,khlxbm,tsbz,tkbz,lrr,lrsj,bz,dwbh)";
		ls_sql+=" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,khbh);
		ps1.setString(2,khxm);
		ps1.setString(3,lxfs);
		ps1.setString(4,fwdz);
		ps1.setString(5,sjs);
		ps1.setString(6,zjxm);
		ps1.setString(7,sgd);
		ps1.setDouble(8,qye);
		ps1.setDate(9,qyrq);
		ps1.setDate(10,sjkgrq);
		ps1.setDate(11,sjjgrq);

		ps1.setString(12,pdclzt);
		ps1.setString(13,hdbz);
		ps1.setString(14,gcjdbm);
		ps1.setString(15,wgbz);
		ps1.setString(16,ybjbz);
		ps1.setString(17,zt);
		ps1.setString(18,khlxbm);
		ps1.setString(19,tsbz);
		ps1.setString(20,tkbz);
		ps1.setString(21,lrr);
		ps1.setDate(22,lrsj);
		ps1.setString(23,bz);
		ps1.setString(24,dwbh);

		ps1.executeUpdate();
		ps1.close();

	}
	
	out.println("<BR>倒入数据成功！");
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.println("<BR>n0="+n0+";n1="+n1+";n2="+n2+";n3="+n3+";n4="+n4+";n5="+n5+";n6="+n6+";n7="+n7+";n8="+n8+";n9="+n9+";n10="+n10);
	out.println("<BR>ls_sql="+ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}

%>

