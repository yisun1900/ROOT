<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>���������ϸ </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;


String ddbh =null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String ls=null;

try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	ddbh = up.getParameter("ddbh");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\foxpro\\IMP_"+yhdlm+".txt";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer);
	f.close();
%>


<%
	java.io.LineNumberReader fis= null;
	fis= new java.io.LineNumberReader(new java.io.FileReader(filename));
	String lineStr="";

	conn=cf.getConnection();    //�õ�����
	
	conn.setAutoCommit(false);

	ls_sql="delete from jc_yfcgdtmx where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	ls_sql="delete from jc_yfjgyqsm where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	ls_sql="delete from jc_yfsjbf where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	ls_sql="delete from jc_yfdgsp where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	

	//������һ���ڶ�������
	int rownum=0;
	int lsInt=0;
	lineStr=fis.readLine();
	rownum++;
	lineStr=fis.readLine();
	rownum++;

	//����Ϊ��һҳ����Ϣ��������������������������������������������������
	lineStr=fis.readLine();
	rownum++;
	lsInt=Integer.parseInt(lineStr);
	for (int i=0;i<lsInt ;i++ )
	{
		lineStr=fis.readLine();
		rownum++;

		int jlh=0;
		String lb=null;
		int xuhao=0;
		String mc=null;
		String xh=null;
		double cd=0;
		double kd=0;
		double gd=0;
		double sl=0;
		String dw=null;
		double dj=0;
		double je=0;
		double zkl=0;
		double zhj=0;
		String mbys=null;
		String note=null;

		int start=0;
		int end=0;
		end=lineStr.indexOf("^");
		lb=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			xuhao=Integer.parseInt(ls);
		}
		else{
			xuhao=0;
		}

		end=lineStr.indexOf("^",start);
		mc=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		xh=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			cd=Double.parseDouble(ls);
		}
		else{
			cd=0;
		}

		end=lineStr.indexOf("^",start);
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			kd=Double.parseDouble(ls);
		}
		else{
			kd=0;
		}

		end=lineStr.indexOf("^",start);
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			gd=Double.parseDouble(ls);
		}
		else{
			gd=0;
		}

		end=lineStr.indexOf("^",start);
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			sl=Double.parseDouble(ls);
		}
		else{
			sl=0;
		}

		end=lineStr.indexOf("^",start);
		dw=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			dj=Double.parseDouble(ls);
		}
		else{
			dj=0;
		}

		end=lineStr.indexOf("^",start);
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			zkl=Double.parseDouble(ls);
		}
		else{
			zkl=0;
		}


		end=lineStr.indexOf("^",start);
		mbys=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		note=lineStr.substring(start,end);
		start=end+1;

		je=sl*dj;
		zhj=je*zkl;


		ls_sql=" select NVL(max(jlh),0) from jc_yfcgdtmx " ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			jlh = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		jlh++;

		ls_sql="insert into jc_yfcgdtmx (jlh,ddbh,lb,xuhao,mc,xh,cd,kd,gd,sl,dw,dj,je,zkl,zhj,mbys,note)";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,jlh);
		ps.setString(2,ddbh);
		ps.setString(3,lb);
		ps.setInt(4,xuhao);
		ps.setString(5,mc);
		ps.setString(6,xh);
		ps.setDouble(7,cd);
		ps.setDouble(8,kd);
		ps.setDouble(9,gd);
		ps.setDouble(10,sl);
		ps.setString(11,dw);
		ps.setDouble(12,dj);
		ps.setDouble(13,je);
		ps.setDouble(14,zkl);
		ps.setDouble(15,zhj);
		ps.setString(16,mbys);
		ps.setString(17,note);
		ps.executeUpdate();
		ps.close();

	}
	//��һҳ����Ϣ����������������������������������������������������������������������



	//����Ϊ�ڶ�ҳ����Ϣ��������������������������������������������������
	//����Ϊ8��9��10���е�����
	int jlh=0;
	String gtcl=null;
	String gtqfbys=null;
	String gtfbys=null;
	String tmcl=null;
	String tmys=null;
	String qdssy=null;
	String hdssy=null;
	String tmcly=null;
	String tmysy=null;
	String qdssyy=null;
	String hdssyy=null;

	lineStr=fis.readLine();
	rownum++;
//	out.println("��8��:"+lineStr);

	int start=0;
	int end=0;
	end=lineStr.indexOf("^");
	gtcl=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	gtqfbys=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	gtfbys=lineStr.substring(start,end);
	start=end+1;

//	out.println("��9��");
	lineStr=fis.readLine();
	rownum++;
	start=0;
	end=0;

	end=lineStr.indexOf("^");
	tmcl=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	tmys=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	qdssy=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	hdssy=lineStr.substring(start,end);
	start=end+1;

//	out.println("��10��");
	lineStr=fis.readLine();
	rownum++;
	start=0;
	end=0;

	end=lineStr.indexOf("^");
	tmcly=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	tmysy=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	qdssyy=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	hdssyy=lineStr.substring(start,end);
	start=end+1;
	
	//����Ϊ11,12����ǰ��������ݣ������ߡ�������Ϣ
	String dxcl=null;
	String dxyse=null;
	String dxys=null;
	String dgxcl=null;
	String dgxyse=null;
	String dgxys=null;

	lineStr=fis.readLine();
	rownum++;
	start=0;
	end=0;

	end=lineStr.indexOf("^");
	dxcl=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	dxyse=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	dxys=lineStr.substring(start,end);
	start=end+1;

	lineStr=fis.readLine();
	rownum++;
	start=0;
	end=0;

	end=lineStr.indexOf("^");
	dgxcl=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	dgxyse=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	dgxys=lineStr.substring(start,end);
	start=end+1;

	//����Ϊ���ܲ��ϡ���ɫ
	String bgcl=null;
	String bgys=null;

	lineStr=fis.readLine();
	rownum++;
	start=0;
	end=0;

	end=lineStr.indexOf("^");
	bgcl=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	bgys=lineStr.substring(start,end);
	start=end+1;

	//����Ϊ������ʽI��ʽII
	String lmysy=null;
	String lmyse=null;

	lineStr=fis.readLine();
	rownum++;
	start=0;
	end=0;

//	out.println(lineStr);

	end=lineStr.indexOf("^");
	lmysy=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	lmysy=lmysy+lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	lmyse=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	lmyse=lmyse+lineStr.substring(start,end);
	start=end+1;

	//����Ϊ��Ƕ����I��II
	String xqbly=null;
	String xqble=null;

	lineStr=fis.readLine();
	rownum++;
	start=0;
	end=0;

	end=lineStr.indexOf("^");
	xqbly=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	xqble=lineStr.substring(start,end);
	start=end+1;

	//�Ű��ʽI��II��III
	String mbyks=null;
	String mbyys=null;
	String mbygy=null;
	String mbyfb=null;

	lineStr=fis.readLine();
	rownum++;
	start=0;
	end=0;

	end=lineStr.indexOf("^");
	mbyks=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	mbyys=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	mbygy=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	mbyfb=lineStr.substring(start,end);
	start=end+1;

	String mbeks=null;
	String mbeys=null;
	String mbegy=null;
	String mbefb=null;

	lineStr=fis.readLine();
	rownum++;
	start=0;
	end=0;

	end=lineStr.indexOf("^");
	mbeks=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	mbeys=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	mbegy=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	mbefb=lineStr.substring(start,end);
	start=end+1;

	String mbsks=null;
	String mbsys=null;
	String mbsgy=null;
	String mbsfb=null;

	lineStr=fis.readLine();
	rownum++;
	start=0;
	end=0;

	end=lineStr.indexOf("^");
	mbsks=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	mbsys=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	mbsgy=lineStr.substring(start,end);
	start=end+1;

	end=lineStr.indexOf("^",start);
	mbsfb=lineStr.substring(start,end);
	start=end+1;

	ls_sql=" select NVL(max(jlh),0) from jc_yfjgyqsm " ;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		jlh = rs.getInt(1);			    
	}
	rs.close();
	ps.close();

	jlh++;

	ls_sql="insert into jc_yfjgyqsm (jlh,ddbh,gtcl,gtqfbys,gtfbys,tmcl,tmys,qdssy,hdssy,tmcly";
	ls_sql+=" ,tmysy,qdssyy,hdssyy,dxcl,dxyse,dxys,dgxcl,dgxyse,dgxys,bgcl ";
	ls_sql+=" ,bgys,lmysy,lmyse,xqbly,xqble,mbyks,mbyys,mbygy,mbyfb,mbeks   ,mbeys,mbegy,mbefb,mbsks,mbsys,mbsgy,mbsfb)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,jlh);
	ps.setString(2,ddbh);
	ps.setString(3,gtcl);
	ps.setString(4,gtqfbys);
	ps.setString(5,gtfbys);
	ps.setString(6,tmcl);
	ps.setString(7,tmys);
	ps.setString(8,qdssy);
	ps.setString(9,hdssy);
	ps.setString(10,tmcly);

	ps.setString(11,tmysy);
	ps.setString(12,qdssyy);
	ps.setString(13,hdssyy);
	ps.setString(14,dxcl);
	ps.setString(15,dxyse);
	ps.setString(16,dxys);
	ps.setString(17,dgxcl);
	ps.setString(18,dgxyse);
	ps.setString(19,dgxys);
	ps.setString(20,bgcl);

	ps.setString(21,bgys);
	ps.setString(22,lmysy);
	ps.setString(23,lmyse);
	ps.setString(24,xqbly);
	ps.setString(25,xqble);
	ps.setString(26,mbyks);
	ps.setString(27,mbyys);
	ps.setString(28,mbygy);
	ps.setString(29,mbyfb);
	ps.setString(30,mbeks);

	ps.setString(31,mbeys);
	ps.setString(32,mbegy);
	ps.setString(33,mbefb);
	ps.setString(34,mbsks);
	ps.setString(35,mbsys);
	ps.setString(36,mbsgy);
	ps.setString(37,mbsfb);

	ps.executeUpdate();
	ps.close();
	
	//������Ʒ�������������ݡ�"����"���ⲿ�����ݿ�ʼ��ǣ�"3"��ʾ����	
	lineStr=fis.readLine();
	rownum++;

	start=0;
	end=0;
	end=lineStr.indexOf("^");
	start=end+1;

	end=lineStr.indexOf("^",start);
	ls=lineStr.substring(start,end);
	lsInt=Integer.parseInt(ls);
	for (int i=0;i<lsInt ;i++ )
	{
		lineStr=fis.readLine();
		rownum++;

		int xuhao=0;
		String bh=null;
		String mc=null;
		String xh=null;
		String gg=null;
		double sl=0;
		String dw=null;
		String sflb=null;
		double dj=0;
		double je=0;
		double zkl=0;
		double zhj=0;
		String note=null;

		start=0;
		end=0;
		end=lineStr.indexOf("^");
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			xuhao=Integer.parseInt(ls);
		}
		else{
			xuhao=0;
		}

		end=lineStr.indexOf("^",start);
		bh=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		mc=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		xh=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		gg=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			sl=Double.parseDouble(ls);
		}
		else{
			sl=0;
		}

		end=lineStr.indexOf("^",start);
		dw=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		sflb=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			dj=Double.parseDouble(ls);
		}
		else{
			dj=0;
		}

		end=lineStr.indexOf("^",start);
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			zkl=Double.parseDouble(ls);
		}
		else{
			zkl=0;
		}

		end=lineStr.indexOf("^",start);
		note=lineStr.substring(start,end);
		start=end+1;

		je=sl*dj;
		zhj=je*zkl;

		ls_sql=" select NVL(max(jlh),0) from jc_yfdgsp " ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			jlh = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		jlh++;

		ls_sql="insert into jc_yfdgsp (jlh,ddbh,xuhao,bh,mc,xh,gg,sl,dw,sflb,dj,je,zkl,zhj,note)";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,jlh);
		ps.setString(2,ddbh);
		ps.setInt(3,xuhao);
		ps.setString(4,bh);
		ps.setString(5,mc);
		ps.setString(6,xh);
		ps.setString(7,gg);
		ps.setDouble(8,sl);
		ps.setString(9,dw);
		ps.setString(10,sflb);
		ps.setDouble(11,dj);
		ps.setDouble(12,je);
		ps.setDouble(13,zkl);
		ps.setDouble(14,zhj);
		ps.setString(15,note);
		ps.executeUpdate();
		ps.close();

	}

	//�������á���������Ӳ������ݣ�"��������"�����ݿ�ʼ��ǣ�4��ʾ����	
	lineStr=fis.readLine();
	rownum++;

	start=0;
	end=0;
	end=lineStr.indexOf("^");
	start=end+1;

	end=lineStr.indexOf("^",start);
	ls=lineStr.substring(start,end);
	lsInt=Integer.parseInt(ls);
	for (int i=0;i<lsInt ;i++ )
	{
		lineStr=fis.readLine();
		rownum++;

		int xuhao=0;
		String bh=null;
		String mc=null;
		String xh=null;
		String gg=null;
		double sl=0;
		String dw=null;
		String sflb=null;
		double dj=0;
		double je=0;
		double zkl=0;
		double zhj=0;
		String note=null;

		start=0;
		end=0;
		end=lineStr.indexOf("^");
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			xuhao=Integer.parseInt(ls);
		}
		else{
			xuhao=0;
		}

		end=lineStr.indexOf("^",start);
		bh=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		mc=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		xh=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		gg=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			sl=Double.parseDouble(ls);
		}
		else{
			sl=0;
		}

		end=lineStr.indexOf("^",start);
		dw=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		sflb=lineStr.substring(start,end);
		start=end+1;

		end=lineStr.indexOf("^",start);
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			dj=Double.parseDouble(ls);
		}
		else{
			dj=0;
		}

		end=lineStr.indexOf("^",start);
		ls=lineStr.substring(start,end);
		start=end+1;
		if (!ls.equals(""))
		{
			zkl=Double.parseDouble(ls);
		}
		else{
			zkl=0;
		}

		end=lineStr.indexOf("^",start);
		note=lineStr.substring(start,end);
		start=end+1;

		je=sl*dj;
		zhj=je*zkl;

		ls_sql=" select NVL(max(jlh),0) from jc_yfsjbf " ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			jlh = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		jlh++;

		ls_sql="insert into jc_yfsjbf (jlh,ddbh,xuhao,bh,mc,xh,gg,sl,dw,sflb,dj,je,zkl,zhj,note)";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,jlh);
		ps.setString(2,ddbh);
		ps.setInt(3,xuhao);
		ps.setString(4,bh);
		ps.setString(5,mc);
		ps.setString(6,xh);
		ps.setString(7,gg);
		ps.setDouble(8,sl);
		ps.setString(9,dw);
		ps.setString(10,sflb);
		ps.setDouble(11,dj);
		ps.setDouble(12,je);
		ps.setDouble(13,zkl);
		ps.setDouble(14,zhj);
		ps.setString(15,note);
		ps.executeUpdate();
		ps.close();

	}
	
	
	//�ڶ�ҳ����Ϣ����������������������������������������������������������������������


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�������ݳɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ�ܣ�Exception:" + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) conn.close();
		f.close();
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 

</body>
</html>

