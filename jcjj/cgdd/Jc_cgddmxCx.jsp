<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="jcjj" scope="page" class="jcjj.Jcjj"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>


<%  
String cgbm = request.getParameter("cgbm");//�������
String dgjs = request.getParameter("dgjs");//�������
String dggd = request.getParameter("dggd");//����߶�
String tgjs = request.getParameter("tgjs");//�ع����
String tggd = request.getParameter("tggd");//�ع�߶�


if (cgbm==null)
{
	return ;
}
if (dgjs==null || dgjs.equals(""))
{
	dgjs="0";
}
if (dggd==null || dggd.equals(""))
{
	dggd="0";
}
if (tgjs==null || tgjs.equals(""))
{
	tgjs="0";
}
if (tggd==null || tggd.equals(""))
{
	tggd="0";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;

double dgdj=0;
double tgdj=0;
String dgjsbm=null;
String dggdbm=null;
String tgjsbm=null;
String tggdbm=null;

try {
	conn=cf.getConnection();    //�õ�����

	if (!dgjs.equals("0") && !dggd.equals("0"))
	{
		//��ѯ����������������
		ls_sql = "select dgjsbm";
		ls_sql += " from jdm_dgjsbm";
		ls_sql += " where dy<"+dgjs+" and xydy>="+dgjs;
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())                            
		{
			dgjsbm=rs.getString(1);

		}
		rs.close();
		ps.close();
		//��ѯ������߶��������
		ls_sql = "select dggdbm";
		ls_sql += " from jdm_dggdbm";
		ls_sql += " where dy<"+dggd+" and xydy>="+dggd;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())                            
		{
			dggdbm=rs.getString(1);

		}
		rs.close();
		ps.close();

		//��ѯ������۸����ȡ���ۼ�
		ls_sql = "select lsj";
		ls_sql += " from jc_dgjgb";
		ls_sql += " where cgbm='"+cgbm+"' and dggdbm='"+dggdbm+"' and dgjsbm='"+dgjsbm+"'";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())                            
		{
			dgdj=rs.getDouble("lsj");
		}
		rs.close();
		ps.close();
	}

	if (!tgjs.equals("0") && !tggd.equals("0"))
	{
		//��ѯ���ع�����������
		ls_sql = "select tgjsbm";
		ls_sql += " from jdm_tgjsbm";
		ls_sql += " where dy<"+tgjs+" and xydy>="+tgjs;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())                            
		{
			tgjsbm=rs.getString(1);

		}
		rs.close();
		ps.close();
		//��ѯ���ع�߶��������
		ls_sql = "select tggdbm";
		ls_sql += " from jdm_tggdbm";
		ls_sql += " where dy<"+tggd+" and xydy>="+tggd;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())                            
		{
			tggdbm=rs.getString(1);

		}
		rs.close();
		ps.close();

		//��ѯ���ع�۸����ȡ���ۼ�
		ls_sql = "select lsj";
		ls_sql += " from jc_tgjgb";
		ls_sql += " where cgbm='"+cgbm+"' and tggdbm='"+tggdbm+"' and tgjsbm='"+tgjsbm+"'";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())                            
		{
			tgdj=rs.getDouble("lsj");
		}
		rs.close();
		ps.close();

	}

	if (dgdj!=0)//���۲�Ϊ0
	{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.dgdj.value="<%=cf.doubleTrimStr(dgdj,2)%>";
		//-->
		</SCRIPT>
		<%
	}
	else{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.dgdj.value="";
//		alert("���󣡼۸���Ϣ��������δ�鵽�۸���Ϣ");
		//-->
		</SCRIPT>
		<%
	}

	if (tgdj!=0)//���۲�Ϊ0
	{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.tgdj.value="<%=cf.doubleTrimStr(tgdj,2)%>";
		//-->
		</SCRIPT>
		<%
	}
	else{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.tgdj.value="";
//		alert("���󣡼۸���Ϣ��������δ�鵽�۸���Ϣ");
		//-->
		</SCRIPT>
		<%
	}
}
catch(Exception e){
	out.print("��������: " + e);
}
	finally{
		try{
			if (rs != null) rs.close(); 
			if (ps!= null) ps.close(); 
			if (conn!=null) cf.close(conn);    //�ͷ�����
		}
		catch (Exception e){}
	}
%>


