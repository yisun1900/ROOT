<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph = request.getParameter("ckph");
%>

<html>
<head>
<title>���ϳ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" align="center">

<form method="post" action="" name="selectform"  >

<div align="center"><b>���ϳ��⣨���ţ�<%=ckph%>��</font></b></div>

<table width="130%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2" >
<tr bgcolor="CCCCCC" align="center"> 
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
	<td width="11%">���</td>
	<td width="6%">���ⵥ��</td>
	<td width="4%">���۷�ʽ</td>
  </tr>
<%

String bgcolor="E8E8FF";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String ddbh=null;
String dqbm = null;
String ckbh = null;
String ckdzt = null;
String ckjxz = null;

int row=0;
try {
	conn=cf.getConnection();    //�õ�����

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
		ddbh=cf.fillNull(rs.getString("lydh"));
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


	//���ݶ�����ѯ������ϸ
	String nbbm=null;
	String clbm=null;
	String zcmc=null;
	String xinghao=null;
	String gg=null;
	String jldwbm=null;
	double sl=0;
	double ycksl=0;
	double xcksl=0;//����������������������ѳ�������
	double cksl=0;
	double dj=0;

	ls_sql = " select zcbm,xsxh,zcmc,xinghao,gg,jldwbm,dj,sl,cksl,sl-cksl xcksl";
	ls_sql+= " from jc_zcddmx ";
	ls_sql+=" where ddbh='"+ddbh+"' ";
	ls_sql+=" and lx='1' ";//1����ͬ�2������ 
	ls_sql+=" order by xh ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=cf.fillNull(rs.getString("zcbm"));
		nbbm=cf.fillNull(rs.getString("xsxh"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		ycksl=rs.getDouble("cksl");
		xcksl=rs.getDouble("xcksl");

		row++;
		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}

		//��ѯ������Ϣ
		double dfgsjg=0;
		double dgzjg=0;
		double jqpjcbj=0;
		double kcsl=0;
		double ckdj=0;
		String xsfs=null;
		String xsfsmc=null;
		ls_sql = " select dfgsjg,dgzjg,jqpjcbj,zcpzsl,xsfs,DECODE(xsfs,'1','����Ʒ','2','�ֻ�','3','�ڻ�','4','�ɸ����') xsfsmc ";
		ls_sql+= " from jxc_cljgb ";
		ls_sql +=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			dfgsjg=rs1.getDouble("dfgsjg");
			dgzjg=rs1.getDouble("dgzjg");
			jqpjcbj=rs1.getDouble("jqpjcbj");
			kcsl=rs1.getDouble("zcpzsl");//����Ʒ������
			xsfs=cf.fillNull(rs1.getString("xsfs"));
			xsfsmc=cf.fillNull(rs1.getString("xsfsmc"));
		}
		else
		{
			rs1.close();
			ps1.close();

			out.print("����:["+clbm+"]�ڵ���["+dqbm+"]�����ڣ�");
			return;
		}
		rs1.close();
		ps1.close();


		ckdj=dj;


		String txxx="&nbsp";

		if (xcksl==0)
		{
			txxx="<font color=blue>�ѳ���<font>";

			cksl=0;
		}
		else{
			if (xsfs.equals("1"))//1������Ʒ����������������������������������ѳ�������
			{
				cksl=xcksl;
			}
			else if (xsfs.equals("2"))//2���ֻ�����
			{
				if (kcsl<xcksl)
				{
					cksl=kcsl;
					if (cksl==0)
					{
						txxx="<font color=red>�޷�����<font>";
					}
					else{
						txxx="<font color=red>��治��<font>";
					}
				}
				else{
					cksl=xcksl;
				}
			}
			else if (xsfs.equals("3"))//3���ڻ�����
			{
				if (kcsl<xcksl)
				{
					cksl=kcsl;
					if (cksl==0)
					{
						txxx="<font color=red>�޷�����<font>";
					}
					else{
						txxx="<font color=red>��治��<font>";
					}
				}
				else{
					cksl=xcksl;
				}
			}
			else if (xsfs.equals("4"))//4����������棻
			{
				if (kcsl<xcksl)
				{
					txxx="<font color=red>�Ѹ����<font>";
				}
				cksl=xcksl;
			}
			else
			{
				out.print("<br><font color=red>���ϣ�"+clbm+"]���۷�ʽ����ȷ�����ڡ����ļ۸���������޸ģ�</font>"+xsfs);
				return;
			}
		}

		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
			<td><%=row%></td>
			<td><%=nbbm%>
				<input type="hidden" name="clbm" value="<%=clbm%>" >
				<input type="hidden" name="kcsl"  value="<%=kcsl%>" >
				<input type="hidden" name="xcksl"  value="<%=xcksl%>" >
				<input type="hidden" name="xsfs"  value="<%=xsfs%>" >
				<input type="hidden" name="cbdj"  value="<%=jqpjcbj%>" >
			</td>
			<td><%=zcmc%></td>
			<td><%=xinghao%></td>
			<td><%=jldwbm%></td>
			<td><%=sl%></td>
			<td><%=ycksl%></td>
			<td><%=kcsl%></td>
			<td > 
				<input type="text" name="cksl"  value="<%=cksl%>" size="9" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			</td>
			<td><%=txxx%></td>
			<td > 
				<select name="hjbh" style="FONT-SIZE:12PX;WIDTH:112PX" onChange="changeHj(selectform,'<%=clbm%>',<%=row%>)">
				  <option value=""></option>
				  <%
						cf.selectItem(out,"select distinct jxc_kcb.hjbh,jxc_hjmc.hjmc from jxc_kcb,jxc_hjmc where jxc_kcb.hjbh=jxc_hjmc.hjbh and jxc_kcb.ckbh='"+ckbh+"' and jxc_kcb.clbm='"+clbm+"' order by jxc_kcb.hjbh","");
					%>
				</select>      
			</td>
			<td > 
				<select name="scph" style="FONT-SIZE:12PX;WIDTH:92PX" >
				  <option value=""></option>
				</select>      
			</td>
			<td><%=gg%></td>
			<td>
				<input type="hidden" name="ckdj"  value="<%=ckdj%>" ><%=ckdj%>
			</td>
			<td><%=xsfsmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch(Exception e){
	out.print("<BR>����ʧ��,��������: " + e+ls_sql);
}
finally{
	try{
		if (rs!= null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
}
%>

<tr bgcolor="CCCCCC" align="center"> 
	<td colspan="15"> 
		<input type="hidden" name="ckph"  value="<%=ckph%>" >
		<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
		<input type="hidden" name="ckbh"  value="<%=ckbh%>" >
		<input type="button"  value=" �� �� " onClick="f_do(selectform)">
	</td>
</tr>
</table>

</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
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
		strToSelect(selectform.scph[currow],ajaxRetStr);
	}
	else{
		strToSelect(selectform.scph,ajaxRetStr);
	}
}


function f_do(FormName)//����FormName:Form������
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

		if (parseFloat(FormName.cksl.value)<0)
		{
			alert("����������������С��0������");
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

			if (parseFloat(FormName.cksl[i].value)<0)
			{
				alert("����������������С��0������");
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

	FormName.action="SaveInsertJxc_ckmxDd.jsp" 
	FormName.submit();
	return true;
}
//-->
</SCRIPT>