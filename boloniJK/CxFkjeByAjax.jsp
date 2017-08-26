<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%  
String hth = request.getParameter("hth");
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

		double zjxje=0;
		double zhzjxje=0;
		double zqzjxguanlif=0;
		double zjxguanlif=0;
		double zjxsuijin=0;
		double sfke=0;
		double zjxssk=0;
		
		String khbh=null;

		ls_sql="select khbh,fgsbh,wdzgce,qye,sjf,glf,suijin,zqguanlif,guanlif  ,zjxje,zhzjxje,zqzjxguanlif,zjxguanlif,zjxsuijin  ,sfke,zjxssk";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  hth='"+hth+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			fgsbh=cf.fillNull(rs.getString("fgsbh"));
			wdzgce=rs.getDouble("wdzgce");
			qye=rs.getDouble("qye");
			sjf=rs.getDouble("sjf");
			glf=rs.getDouble("glf");
			suijin=rs.getDouble("suijin");//˰��
			zqguanlif=rs.getDouble("zqguanlif");//��ǰ�����
			guanlif=rs.getDouble("guanlif");//�ۺ�����

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
			yfkbl=rs.getDouble("yfkbl");//�ۼ��տ����
		}
		rs.close();
		ps.close();

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
		1����ͬԭ����(����������)��
		2��ǩԼ��(����������) ��

		3����ͬԭ���ۣ���ǰ�����������һ����ȡ��
		4����ͬԭ���ۣ���ǰ�����������ִ���ȡ��
		5��ǩԼ��ۺ������������һ����ȡ��
		6��ǩԼ��ۺ������������ִ���ȡ��

		8����ǰ�����
		9���ۺ�������
*/		

		if (lx.equals("1"))
		{
			yfkje=wdzgce*bqfkbl/100.0;//����ԭ���ۡ��ۼ��տ���ʣ���װʵ�տ��
		}
		else if (lx.equals("2"))
		{
			yfkje=qye*bqfkbl/100.0;//��ͬǩԼ����ۼ��տ���ʣ���װʵ�տ��
		}
		else if (lx.equals("3"))
		{
			yfkje=(wdzgce*bqfkbl/100.0+zjxje);//������ԭ���ۡ��ۼ��տ���ʣ���ǰ���������װʵ�տ��
		}
		else if (lx.equals("4"))
		{
			yfkje=(wdzgce+zjxje)*bqfkbl/100.0;//������ԭ���ۣ���ǰ��������ۼ��տ���ʣ���װʵ�տ��
		}
		else if (lx.equals("5"))
		{
			yfkje=(qye*bqfkbl/100.0+zhzjxje);//��ǩԼ����ۼ��տ���ʣ��ۺ����������װʵ�տ��
		}
		else if (lx.equals("6"))
		{
			yfkje=(qye+zhzjxje)*bqfkbl/100.0;//��ǩԼ��ۺ���������ۼ��տ���ʣ���װʵ�տ��
		}

		else if (lx.equals("8"))
		{
			yfkje=zjxje-zjxssk;//��ǰ�����������ʵ�տ�
		}
		else if (lx.equals("9"))
		{
			yfkje=zhzjxje-zjxssk;//�ۺ������������ʵ�տ�
		}


		yfkje=cf.doubleTrim(yfkje);


		response.setContentType("text/html");
		response.setCharacterEncoding("gbk");
		System.out.println(Double.toString(yfkje));
		response.getWriter().write(Double.toString(yfkje));
		

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


