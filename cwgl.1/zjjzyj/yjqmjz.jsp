<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,java.text.*' %>
<jsp:useBean id="cf" scope="request" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<HTML>
<HEAD>
<TITLE>��ĩ��ת</TITLE>
</HEAD>

<BODY bgColor=#ffffff>

<% 

String yhmc=(String)session.getAttribute("yhmc");

String jzrq=null;
String[] khbh=request.getParameterValues("khbh");
if (khbh==null)
{
	out.println("δѡ���κ�����");
	return;
}


//�������ݿ�
Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;

String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="select max(jzrq)";
	ls_sql+="  from cw_qmjz";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		jzrq=cf.fillNull(rs.getDate(1)); 
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		ls_sql="insert into cw_qmjzmx (jzrq              ,khbh,zt,khxm,hth,sjs,wdzgce,zkl,zjxzkl,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,zqwjrzjx,zhwjrzjx,wjrzjxsm,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,cxhdbmsc,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,fjje,gsfje,rzsc,ywy,fgsbh,dwbh )";
		ls_sql+=" select TO_DATE('"+jzrq+"','YYYY-MM-DD'),khbh,zt,khxm,hth,sjs,wdzgce,zkl,zjxzkl,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,zqwjrzjx,zhwjrzjx,wjrzjxsm,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,cxhdbmsc,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,fjje,gsfje,rzsc,ywy,fgsbh,dwbh ";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		ls_sql=" update crm_khxx";
		ls_sql+=" set yjjzsj=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ls_sql+=" ,tdkhzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ls_sql+=" ,tdqyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ls_sql+=" where jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("��ת�ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch(Exception e){
	conn.rollback();
	out.print("���ݿ����ʧ��"+e);
	out.print("<BR>ls_sql="+ls_sql);
}
finally{
	conn.setAutoCommit(true);

	try{
		if (rs!= null) rs.close();  
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn);  
	}
	catch (Exception e){ 
		out.println("�ر����ӷ�������,Exception:"+e.getMessage()); 
	} 
}
%>  

</BODY>
</html>




