<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zjxbh = request.getParameterValues("zjxbh");

String fgsbh=null;
String ddbh=null;
String clzt=null;
double zjxze=0;
String newzjxbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxbh.length ;i++ )
	{
		String khbh=null;
		ls_sql =" select ddbh,clzt,fgsbh,khbh";
		ls_sql+=" from jc_zczjx";
		ls_sql+=" where zjxbh='"+zjxbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ddbh=rs.getString("ddbh");
			clzt=rs.getString("clzt");
			fgsbh=rs.getString("fgsbh");
			khbh=rs.getString("khbh");
		}
		else{
			conn.rollback();
			out.println("<BR>����[�������ţ�"+zjxbh[i]+"]������");
			return;
		}
		rs.close();
		ps.close();

		if (!clzt.equals("00") && !clzt.equals("01"))
		{
			conn.rollback();
			out.println("<BR>����[�������ţ�"+zjxbh[i]+"]״̬����ȷ");
			return;
		}

		String khjsbz="";
		ls_sql="select khjsbz";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khjsbz=cf.fillNull(rs.getString("khjsbz"));
		}
		rs.close();
		ps.close();

		if (khjsbz.equals("Y"))
		{
			conn.rollback();
			out.println("���󣡿ͻ��ѽ��㣬�������޸�");
			return;
		}


		int jcddblxs=-100;//���ɶ�������С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
		int jcddmxblxs=-100;//���ɶ�����ϸ����С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
		ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jcddblxs=rs.getInt(1);
			jcddmxblxs=rs.getInt(2);
		}
		rs.close();
		ps.close();

		if (jcddblxs==-100)
		{
			conn.rollback();
			out.println("<BR>����û�����á����ɶ�������С��λ����������ϵ����Ա");
			return;
		}

		if (jcddmxblxs==-100)
		{
			conn.rollback();
			out.println("<BR>����û�����á����ɶ�����ϸ����С����������ϵ����Ա");
			return;
		}

		String ddzjxbh=null;
		ls_sql="select zjxbh";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ddzjxbh=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (!ddzjxbh.equals(zjxbh[i]))
		{
			conn.rollback();
			out.println("<BR>����ֻ��ɾ�����µ��������¼��"+ddzjxbh+"��["+zjxbh[i]+"]�����µ�");
			return;
		}


		ls_sql="delete from jc_zcddmx ";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ls_sql+=" and jc_zcddmx.xh in(select xh from jc_zczjxmx where zjxbh='"+zjxbh[i]+"' and lx='2')";//1��������Ŀ��2��������Ŀ
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_zczjxmx ";
		ls_sql+=" where zjxbh='"+zjxbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_zczjx ";
		ls_sql+=" where zjxbh='"+zjxbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		ls_sql="update jc_zcddmx";
		ls_sql+=" set zjhsl=sl+NVL((select sum(zjsl) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
		ls_sql+=" ,zjhje=je+NVL((select sum(zjje) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
		ls_sql+=" ,zjhycf=ycf+NVL((select sum(zjycf) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
		ls_sql+=" ,zjhqtfy=qtfyje+NVL((select sum(zjqtfy) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
		ls_sql+=" ,zjhcxhdje=cxhdje+NVL((select sum(zjcxhdje) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		//��С��λ����
		ls_sql="update jc_zcddmx ";
		ls_sql+=" set zjhje=ROUND(zjhje,"+jcddmxblxs+")";
		ls_sql+=" ,zjhycf=ROUND(zjhycf,"+jcddmxblxs+")";
		ls_sql+=" ,zjhqtfy=ROUND(zjhqtfy,"+jcddmxblxs+")";
		ls_sql+=" ,zjhcxhdje=ROUND(zjhcxhdje,"+jcddmxblxs+")";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		//��С��λ����
		ls_sql="update jc_zcddmx ";
		ls_sql+=" set zjhje=0,zjhycf=0,zjhqtfy=0,zjhcxhdje=0";
		ls_sql+=" where ddbh='"+ddbh+"' and zjhsl=0";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	
		//���Ķ�����jc_zcdd��:�����������ܶ�
		double zqzjhze=0;
		double zjhze=0;
		double zjxcbze=0;
		double zjxcxhdje=0;
		ls_sql="select sum(zqzjxze),sum(zjxze),sum(zjxcbze),sum(zjxcxhdje)";
		ls_sql+=" from jc_zczjx ";
		ls_sql+=" where ddbh='"+ddbh+"' and clzt!='00'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zqzjhze=rs.getDouble(1);
			zjhze=rs.getDouble(2);
			zjxcbze=rs.getDouble(3);
			zjxcxhdje=rs.getDouble(4);
		}
		rs.close();
		ps.close();

		ls_sql="select max(zjxbh)";
		ls_sql+=" from  jc_zczjx";
		ls_sql+=" where ddbh='"+ddbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			newzjxbh=rs.getString(1);
		}
		rs.close();
		ps.close();
		if (newzjxbh==null)
		{
			newzjxbh="";
		}

		ls_sql="update jc_zcdd set zqzjhze=ROUND("+zqzjhze+","+jcddblxs+"),zjhze=ROUND("+zjhze+","+jcddblxs+")";
		ls_sql+=" ,zjxcxhdje=ROUND("+zjxcxhdje+","+jcddblxs+"),zjxcbze="+zjxcbze+",zjxbh='"+newzjxbh+"'";
		ls_sql+=" where ddbh='"+ddbh+"'";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���ɶ���
		ls_sql="delete from jc_jcdd";
		ls_sql+=" where gjz='"+zjxbh[i]+"' and lx='4' and czlx='2'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>