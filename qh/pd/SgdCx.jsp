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
String jlbz = request.getParameter("jlbz");//0+�����ɵ�&5+�󵥵�С��&6+С���ִ�&1+�ص�����&2+��˾����&3+���ʦָ���ɵ�&4+�ͻ�ָ���ɵ�
String deflbm = request.getParameter("deflbm");//������������
String sgd = request.getParameter("sgd");//������������
String ssfgs = request.getParameter("ssfgs");//������������
String kpjlh = request.getParameter("kpjlh");//������������
String cqbm = request.getParameter("cqbm");//������������
String yxxq=cf.GB2Uni(request.getParameter("yxxq"));
String xzsgdjb=cf.GB2Uni(request.getParameter("xzsgdjb"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));


if (jlbz==null)
{
	return ;
}
if (xzsgdjb==null)
{
	xzsgdjb="" ;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String sgdsql="";

String xzsgd=null;
String xzsgdmc=null;
String hdbz=null;
String hdr=null;
String outStr="";
try {
	conn=cf.getConnection();

	int count=0;
	int kjdds=0;
	int kjzds=0;
	int kjxds=0;
	int kjdzs=0;
	int yjdzs=0;
	double qdl=0;
	int row=0;

	if (jlbz.equals("1"))//1���ص�����
	{

		//�ص�ʩ����
		ls_sql=" select hdbz,trim(hdr)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			hdbz=cf.fillNull(rs.getString(1));
			hdr=cf.fillNull(rs.getString(2));

		}
		rs.close();
		ps.close();

		if (hdbz.equals("3"))//1���ǻص���2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص���5��Ա���ص�
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'���Ӻţ�'||sq_sgd.duihao||'����������'||kp_yzfsgdkpjg.bqpm||'����'||sq_sgd.sgd||'��' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,0 aa,0 bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_yzfsgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,kp_yzfsgdkpjg";
			ls_sql+=" where sq_sgd.sgdmc='"+hdr+"'";
			ls_sql+=" and sq_sgd.sgd=kp_yzfsgdkpjg.sgd and kp_yzfsgdkpjg.kpjlh="+kpjlh;
		//	out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				xzsgd=rs.getString(1);
				xzsgdmc=rs.getString(2);
				kjdds=rs.getInt(3);
				kjzds=rs.getInt(4);
				kjxds=rs.getInt(5);
				kjdzs=rs.getInt(8);
				yjdzs=rs.getInt(9);

				row++;
				sgdsql+=",'"+xzsgd+"'";

				xzsgdmc=xzsgdmc+"���ɽӣ���"+cf.formatDouble(kjdds)+"����"+cf.formatDouble(kjzds)+"��С"+cf.formatDouble(kjxds)+"�����ɽ��ܶ"+cf.formatDouble(kjdzs)+"���ѽ��ܶ"+cf.formatDouble(yjdzs)+"��";

				%>
					parent.main.addItem("<%=xzsgd%>","<%=xzsgdmc%>");
					//-->
					</SCRIPT>
				<%
			}
			rs.close();
			ps.close();
		}
		else{
				%>
					alert("����!��ʩ���ӻص�");
					//-->
					</SCRIPT>
				<%
		}


		return;
	}


	String dlx="";
	if (deflbm.equals("1"))//1:��
	{
		if (jlbz.equals("0"))//0+�����ɵ�
		{
			dlx="1";
		}
		else if (jlbz.equals("5"))//5+�󵥵�С��
		{
			dlx="2";
		}
		else if (jlbz.equals("6"))//6+С���ִ�
		{
			%>
				alert("���ܽ���С���ִ�");
				//-->
				</SCRIPT>
			<%
			return;
		}
		else
		{
			dlx="1";
		}
	}
	else if (deflbm.equals("2"))
	{
		if (jlbz.equals("0"))//0+�����ɵ�
		{
			dlx="2";
		}
		else if (jlbz.equals("5"))//5+�󵥵�С��
		{
			dlx="3";
		}
		else if (jlbz.equals("6"))//6+С���ִ�
		{
			dlx="1";
		}
		else
		{
			dlx="2";
		}
	}
	else if (deflbm.equals("3"))
	{
		if (jlbz.equals("0"))//0+�����ɵ�
		{
			dlx="3";
		}
		else if (jlbz.equals("5"))//5+�󵥵�С��
		{
			%>
				alert("���ܽ��д󵥵�С��");
				//-->
				</SCRIPT>
			<%
			return;
		}
		else if (jlbz.equals("6"))//6+С���ִ�
		{
			dlx="2";
		}
		else
		{
			dlx="3";
		}
	}

//	ls_sql=" select sq_sgd.sgd,sgdmc||'���Ӻţ�'||sq_sgd.duihao||'����������'||kp_yzfsgdkpjg.bqpm||'�����ɽӵ���'||(kjdds-yjdds)||'��'||(kjzds-yjzds)||'��'||(kjxds-yjxds)||'С����'||sq_sgd.sgd||'��' sgdmc,(kjdds-yjdds)/kjdds aa,(kjdzs-yjdds-yjzds-yjxds)/kjdzs bb,kp_yzfsgdkpjg.bqpm";
//���ɽӵ���'||(kjdds-yjdds)||'��'||(kjzds-yjzds)||'��'||(kjxds-yjxds)||'С��
	
	kjdds=0;
	kjzds=0;
	kjxds=0;
	kjdzs=0;
	yjdzs=0;
	qdl=0;
	row=0;

	//��ѡʩ����
	ls_sql=" select sq_sgd.sgd,sgdmc||'��������'||kp_yzfsgdkpjg.bqpm||'��' sgdmc,syddje,syzdje,syxdje,yjddje+yjzdje+yjxdje";
	ls_sql+=" from sq_sgd,kp_yzfsgdkpjg";
	ls_sql+=" where sq_sgd.sgd='"+sgd+"'";
	ls_sql+=" and sq_sgd.sgd=kp_yzfsgdkpjg.sgd and kp_yzfsgdkpjg.kpjlh="+kpjlh;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xzsgd=rs.getString(1);
		xzsgdmc=rs.getString(2);
		kjdds=rs.getInt(3);
		kjzds=rs.getInt(4);
		kjxds=rs.getInt(5);
		yjdzs=rs.getInt(6);

		row++;
		sgdsql+=",'"+xzsgd+"'";

		xzsgdmc=xzsgdmc+"���ɽӣ���"+cf.formatDouble(kjdds)+"����"+cf.formatDouble(kjzds)+"��С"+cf.formatDouble(kjxds)+"�����ɽ��ܶ"+cf.formatDouble(kjdds+kjzds+kjxds)+"���ѽ��ܶ"+cf.formatDouble(yjdzs)+"��";

		%>
			parent.main.addItem("<%=xzsgd%>","<%=xzsgdmc%>");
		<%
	}
	rs.close();
	ps.close();

/*
	if (!yxxq.equals(""))
	{
		//С���ɽӵ�ʩ����
		if (dlx.equals("1"))//1:��
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'���Ӻţ�'||sq_sgd.duihao||'����������'||kp_yzfsgdkpjg.bqpm||'����'||sq_sgd.sgd||'��' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjdds-yjdds)/kjdds aa,(kjdzs-yjdds-yjzds-yjxds)*1.0/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_yzfsgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,kp_yzfsgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE))";
			ls_sql+=" and sq_sgd.sgd=kp_yzfsgdkpjg.sgd and kp_yzfsgdkpjg.kpjlh="+kpjlh+" and kjdds>yjdds";
			
			ls_sql+=" and sq_sgd.sgd in(select distinct sgd from crm_khxx where zt='2' and gcjdbm not in('1','5') and fwdz like '%"+yxxq+"%')";
		}
		else if (dlx.equals("2"))
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'���Ӻţ�'||sq_sgd.duihao||'����������'||kp_yzfsgdkpjg.bqpm||'����'||sq_sgd.sgd||'��' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjzds-yjzds)/kjzds aa,(kjdzs-yjdds-yjzds-yjxds)*1.0/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_yzfsgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,kp_yzfsgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE)) ";
			ls_sql+=" and sq_sgd.sgd=kp_yzfsgdkpjg.sgd and kp_yzfsgdkpjg.kpjlh="+kpjlh+" and kjzds>yjzds ";
			
			ls_sql+=" and sq_sgd.sgd in(select distinct sgd from crm_khxx where zt='2' and gcjdbm not in('1','5') and fwdz like '%"+yxxq+"%')";
		}
		else if (dlx.equals("3"))
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'���Ӻţ�'||sq_sgd.duihao||'����������'||kp_yzfsgdkpjg.bqpm||'����'||sq_sgd.sgd||'��' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjxds-yjxds)/kjxds aa,(kjdzs-yjdds-yjzds-yjxds)*1.0/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_yzfsgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,kp_yzfsgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE)) ";
			ls_sql+=" and sq_sgd.sgd=kp_yzfsgdkpjg.sgd and kp_yzfsgdkpjg.kpjlh="+kpjlh+" and kjxds>yjxds";
			
			ls_sql+=" and sq_sgd.sgd in(select distinct sgd from crm_khxx where zt='2' and gcjdbm not in('1','5') and fwdz like '%"+yxxq+"%')";
		}
		if (row>0)
		{
			ls_sql+=" and sq_sgd.sgd not in("+sgdsql.substring(1)+")";
		}
		if (!xzsgdjb.equals(""))
		{
			if (xzsgdjb.equals("DJ"))
			{
				ls_sql+="  order by sq_sgd.sgdjbbm desc ,bb desc,bqpm";
			}
			else if (xzsgdjb.equals("GJ"))
			{
				ls_sql+="  order by sq_sgd.sgdjbbm ,bb desc,bqpm";
			}
			else{
				ls_sql+="  and sq_sgd.sgdjbbm='"+xzsgdjb+"'";
				ls_sql+="  order by bb desc,bqpm";
			}
		}
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xzsgd=rs.getString(1);
			xzsgdmc=rs.getString(2);
			kjdds=rs.getInt(3);
			kjzds=rs.getInt(4);
			kjxds=rs.getInt(5);
			kjdzs=rs.getInt(8);
			yjdzs=rs.getInt(9);

			row++;
			sgdsql+=",'"+xzsgd+"'";

			xzsgdmc=xzsgdmc+"���ɽӵ���"+cf.formatDouble(kjdds)+"��"+cf.formatDouble(kjzds)+"��"+cf.formatDouble(kjxds)+"С�����ɽ�������"+cf.formatDouble(kjdzs)+"���ѽ�������"+cf.formatDouble(yjdzs)+"��";

			%>
				parent.main.addItem("<%=xzsgd%>","<%=xzsgdmc%>");
			<%

			if (row==5)
			{
				break;
			}
		}
		rs.close();
		ps.close();
	}
	if (row<5)
	{
		//�������ɽӵ�ʩ����
		if (dlx.equals("1"))//1:��
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'���Ӻţ�'||sq_sgd.duihao||'����������'||kp_yzfsgdkpjg.bqpm||'����'||sq_sgd.sgd||'��' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjdds-yjdds)/kjdds aa,(kjdzs-yjdds-yjzds-yjxds)*1.0/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_yzfsgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,sq_kjdcq,kp_yzfsgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE))";
			ls_sql+=" and sq_sgd.sgd=kp_yzfsgdkpjg.sgd and kp_yzfsgdkpjg.kpjlh="+kpjlh+" and kjdds>yjdds";
			ls_sql+=" and sq_sgd.sgd=sq_kjdcq.sgd and sq_kjdcq.cqbm='"+cqbm+"'";
		}
		else if (dlx.equals("2"))
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'���Ӻţ�'||sq_sgd.duihao||'����������'||kp_yzfsgdkpjg.bqpm||'����'||sq_sgd.sgd||'��' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjzds-yjzds)/kjzds aa,(kjdzs-yjdds-yjzds-yjxds)*1.0/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_yzfsgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,sq_kjdcq,kp_yzfsgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE))";
			ls_sql+=" and sq_sgd.sgd=kp_yzfsgdkpjg.sgd and kp_yzfsgdkpjg.kpjlh="+kpjlh+" and kjzds>yjzds ";
			ls_sql+=" and sq_sgd.sgd=sq_kjdcq.sgd and sq_kjdcq.cqbm='"+cqbm+"'";
		}
		else if (dlx.equals("3"))
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'���Ӻţ�'||sq_sgd.duihao||'����������'||kp_yzfsgdkpjg.bqpm||'����'||sq_sgd.sgd||'��' sgdmc,kjdds-yjdds,kjzds-yjzds,kjxds-yjxds,(kjxds-yjxds)/kjxds aa,(kjdzs-yjdds-yjzds-yjxds)*1.0/kjdzs bb,kjdzs,yjdds+yjzds+yjxds yjdzs,kp_yzfsgdkpjg.bqpm";
			ls_sql+=" from sq_sgd,sq_kjdcq,kp_yzfsgdkpjg";
			ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE))";
			ls_sql+=" and sq_sgd.sgd=kp_yzfsgdkpjg.sgd and kp_yzfsgdkpjg.kpjlh="+kpjlh+" and kjxds>yjxds";
			ls_sql+=" and sq_sgd.sgd=sq_kjdcq.sgd and sq_kjdcq.cqbm='"+cqbm+"'";
		}
		if (row>0)
		{
			ls_sql+=" and sq_sgd.sgd not in("+sgdsql.substring(1)+")";
		}
		if (!xzsgdjb.equals(""))
		{
			if (xzsgdjb.equals("DJ"))
			{
				ls_sql+="  order by sq_sgd.sgdjbbm desc ,bb desc,bqpm";
			}
			else if (xzsgdjb.equals("GJ"))
			{
				ls_sql+="  order by sq_sgd.sgdjbbm ,bb desc,bqpm";
			}
			else{
				ls_sql+="  and sq_sgd.sgdjbbm='"+xzsgdjb+"'";
				ls_sql+="  order by bb desc,bqpm";
			}
		}
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xzsgd=rs.getString(1);
			xzsgdmc=rs.getString(2);
			kjdds=rs.getInt(3);
			kjzds=rs.getInt(4);
			kjxds=rs.getInt(5);
			kjdzs=rs.getInt(8);
			yjdzs=rs.getInt(9);

			row++;
			sgdsql+=",'"+xzsgd+"'";

			xzsgdmc=xzsgdmc+"���ɽӵ���"+cf.formatDouble(kjdds)+"��"+cf.formatDouble(kjzds)+"��"+cf.formatDouble(kjxds)+"С�����ɽ�������"+cf.formatDouble(kjdzs)+"���ѽ�������"+cf.formatDouble(yjdzs)+"��";

			%>
				parent.main.addItem("<%=xzsgd%>","<%=xzsgdmc%>");
			<%

			if (row==5)
			{
				break;
			}
		}
		rs.close();
		ps.close();
	}
*/

	if (row<5)
	{
		//�Ǳ������ɽӵ�ʩ����
		if (dlx.equals("1"))//1:��
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'��������'||kp_yzfsgdkpjg.bqpm||'��' sgdmc,syddje,syzdje,syxdje,yjddje+yjzdje+yjxdje";
			ls_sql+=" from sq_sgd,kp_yzfsgdkpjg";
			ls_sql+=" where sq_sgd.sgd=kp_yzfsgdkpjg.sgd and kp_yzfsgdkpjg.kpjlh="+kpjlh;
			ls_sql+=" and cxbz='N' and (sfkkqjd='Y' OR sfkkqjd is NULL) and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE)) ";
			ls_sql+=" and syddje>0";
		}
		else if (dlx.equals("2"))
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'��������'||kp_yzfsgdkpjg.bqpm||'��' sgdmc,syddje,syzdje,syxdje,yjddje+yjzdje+yjxdje";
			ls_sql+=" from sq_sgd,kp_yzfsgdkpjg";
			ls_sql+=" where sq_sgd.sgd=kp_yzfsgdkpjg.sgd and kp_yzfsgdkpjg.kpjlh="+kpjlh;
			ls_sql+=" and cxbz='N' and (sfkkqjd='Y' OR sfkkqjd is NULL) and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE)) ";
			ls_sql+=" and syzdje>0";
		}
		else if (dlx.equals("3"))
		{
			ls_sql=" select sq_sgd.sgd,sgdmc||'��������'||kp_yzfsgdkpjg.bqpm||'��' sgdmc,syddje,syzdje,syxdje,yjddje+yjzdje+yjxdje";
			ls_sql+=" from sq_sgd,kp_yzfsgdkpjg";
			ls_sql+=" where sq_sgd.sgd=kp_yzfsgdkpjg.sgd and kp_yzfsgdkpjg.kpjlh="+kpjlh;
			ls_sql+=" and cxbz='N' and (sfkkqjd='Y' OR sfkkqjd is NULL) and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE)) ";
			ls_sql+=" and syxdje>0";
		}
		if (row>0)
		{
			ls_sql+=" and sq_sgd.sgd not in("+sgdsql.substring(1)+")";
		}
		if (!xzsgdjb.equals(""))
		{
			if (xzsgdjb.equals("DJ"))
			{
				ls_sql+="  order by sq_sgd.sgdjbbm desc ,bb desc,bqpm";
			}
			else if (xzsgdjb.equals("GJ"))
			{
				ls_sql+="  order by sq_sgd.sgdjbbm ,bb desc,bqpm";
			}
			else{
				ls_sql+="  and sq_sgd.sgdjbbm='"+xzsgdjb+"'";
				ls_sql+="  order by bb desc,bqpm";
			}
		}
		else{
			ls_sql+="  order by syddje+syzdje+syxdje desc,bqpm";
		}
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xzsgd=rs.getString(1);
			xzsgdmc=rs.getString(2);
			kjdds=rs.getInt(3);
			kjzds=rs.getInt(4);
			kjxds=rs.getInt(5);
			yjdzs=rs.getInt(6);


			row++;

			xzsgdmc=xzsgdmc+"���ɽӵ�����"+cf.formatDouble(kjdds)+"����"+cf.formatDouble(kjzds)+"��С"+cf.formatDouble(kjxds)+"�����ɽ��ܶ"+cf.formatDouble(kjdds+kjzds+kjxds)+"���ѽ��ܶ"+cf.formatDouble(yjdzs)+"��";

			%>
				parent.main.addItem("<%=xzsgd%>","<%=xzsgdmc%>");
			<%

			if (row==5)
			{
//				break;
			}
		}
		rs.close();
		ps.close();
	}



	%>
		parent.main.chooseItem("<%=sgd%>");
	<%
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL: " + ls_sql);
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

