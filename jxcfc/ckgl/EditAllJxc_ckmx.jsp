<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<%
String ckph=request.getParameter("ckph");

String ckxh=null;
String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String ppmc=null;
double ckdj=0;
double cksl=0;
String jldwbm=null;

String bgcolor="";

int row=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String psph=null;
String dqbm = null;
String ckbh = null;
String ckdzt = null;
String ckjxz = null;
try {
	conn=cf.getConnection();

	//��ѯ���ⵥ
	ls_sql = " select dqbm,ckbh,lydh,ckdzt,ckjxz ";
	ls_sql+= " from jxc_ckd ";
	ls_sql +=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		psph=cf.fillNull(rs.getString("lydh"));
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
		ckjxz=cf.fillNull(rs.getString("ckjxz"));
	}
	else
	{
		out.print("���󣡲����ڵĳ��ⵥ");
		return;
	}
	rs.close();
	ps.close();
	if (!ckdzt.equals("0"))
	{
		out.print("���󣡳��ⵥ���ύ");
		return;
	}

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�޸ĳ�����ϸ(��������:<%=ckph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">
<table border="1" cellspacing="0" cellpadding="1" width="105%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td width="3%">���</td>
	<td width="8%">���ϱ���</td>
	<td width="14%">��������</td>
	<td width="9%">���</td>
	<td width="6%">������λ</td>
	<td width="8%">���ⵥ��</td>
	<td width="6%">���۷�ʽ</td>
	<td width="7%">��������</td>
	<td width="6%">�ѳ�����</td>
	<td width="8%">�������</td>
	<td width="8%">��������</td>
	<td width="6%">����</td>
	<td width="8%">�ͺ�</td>
</tr>
<%
	ls_sql="SELECT ckxh,jxc_ckmx.clbm,nbbm,jxc_ckmx.clmc,xh,jxc_ckmx.gg,ppmc,jldwbm,ckdj,cksl";
	ls_sql+=" FROM jxc_ckmx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ls_sql+=" order by ckxh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		row++;

		ckxh=cf.fillNull(rs.getString("ckxh"));
		clbm=cf.fillNull(rs.getString("clbm"));
		nbbm=cf.fillHtml(rs.getString("nbbm"));
		clmc=cf.fillHtml(rs.getString("clmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		ppmc=cf.fillHtml(rs.getString("ppmc"));
		jldwbm=cf.fillHtml(rs.getString("jldwbm"));
		ckdj=rs.getDouble("ckdj");
		cksl=rs.getDouble("cksl");

		//��ѯ����������ϸ
		double pssl=0;
		double ycksl=0;
		double xcksl=0;//����������������������ѳ�������
		ls_sql = " select pssl,cksl,pssl-cksl xcksl";
		ls_sql+= " from jxc_clpsmx ";
		ls_sql+=" where psph='"+psph+"' and clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			pssl=rs1.getDouble("pssl");
			ycksl=rs1.getDouble("cksl");
			xcksl=rs1.getDouble("xcksl");
		}
		rs1.close();
		ps1.close();


		
		//��ѯ������Ϣ
		double kcsl=0;
		String xsfs=null;
		String xsfsmc=null;
		ls_sql = " select zcpzsl,xsfs,DECODE(xsfs,'1','����Ʒ','2','�ֻ�','3','�ڻ�','4','�ɸ����') xsfsmc ";
		ls_sql+= " from jxc_cljgb ";
		ls_sql +=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			kcsl=rs1.getDouble("zcpzsl");//����Ʒ������
			xsfs=cf.fillNull(rs1.getString("xsfs"));
			xsfsmc=cf.fillNull(rs1.getString("xsfsmc"));
		}
		else
		{
			rs1.close();
			ps1.close();

			out.print("����:["+clbm+"]�����ڣ�");
			return;
		}
		rs1.close();
		ps1.close();

		String txxx="&nbsp";

		if (xsfs.equals("2"))//2���ֻ�����
		{
			if (kcsl<xcksl)
			{
				if (cksl==0)
				{
					txxx="<font color=red>�޷�����<font>";
				}
				else{
					txxx="<font color=red>��治��<font>";
				}
			}
		}
		else if (xsfs.equals("3"))//3���ڻ�����
		{
			if (kcsl<xcksl)
			{
				if (cksl==0)
				{
					txxx="<font color=red>�޷�����<font>";
				}
				else{
					txxx="<font color=red>��治��<font>";
				}
			}
		}
		else if (xsfs.equals("4"))//4��������棻
		{
			if (kcsl<xcksl)
			{
				txxx="<font color=red>�����<font>";
			}
		}
		
		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}
%>
		<tr bgcolor="<%=bgcolor%>" align="center">
		<td>
			<input name="chitem" type="checkbox" value="<%=ckxh%>">		</td>
		<td><%=row%>
			<input type="hidden" name="ckxh" value="<%=ckxh%>">
			<input type="hidden" name="clbm" value="<%=clbm%>" >
			<input type="hidden" name="kcsl"  value="<%=kcsl%>" >
			<input type="hidden" name="xcksl"  value="<%=xcksl%>" >
			<input type="hidden" name="xsfs"  value="<%=xsfs%>" >		</td>
		<td><%=nbbm%></td>
		<td><%=clmc%></td>
		<td><%=gg%></td>
		<td><%=jldwbm%></td>
			<td>
<%
		if (ckjxz.equals("4"))//4���˹�¼��
		{
			%>
			<input type="text" name="ckdj"  value="<%=ckdj%>" size="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			<%
		}
		else{
			%>
			<input type="hidden" name="ckdj"  value="<%=ckdj%>" ><%=ckdj%>
			<%
		}
%>
			</td>
		<td><%=xsfsmc%></td>
		<td><%=pssl%></td>
		<td><%=ycksl%></td>
		<td><%=kcsl%></td>
		<td> 
			<input type="text" name="cksl" size="8" maxlength="10" value=<%=cksl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >		</td>
		<td><%=txxx%></td>
		<td><%=xh%></td>
		</tr>
<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr align="center" bgcolor="#FFFFFF"> 
      <td colspan="6" > 
		<input type="hidden" name="ckph" value="<%=ckph%>">
		<input type=button value=' �� �� ' onClick="f_do(listform)" name="sl">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value='����' name="reset" >      
</td>
      <td colspan="8" >&nbsp;
        <input name="button" type=button onClick="selectAll(listform)" value='ȫѡɾ����'>
&nbsp;&nbsp;
<input name="button" type=button onClick="f_delete(listform)" value='ɾ��'></td>
    </tr>
</table>
</form>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(FormName)
{
/*
	if (<%=row%><=1)
	{
		if(	javaTrim(FormName.cksl)=="") {
			alert("������[��������]��");
			FormName.cksl.select();
			return false;
		}
		if(!(isFloat(FormName.cksl, "��������"))) {
			return false;
		}

		if (parseFloat(FormName.cksl.value)<=0)
		{
			alert("��������������������㣡����");
			FormName.cksl.select();
			return false;
		}
		if (parseFloat(FormName.cksl.value) < parseFloat(FormName.zxqdl.value))
		{
			alert("������������������ڡ���С����"+FormName.zxqdl.value+"��������");
			FormName.cksl.select();
			return false;
		}

		if (FormName.xsfs.value=="2")//1������Ʒ��2���ֻ����ۣ�3���ڻ�����
		{
			if (parseFloat(FormName.cksl.value) > parseFloat(FormName.kdhsl.value))
			{
				alert("�����ֻ����ۣ����������������ܴ��ڡ��ɶ�������"+FormName.kdhsl.value+"�����ɶ�������������Ʒ��棭����");
				FormName.cksl.select();
				return false;
			}
		}
	}
	else//���ֻ��һ����¼����ͨ���������ʽ����
	{
		for (i=0;i<<%=row%> ;i++ )
		{
			if(	javaTrim(FormName.cksl[i])=="") {
				alert("������[��������]��");
				FormName.cksl[i].select();
				return false;
			}
			if(!(isFloat(FormName.cksl[i], "��������"))) {
				return false;
			}

			if (parseFloat(FormName.cksl[i].value)<=0)
			{
				alert("��������������������㣡����");
				FormName.cksl[i].select();
				return false;
			}

			if (parseFloat(FormName.cksl[i].value) < parseFloat(FormName.zxqdl[i].value))
			{
				alert("������������������ڡ���С����"+FormName.zxqdl[i].value+"��������");
				FormName.cksl[i].select();
				return false;
			}

			if (FormName.xsfs[i].value=="2")//1������Ʒ��2���ֻ����ۣ�3���ڻ�����
			{
				if (parseFloat(FormName.cksl[i].value) > parseFloat(FormName.kdhsl[i].value))
				{
					alert("�����ֻ����ۣ����������������ܴ��ڡ��ɶ�������"+FormName.kdhsl[i].value+"�����ɶ�������������Ʒ��棭����");
					FormName.cksl[i].select();
					return false;
				}
			}
		}
	}
*/
	FormName.action="SaveEditAllJxc_ckmx.jsp";
	FormName.submit();
	return true;
} 

var mark=1;
function selectAll(FormName)//ת���ַ���
{
	var i = 0;
	if (<%=row%>==1)
	{
		if (mark==0)
		{
			FormName.chitem.checked =false
		}
		else{
			FormName.chitem.checked =true
		}
	}
	else
	{ 
		for (i=0;i <<%=row%> ;i++ )
		{
			if (mark==0)
			{
				FormName.chitem[i].checked =false
			}
			else{
				FormName.chitem[i].checked =true
			}
		}
	}
	if (mark==0)
	{
		mark=1;
	}
	else{
		mark=0;
	}
}

function f_delete(FormName)
{
	if (!confirm("ȷʵҪɾ����") )	
	{
		return false;
	}

	var choo=0;
	var i = 0;
	if (<%=row%>==1)
	{
		if( FormName.chitem.checked )
		{
			choo=1;
		}
	} 
	else
	{ 
		for (i=0;i <<%=row%> ;i++ )
		{
			if( FormName.chitem[i].checked )
			{
				choo=1;
			}
		} 
	} 
	if (choo == 0)
	{
		alert("��ѡ����Ҫɾ������Ŀ");
		return false;
	}

	FormName.action="DeleteJxc_ckmx.jsp";
	FormName.submit();
	return true;

}

//-->
</script>

