<%@ page contentType="text/html;charset=GBK" %>
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
String khbh = request.getParameter("khbh");
String fkcs = request.getParameter("fkcs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {

	conn=cf.getConnection();

	if (fkcs!=null)
	{
		String fgsbh=null;
		double wdzgce=0;
		double qye=0;
		double sjf=0;
		double glf=0;
		double suijin=0;
		double zqguanlif=0;
		double guanlif=0;
		double zqwjrqyexm=0;
		double zhwjrqyexm=0;

		double zjxje=0;
		double zhzjxje=0;
		double zqzjxguanlif=0;
		double zjxguanlif=0;
		double zjxsuijin=0;
		double sfke=0;
		double zjxssk=0;

		ls_sql="select fgsbh,wdzgce,qye,sjf,glf,suijin,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm  ,zjxje,zhzjxje,zqzjxguanlif,zjxguanlif,zjxsuijin  ,sfke,zjxssk";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fgsbh=cf.fillNull(rs.getString("fgsbh"));
			wdzgce=rs.getDouble("wdzgce");
			qye=rs.getDouble("qye");
			sjf=rs.getDouble("sjf");
			glf=rs.getDouble("glf");
			suijin=rs.getDouble("suijin");//˰��
			zqguanlif=rs.getDouble("zqguanlif");//��ǰ�����
			guanlif=rs.getDouble("guanlif");//�ۺ�����
			zqwjrqyexm=rs.getDouble("zqwjrqyexm");//��ǰ�����շ�
			zhwjrqyexm=rs.getDouble("zhwjrqyexm");//�ۺ������շ�

			zjxje=rs.getDouble("zjxje");
			zhzjxje=rs.getDouble("zhzjxje");
			zqzjxguanlif=rs.getDouble("zqzjxguanlif");//��ǰ����������
			zjxguanlif=rs.getDouble("zjxguanlif");//�ۺ�����������
			zjxsuijin=rs.getDouble("zjxsuijin");//������˰��

			sfke=rs.getDouble("sfke");
			zjxssk=rs.getDouble("zjxssk");
		}
		rs.close();
		ps.close();

		String lx=null;
		String sfbhglf=null;
		String sfbhsj=null;
		double yfkje=0;
		double bqfkbl=0;
		double yfkbl=0;
		ls_sql="select lx,sfbhglf,sfbhsj,bqfkbl,yfkbl ";
		ls_sql+=" from  cw_fkfamx,cw_khfkfa";
		ls_sql+=" where cw_fkfamx.fkfabm=cw_khfkfa.fkfabm and cw_khfkfa.khbh='"+khbh+"' and fkcs="+fkcs;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			lx=cf.fillNull(rs.getString("lx"));//����
			sfbhglf=cf.fillNull(rs.getString("sfbhglf"));//�Ƿ���������
			sfbhsj=cf.fillNull(rs.getString("sfbhsj"));//�Ƿ����˰��
			bqfkbl=rs.getDouble("bqfkbl");//�����տ����
			//out.println(bqfkbl);
			yfkbl=rs.getDouble("yfkbl");//�ۼ��տ����
		}
		rs.close();
		ps.close();

		wdzgce=wdzgce+zqwjrqyexm;
		qye=qye+zhwjrqyexm;

		if (sfbhglf.equals("Y"))//N����������Y������
		{
			wdzgce+=zqguanlif;
			qye+=guanlif;
			zjxje+=zqzjxguanlif;
			zhzjxje+=zjxguanlif;
		}
		if (sfbhsj.equals("Y"))//N����������Y������
		{
			wdzgce+=suijin;
			qye+=suijin;
			zjxje+=zjxsuijin;
			zhzjxje+=zjxsuijin;
		}

/*
		1������ǰ�տ�(����������)��
		2������ǰ�տ��������һ����ȡ��
		3������ǰ�տ��������ִ���ȡ��

		6�����ۺ��տ�(����������)��
		7�����ۺ��տ��������һ����ȡ��
		8�����ۺ��տ��������ִ���ȡ��

		A����ǰ�����
		B���ۺ�������
*/		

		/*if (lx.equals("1"))
		{
			yfkje=wdzgce*yfkbl/100.0-sfke;//��ǰ�ۡ��ۼ��տ���ʣ���װʵ�տ��
		}
		else if (lx.equals("2"))
		{
			yfkje=(wdzgce*yfkbl/100.0+zjxje)-sfke;//����ǰ�ۡ��ۼ��տ���ʣ���ǰ���������װʵ�տ��
		}
		else if (lx.equals("3"))
		{
			yfkje=(wdzgce+zjxje)*yfkbl/100.0-sfke;//����ǰ�ۣ���ǰ��������ۼ��տ���ʣ���װʵ�տ��
		}
		else if (lx.equals("6"))
		{
			yfkje=qye*yfkbl/100.0-sfke;//�ۺ�ۡ��ۼ��տ���ʣ���װʵ�տ��
		}
		else if (lx.equals("7"))
		{
			yfkje=(qye*yfkbl/100.0+zhzjxje)-sfke;//���ۺ�ۡ��ۼ��տ���ʣ��ۺ����������װʵ�տ��
		}
		else if (lx.equals("8"))
		{
			yfkje=(qye+zhzjxje)*yfkbl/100.0-sfke;//���ۺ�ۣ��ۺ���������ۼ��տ���ʣ���װʵ�տ��
		}

		else if (lx.equals("A"))
		{
			yfkje=zjxje-zjxssk;//��ǰ�����������ʵ�տ�
		}
		else if (lx.equals("B"))
		{
			yfkje=zhzjxje-zjxssk;//�ۺ������������ʵ�տ�
		}


		yfkje=cf.doubleTrim(yfkje);
		*/
       if (lx.equals("1"))
		{
			yfkje=wdzgce*bqfkbl/100.0;//��ǰ�ۡ��ۼ��տ���ʣ���װʵ�տ��
		}
		else if (lx.equals("2"))
		{
			yfkje=(wdzgce*bqfkbl/100.0+zjxje);//����ǰ�ۡ��ۼ��տ���ʣ���ǰ���������װʵ�տ��
		}
		else if (lx.equals("3"))
		{
			yfkje=(wdzgce+zjxje)*bqfkbl/100.0;//����ǰ�ۣ���ǰ��������ۼ��տ���ʣ���װʵ�տ��
		}
		else if (lx.equals("6"))
		{
			yfkje=qye*bqfkbl/100.0;//�ۺ�ۡ��ۼ��տ���ʣ���װʵ�տ��
		}
		else if (lx.equals("7"))
		{
			yfkje=(qye*bqfkbl/100.0+zhzjxje);//���ۺ�ۡ��ۼ��տ���ʣ��ۺ����������װʵ�տ��
		}
		else if (lx.equals("8"))
		{
			yfkje=(qye+zhzjxje)*bqfkbl/100.0;//���ۺ�ۣ��ۺ���������ۼ��տ���ʣ���װʵ�տ��
		}

		else if (lx.equals("A"))
		{
			yfkje=zjxje-zjxssk;//��ǰ�����������ʵ�տ�
		}
		else if (lx.equals("B"))
		{
			yfkje=zhzjxje-zjxssk;//�ۺ������������ʵ�տ�
		}


		yfkje=cf.doubleTrim(yfkje);

		%>
			//parent.main.insertform.yfkbl.value="<%=yfkbl%>";
			parent.main.insertform.yfkje.value="<%=yfkje%>";
			//parent.main.insertform.fkje.value="<%=yfkje%>";
		<%

	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

//-->
</SCRIPT>
