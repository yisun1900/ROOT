<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


<%  
String sfxmbm = request.getParameter("sfxmbm");//������������
String dqbm = request.getParameter("dqbm");//������������

if (sfxmbm==null)
{
	return ;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String sflx=null;
String sflxmc=null;
String bz=null;
double gdje=0;
String jldw=null;

try {
	conn=cf.getConnection();

	ls_sql="select sflx,DECODE(sflx,'1','����ֱ�ӷѰٷֱȣ����ɸģ�','A','����ֱ�ӷѰٷֱȣ��ɸģ�','2','�̶����(�ɸ�)','3','˰��','4','�̶����(���ɸ�)','5','�����','6','���ķѰٷֱ�','7','���̼����ķѰٷֱ�') sflxmc,gdje,bz";
	ls_sql+=" ,jldw   ";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where sfxmbm='"+sfxmbm+"' and dqbm='"+dqbm+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sflx=rs.getString(1);
		sflxmc=rs.getString(2);
		gdje=rs.getDouble(3);
		bz=cf.fillNull(rs.getString(4));
		jldw=cf.fillNull(rs.getString(5));

		if (sflx.equals("2"))//2���̶����(���ʦ�ɸ�)
		{
			%>
				parent.main.insertform.sflx.value="<%=sflxmc%>";
				parent.main.insertform.bz.value="<%=bz%>";
				parent.main.insertform.jldw.value="<%=jldw%>";
				parent.main.insertform.bzdj.value="<%=gdje%>";
				parent.main.insertform.dj.value="<%=gdje%>";
				parent.main.insertform.dj.readOnly=false;
				parent.main.insertform.sl.readOnly=false;
				parent.main.getJe(parent.main.insertform);
			<%
		}
		else if (sflx.equals("4"))//4���̶����(���ʦ���ɸ�)
		{
			%>
				parent.main.insertform.sflx.value="<%=sflxmc%>";
				parent.main.insertform.bz.value="<%=bz%>";
				parent.main.insertform.jldw.value="<%=jldw%>";
				parent.main.insertform.bzdj.value="<%=gdje%>";
				parent.main.insertform.dj.value="<%=gdje%>";
				parent.main.insertform.dj.readOnly=true;
				parent.main.insertform.sl.readOnly=false;
				parent.main.getJe(parent.main.insertform);
			<%
		}
		else{
			%>
				parent.main.insertform.sflx.value="<%=sflxmc%>";
				parent.main.insertform.bz.value="<%=bz%>";
				parent.main.insertform.jldw.value="<%=jldw%>";
				parent.main.insertform.bzdj.value="";
				parent.main.insertform.dj.value="����¼�룬�Զ�����";
				parent.main.insertform.dj.readOnly=true;
				parent.main.insertform.sl.value="1";
				parent.main.insertform.sl.readOnly=true;
				parent.main.getJe(parent.main.insertform);
			<%
		}


	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
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



//-->
</SCRIPT>
