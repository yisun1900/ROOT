<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String getdwbh=(String)session.getAttribute("dwbh");

String[] hth =request.getParameterValues("hth");
String[] jkjestr =request.getParameterValues("jkje");
String fgsbh=request.getParameter("fgsbh");

String rootPath=getServletContext().getRealPath("");
%>

<%
String ls_sql=null;
Connection conn1  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;


int count=0;
	


java.sql.Date sksj=cf.getDate();


try {

	conn1=cf.getConnection();    //�õ�����

	conn1.setAutoCommit(false);

	int row=0;
	double alljkje=0;
	for (int i=0;i<hth.length ;i++ )
	{
		//���ڲ���
		double jkje=0;
		if (jkjestr[i]!=null && !jkjestr[i].trim().equals(""))
		{
			try{
				jkje=Double.parseDouble(jkjestr[i].trim());
			}
			catch (Exception e) {
				conn1.rollback();
				out.print("���["+i+"]����[���Ͽ�]�����֣�" + jkjestr[i]);
				return;
			}
		}

		alljkje+=jkje;

		String khbh=null;//�ͻ����
		String khxm=null;//�ͻ�����
		String sjs=null;//���ʦ
		String sjsbh=null;//��������ұ��
		String dwbh=null;//�������
		String sgd=null;
		String sgdmc=null;

		ls_sql=" select khbh,khxm,sjs,sjsbh,dwbh,crm_khxx.sgd,sgdmc" ;
		ls_sql+=" from crm_khxx,sq_sgd " ;
		ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd and hth='"+hth[i]+"' and fgsbh='"+fgsbh+"'";
		ps1= conn1.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{         
			khbh = rs1.getString("khbh").trim();			    
			khxm = rs1.getString("khxm");			    
			sjs = rs1.getString("sjs");			    
			sjsbh = rs1.getString("sjsbh");			    
			dwbh = rs1.getString("dwbh");			    
			sgd = rs1.getString("sgd");			    
			sgdmc = rs1.getString("sgdmc");			    
		}
		else{
			conn1.rollback();
			out.println("<BR>���󣡺�ͬ��["+hth[i]+"]������");
			return;
		}
		rs1.close();
		ps1.close();

		
		//����ERP++++++++++++++++++ 

		count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  cw_gdjkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and jklx='2'";//1������ѣ�2�����Ͽ3�����ڲ��9������
		ps1= conn1.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)
		{
			conn1.rollback();
			out.println("����[���Ͽ�]�Ѵ���:"+khbh);
			return;
		}

		
		String gdjkjlh=null;
		ls_sql="select NVL(max(substr(gdjkjlh,8,2)),0)";
		ls_sql+=" from  cw_gdjkjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn1.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		gdjkjlh=khbh+cf.addZero(count+1,2);
		
		ls_sql="insert into cw_gdjkjl ( gdjkjlh,khbh,jklx,jkje,jkblr,jkblsj,lrr,lrsj,lrbm,bz,gdjsjd,scbz,czlx ) ";
		ls_sql+=" values('"+gdjkjlh+"','"+khbh+"','2',"+jkje+",'"+yhmc+"',TRUNC(SYSDATE),'"+yhmc+"',SYSDATE,'"+getdwbh+"','����','0','N','3' ) ";//1��¼�룻2��������3������
		ps1= conn1.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		//����ERP------------------ 

		row++;

	}


	conn1.commit();

	%>
	<P>�ɹ�����ERP���������¼����<%=row%>
	<%

}
catch (Exception e) {
	conn1.rollback();

	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn1.setAutoCommit(true);

	try{
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn1 != null) cf.close(conn1);    //�ͷ�����
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
