<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="jcjj" scope="page" class="jcjj.Jcjj"/>
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
String dqbm = request.getParameter("dqbm");
String mmdglxbm = request.getParameter("mmdglxbm");//ľ�Ŷ������ͱ���
String mlx = request.getParameter("mlx");//1����ͨ�ţ�2����ĸ�ţ�3���Կ��ţ�4�������� 
String mmxh = request.getParameter("mmxh");//ľ���ͺ�
String ysbm = request.getParameter("ysbm");//��ɫ����
String mdk = request.getParameter("mdk");//�Ŷ���
String mdg = request.getParameter("mdg");//�Ŷ���
String qh = request.getParameter("qh");//ǽ��
String dbh = request.getParameter("dbh");//�ذ��
String tjx = request.getParameter("tjx");//�߽���/ƽ̨�Ͽ�
String ctbs = request.getParameter("ctbs");//����/���ױ���
String sfsmjcc = request.getParameter("sfsmjcc");//�ƿ���ľ���ɲ�
String mtxbm = request.getParameter("mtxbm");//�����߱���
String mxxbm = request.getParameter("mxxbm");//��о�߱���
String getlx = request.getParameter("getlx");

//out.println(mmdglxbm);

if (sfsmjcc==null)
{
	sfsmjcc="";
}

double dj=0;

if (mmdglxbm==null)
{
	return ;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String c1=null;
String c2=null;

try {

	conn=cf.getConnection();

	if (getlx.equals("1"))//��������
	{
		String jjfs="";
		ls_sql="select jjfs";
		ls_sql+=" from jc_mmdglx";
		ls_sql+=" where mmdglxbm='"+mmdglxbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjfs=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();
		%>
			parent.main.insertform.jjfs.value="<%=jjfs%>";
		<%

		if (jjfs.equals("11"))//11��ľ��
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%
		}
		//12��˫���ƿڣ�13��˫�ڴ��ף�14�������ƿڣ�15�����ڴ���
		else if (jjfs.equals("12") || jjfs.equals("13") || jjfs.equals("14") || jjfs.equals("15"))
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%

			ls_sql="select distinct jc_mtbjb.ysbm,mmczmc";
			ls_sql+=" from  jc_mtbjb,jdm_mmczbm";
			ls_sql+=" where jc_mtbjb.dqbm='"+dqbm+"' and jc_mtbjb.mmdglxbm='"+mmdglxbm+"' and jc_mtbjb.ysbm=jdm_mmczbm.mmczbm ";
			ls_sql+=" order by mmczmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=cf.fillNull(rs.getString(1));
				c2=cf.fillNull(rs.getString(2));

				%>
					parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
				<%
			}
			rs.close();
			ps.close();
		}
		//21��������;22���Ŷ���
		else if (jjfs.equals("21") || jjfs.equals("22"))
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%

			ls_sql="select distinct jc_mlcbjb.ysbm,mmczmc";
			ls_sql+=" from  jc_mlcbjb,jdm_mmczbm";
			ls_sql+=" where jc_mlcbjb.dqbm='"+dqbm+"' and jc_mlcbjb.mmdglxbm='"+mmdglxbm+"' and jc_mlcbjb.ysbm=jdm_mmczbm.mmczbm ";
			ls_sql+=" order by mmczmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=cf.fillNull(rs.getString(1));
				c2=cf.fillNull(rs.getString(2));

				%>
					parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
				<%
			}
			rs.close();
			ps.close();
		}
		//31����Ʈ������
		else if (jjfs.equals("31"))
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%

			ls_sql="select distinct jc_mtbjb.ysbm,mmczmc";
			ls_sql+=" from  jc_mtbjb,jdm_mmczbm";
			ls_sql+=" where jc_mtbjb.dqbm='"+dqbm+"' and jc_mtbjb.mmdglxbm='"+mmdglxbm+"' and jc_mtbjb.ysbm=jdm_mmczbm.mmczbm ";
			ls_sql+=" order by mmczmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=cf.fillNull(rs.getString(1));
				c2=cf.fillNull(rs.getString(2));

				%>
					parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
				<%
			}
			rs.close();
			ps.close();
		}
		//32����Ʈ��ƽ̨�Ͽ�
		else if (jjfs.equals("32"))
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%

			ls_sql="select distinct jc_tjxbjb.ysbm,mmczmc";
			ls_sql+=" from  jc_tjxbjb,jdm_mmczbm";
			ls_sql+=" where jc_tjxbjb.dqbm='"+dqbm+"' and jc_tjxbjb.mmdglxbm='"+mmdglxbm+"' and jc_tjxbjb.ysbm=jdm_mmczbm.mmczbm ";
			ls_sql+=" order by mmczmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=cf.fillNull(rs.getString(1));
				c2=cf.fillNull(rs.getString(2));

				%>
					parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
				<%
			}
			rs.close();
			ps.close();
		}
		//41��ƽ���׼Ƽ�;42�����׼Ƽ�
		else if (jjfs.equals("41") || jjfs.equals("42"))
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%

			ls_sql="select distinct jc_tjxbjb.ysbm,mmczmc";
			ls_sql+=" from  jc_tjxbjb,jdm_mmczbm";
			ls_sql+=" where jc_tjxbjb.dqbm='"+dqbm+"' and jc_tjxbjb.mmdglxbm='"+mmdglxbm+"' and jc_tjxbjb.ysbm=jdm_mmczbm.mmczbm ";
			ls_sql+=" order by mmczmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=cf.fillNull(rs.getString(1));
				c2=cf.fillNull(rs.getString(2));

				%>
					parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
				<%
			}
			rs.close();
			ps.close();
		}
		//43���ֶ�ƽ���׼Ƽۣ�44���ֶ����׼Ƽۣ�45���ֶΰ����ȼƼ�
		else if (jjfs.equals("43") || jjfs.equals("44") || jjfs.equals("45"))
		{
			%>
				parent.main.insertform.dj.value="";
				parent.main.insertform.ysbm.length=0;
				parent.main.addItem(parent.main.insertform.ysbm,"","");
			<%

			ls_sql="select distinct jc_hjbjb.ysbm,mmczmc";
			ls_sql+=" from  jc_hjbjb,jdm_mmczbm";
			ls_sql+=" where jc_hjbjb.dqbm='"+dqbm+"' and jc_hjbjb.mmdglxbm='"+mmdglxbm+"' and jc_hjbjb.ysbm=jdm_mmczbm.mmczbm ";
			ls_sql+=" order by mmczmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=cf.fillNull(rs.getString(1));
				c2=cf.fillNull(rs.getString(2));

				%>
					parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
				<%
			}
			rs.close();
			ps.close();
		}
	}
	else if (getlx.equals("2"))//ľ���ͺ�
	{
		%>
			parent.main.insertform.dj.value="";
			parent.main.insertform.ysbm.length=0;
			parent.main.addItem(parent.main.insertform.ysbm,"","");
		<%

		ls_sql="select distinct jc_mmbjb.ysbm,mmczmc";
		ls_sql+=" from  jc_mmbjb,jdm_mmczbm";
		ls_sql+=" where jc_mmbjb.dqbm='"+dqbm+"' and jc_mmbjb.mmxh='"+mmxh+"' and jc_mmbjb.ysbm=jdm_mmczbm.mmczbm ";
		ls_sql+=" order by mmczmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			c1=cf.fillNull(rs.getString(1));
			c2=cf.fillNull(rs.getString(2));

			%>
				parent.main.addItem(parent.main.insertform.ysbm,"<%=c2%>","<%=c1%>");
			<%
		}
		rs.close();
		ps.close();
	}
	else if (getlx.equals("3"))//��׼����
	{
		dj=jcjj.yzMmbj(dqbm,mmdglxbm,mlx,mmxh,ysbm,mdk,mdg,qh,dbh,tjx,ctbs,sfsmjcc,mtxbm,mxxbm);

		if (dj!=0)//���۲�Ϊ0
		{
			%>
			parent.main.insertform.dj.value="<%=cf.doubleTrimStr(dj,2)%>";
			//ʹ�����̡���ť��ʹ��
			parent.main.insertform.bc.disabled=false;
			<%
		}
		else{
			%>
			parent.main.insertform.dj.value="";
			//ʹ�����̡���ť��ʹ��
			parent.main.insertform.bc.disabled=false;
	//		alert("���󣡼۸���Ϣ��������δ�鵽�۸���Ϣ");
			<%
		}
	}
}
catch(Exception e){
	out.print("��������: " + e);
	%>
		parent.main.insertform.dj.value="";
		alert("����<%=e%>");
	<%
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


