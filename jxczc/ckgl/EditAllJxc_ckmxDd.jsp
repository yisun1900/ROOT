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
String hjbh=null;
String scph=null;

String bgcolor="";

int row=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String lydh=null;
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
		lydh=cf.fillNull(rs.getString("lydh"));
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
<table border="1" cellspacing="0" cellpadding="1" width="130%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td width="2%">���</td>
	<td width="6%">�ڲ�����</td>
	<td width="12%">��������</td>
	<td width="10%">�ͺ�</td>
	<td width="4%">������λ</td>
	<td width="5%">��������</td>
	<td width="5%">�ѳ�����</td>
	<td width="5%">�������</td>
	<td width="7%">��������</td>
	<td width="5%">����</td>
	<td width="10%">����</td>
	<td width="8%">��������</td>
	<td width="10%">���</td>
	<td width="5%">���ⵥ��</td>
	<td width="4%">���۷�ʽ</td>
</tr>
<%
	ls_sql="SELECT ckxh,jxc_ckmx.clbm,nbbm,jxc_ckmx.clmc,xh,jxc_ckmx.gg,ppmc,jldwbm,ckdj,cksl,scph,hjbh";
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
		scph=cf.fillNull(rs.getString("scph"));
		hjbh=cf.fillNull(rs.getString("hjbh"));

		//��ѯ����������ϸ
		double sl=0;
		double ycksl=0;
		double xcksl=0;//����������������������ѳ�������
		ls_sql = " select sl,cksl,sl-cksl xcksl";
		ls_sql+= " from jc_zcddmx ";
		ls_sql+=" where ddbh='"+lydh+"' and zcbm='"+clbm+"'";
		ls_sql+=" and lx='1' ";//1����ͬ�2������ 
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			sl=rs1.getDouble("sl");
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
		<td><%=xh%></td>

		<td><%=jldwbm%></td>
		<td><%=sl%></td>
		<td><%=ycksl%></td>
		<td><%=kcsl%></td>
		<td> 
			<input type="text" name="cksl" size="8" maxlength="10" value=<%=cksl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >		</td>
		<td><%=txxx%></td>
			<td > 
				<select name="hjbh" style="FONT-SIZE:12PX;WIDTH:112PX" onChange="changeHj(listform,'<%=clbm%>',<%=row%>)">
				  <option value=""></option>
				  <%
						cf.selectItem(out,"select distinct jxc_kcb.hjbh,jxc_hjmc.hjmc from jxc_kcb,jxc_hjmc where jxc_kcb.hjbh=jxc_hjmc.hjbh and jxc_kcb.ckbh='"+ckbh+"' and jxc_kcb.clbm='"+clbm+"' order by jxc_kcb.hjbh",hjbh);
					%>
				</select>      
			</td>
			<td > 
				<select name="scph" style="FONT-SIZE:12PX;WIDTH:92PX" >
				  <option value=""></option>
				  <%
						cf.selectItem(out,"select distinct scph c1,scph c2 from jxc_kcb where ckbh='"+ckbh+"' and hjbh='"+hjbh+"' and clbm='"+clbm+"' order by scph",scph);
					%>
				</select>      
			</td>
		<td><%=gg%></td>
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
        <input name="button" type=button onClick="selectAll(listform)" value='ȫѡɾ����'>
&nbsp;&nbsp;
<input name="button" type=button onClick="f_delete(listform)" value='ɾ��'></td>
      <td colspan="10" >&nbsp;
		<input type=button value=' �� �� ' onClick="f_do(listform)" name="sl">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value='����' name="reset" >      
</td>
    </tr>
</table>
</form>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

<%
	//����Ajax
	cf.ajax(out);
%>

var currow=0;
function changeHj(FormName,clbm,row)
{
	row=row-1;
	currow=row;

	if (<%=row%>>1)
	{
		FormName.scph[currow].length=1;

		if (FormName.hjbh[currow].value=="")
		{
			return;
		}



		var sql;
		sql="select distinct scph c1,scph c2 from jxc_kcb where ckbh='<%=ckbh%>' and clbm='"+clbm+"' and hjbh='"+FormName.hjbh[currow].value+"' order by scph";

		var actionStr="/ajax/selectstr.jsp?sql="+sql;

//		window.open(actionStr);
		openAjax(actionStr);
	}
	else{
		FormName.scph.length=1;

		if (FormName.hjbh.value=="")
		{
			return;
		}



		var sql;
		sql="select distinct scph c1,scph c2 from jxc_kcb where ckbh='<%=ckbh%>' and clbm='"+clbm+"' and hjbh='"+FormName.hjbh.value+"' order by scph";

		var actionStr="/ajax/selectstr.jsp?sql="+sql;

//		window.open(actionStr);
		openAjax(actionStr);
	}

}

function getAjax(ajaxRetStr) 
{
	if (<%=row%>>1)
	{
		strToSelect(listform.scph[currow],ajaxRetStr);
	}
	else{
		strToSelect(listform.scph,ajaxRetStr);
	}
}

function f_do(FormName)
{
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


		if (parseFloat(FormName.cksl.value) > parseFloat(FormName.kcsl.value))
		{
			alert("���󣡡��������������ܴ��ڡ��������:"+FormName.kcsl.value+"��");
			FormName.cksl.select();
			return false;
		}

		if (parseFloat(FormName.cksl.value) > parseFloat(FormName.xcksl.value))
		{
			alert("���󣡡��������������ܴ��ڡ����������:"+FormName.xcksl.value+"��");
			FormName.cksl.select();
			return false;
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

			if (parseFloat(FormName.cksl[i].value) > parseFloat(FormName.kcsl[i].value))
			{
				alert("���󣡡��������������ܴ��ڡ��������:"+FormName.kcsl[i].value+"��");
				FormName.cksl[i].select();
				return false;
			}

			if (parseFloat(FormName.cksl[i].value) > parseFloat(FormName.xcksl[i].value))
			{
				alert("���󣡡��������������ܴ��ڡ����������:"+FormName.xcksl[i].value+"��");
				FormName.cksl[i].select();
				return false;
			}
		}
	}

	FormName.action="SaveEditAllJxc_ckmxDd.jsp";
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

