<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String khbh=request.getParameter("khbh");
String bjjb=request.getParameter("bjjb");

if (khbh.equals(""))
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

String bjbbh=null;
String ssfgs=null;
String hxbm=null;
String dqbm=null;

String dxpzcsq="";//����Ʒ������Ȩ
try {
	conn=cf.getConnection();

	ls_sql="select bjbbh,ssfgs,hxbm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		hxbm=rs.getString("hxbm");
	}
	rs.close();
	ps.close();

	ls_sql="select dxpzcsq,dqbm";
	ls_sql+=" from sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dxpzcsq=cf.fillNull(rs.getString("dxpzcsq"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<form method="POST" name="listform" action="" target="_blank">

  <table border="0" cellspacing="1" bgcolor="#999999" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"  >
	  <td colspan="10" height="30">
		<input type="hidden" name="khbh" value="<%=khbh%>" >
		<input type="hidden" name="dxpzcsq" value="<%=dxpzcsq%>" >
		<input type="hidden" name="dqbm" value="<%=dqbm%>" >
		  <input type="button" value=' ��  �� ' onClick="f_do(listform)" name="sl">
		</td>
	</tr>
	<tr bgcolor="#CCCCFF" height="25" align="center"  >
	  <td width="8%">�ṹλ��</td>
	  <td width="8%">���Ĵ���</td>
	  <td width="10%">Ʒ��</td>
	  <td width="7%">�ͺ�(ǰ3)</td>
	  <td width="36%">���ı���</td>
	  <td width="6%">����</td>
	  <td width="6%">����</td>
	</tr>

<%
	int row=-1;//ͬ�������к�
	for (int i=0;i<10 ;i++ )
	{
		row++;
		//���ÿ������
		%>
		<tr bgcolor="#FFFFFF" align="center" >
		  <td>
			<select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:70PX"  >
				<option value=""></option>
				<%
				cf.selectItem(out,"select jgwzbm c1,jgwzbm c2 from bj_fjxx where khbh='"+khbh+"' order by xuhao","");
			%>
			  </select>			
		  </td>
		  <td>
			<select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:70PX" onChange="changeDl(listform,<%=row%>)">
				<option value=""></option>
				<%
				cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
			%>
			  </select>			
		  </td>
		  <td>
			<select name="ppmc" style="FONT-SIZE:12PX;WIDTH:90PX" onChange="changePp(listform,<%=row%>)">
			<option value=""></option>
		  </select>			
		  <td>
			  <select name="xh" style="FONT-SIZE:12PX;WIDTH:60PX"  onChange="changeXh(listform,<%=row%>)">
				<option value=""></option>
				<option value="0">����ѡ��Ʒ��</option>
			  </select>	
		  </td>
		  </td>
		  <td>
			  <select name="zcbm" style="FONT-SIZE:12PX;WIDTH:335PX" onChange="changeBm(listform,<%=row%>)">
				<option value=""></option>
				<option value="0">����ѡ���ͺ�</option>
			  </select>	
		  </td>

		  <td>
			<input type="text" name="sl" size="6" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		  </td>
		  <td align="left">
			<input type="hidden" name="ycf"  value="0" >
			<input type="hidden" name="qtfy" value="W" >
			<input type="hidden" name="qtfyje" value="0" >
			<input type="text" name="dj" size="6" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
		  </td>
		</tr>
		<%
	}
%>
</table>

<BR>
<table border="0" cellspacing="1" bgcolor="#999999" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCFF" height="20" align="center"  >
  <td width="9%">�ṹλ��</td>
  <td width="9%">Ʒ��</td>
  <td width="13%">����</td>
  <td width="14%">�ͺ�</td>
  <td width="13%">���</td>
  <td width="8%">����</td>
  <td width="6%">ԭ��</td>
  <td width="7%">����</td>
</tr>

<%
	int row1=-1;//ͬ�������к�


	//�ײ������������:��Ϊ��
	String jgwzbm=null;
	String lrxh=null;
	String zcdlbm=null;
	String zcxlbm=null;
	String zcbm=null;
	String zcmc=null;
	String ppmc=null;
	String jldwbm=null;
	String xinghao=null;
	String gg=null;
	double zqdj=0;
	double dpzk=0;
	double dj=0;
	double sl=0;
	double ycf=0;
	String qtfy=null;
	double qtfyje=0;

	ls_sql="SELECT zcpzwzbm,xh,zcdlbm,zcxlbm,zcbm,zcmc,ppmc,xinghao,gg,zcysbm,jldwbm,zqdj,dpzk,zqdj,dpzk,dj,sl,ycf,qtfy,qtfyje";
	ls_sql+=" FROM bj_khzcmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by zcpzwzbm,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		lrxh=rs.getString("xh");
		zcdlbm=rs.getString("zcdlbm");
		zcxlbm=rs.getString("zcxlbm");

		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		gg=cf.fillNull(rs.getString("gg"));


		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		ycf=rs.getDouble("ycf");
		qtfy=cf.fillNull(rs.getString("qtfy"));
		qtfyje=rs.getDouble("qtfyje");

		row1++;


		if (row1%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}


		//���ÿ������
		%>
		<tr bgcolor="<%=bgcolor%>" align="center"  >
		  <td>
			<input type="hidden" name="lrxh" value="<%=lrxh%>">
		    <select name="jgwzbm1" style="FONT-SIZE:12PX;WIDTH:70PX"  >
				<option value=""></option>
				<%
				cf.selectItem(out,"select jgwzbm c1,jgwzbm c2 from bj_fjxx where khbh='"+khbh+"' order by xuhao",jgwzbm);
			%>
			  </select>			
		  </td>
		  <td><%=ppmc%></td>
		  <td><%=zcmc%></td>
		  <td align="left"><image src="del.jpg" width="20" onclick="f_del(listform,<%=lrxh%>)"></image>&nbsp;<%=xinghao%></td>
		  <td><%=gg%></td>
		  <td>
			<input type="text" name="sl1" size="6" value="<%=sl%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ><%=jldwbm%></td>
		  </td>
		  <td><%=zqdj%></td>
		  <td align="left">
			<input type="text" name="dj1" size="6" value="<%=dj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
			<input type="hidden" name="ycf1"  value="0" >
			<input type="hidden" name="qtfy1" value="W" >
			<input type="hidden" name="qtfyje1" value="0" >
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();


		

}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
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

var fieldName="";
var rowVal="";
function changeDl(FormName,row)
{
	FormName.ppmc[row].length=1;

	if (FormName.zcdlbm[row].value=="")
	{
		return;
	}

	fieldName="ppmc";
	rowVal=row;

	var sql;
	sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='<%=ssfgs%>' and jxc_ppxx.cldl='"+listform.zcdlbm[row].value+"' order by jxc_ppxx.ppmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(codeSQL(actionStr));
	openAjax(actionStr);

}

function changePp(FormName,row)
{
	FormName.xh[row].length=1;
	FormName.zcbm[row].length=1;

	if (FormName.ppmc[row].value=="")
	{
		return;
	}

	fieldName="xh";
	rowVal=row;

	var sql;
	sql="select distinct substr(jxc_clbm.xh,1,3) aa";
	sql+=" FROM jxc_clbm,jxc_cljgb";
	sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
	sql+=" and jxc_clbm.cllb='0'";//0�����ģ�1������
//	sql+=" and jxc_cljgb.sfyh='Y'";//Y���л���N���޻�
//	sql+=" and jxc_cljgb.xsfs in('1')";//1������Ʒ��2���ֻ����ۣ�3������޻�������
	sql+=" and jxc_clbm.ppmc='"+trim(listform.ppmc[row].value)+"' and jxc_cljgb.dqbm='<%=dqbm%>'";
	sql+=" order by aa";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(codeSQL(actionStr));
	openAjax(actionStr);

}

function changeXh(FormName,row)
{
	FormName.zcbm[row].length=1;

	if (FormName.ppmc[row].value=="")
	{
		return;
	}

	fieldName="cpbm";
	rowVal=row;

	var sql;
	
	if (trim(FormName.xh[row].value)=="null" || FormName.xh[row].value=="")
	{
		sql="select jxc_clbm.clbm,clmc||'��'||xh||'����'||gg||'��'||'��'||xsj||'/'||jldwbm||'��' ";
		sql+=" FROM jxc_clbm,jxc_cljgb";
		sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
		sql+=" and jxc_clbm.cllb='0'";//0�����ģ�1������
	//	sql+=" and jxc_cljgb.sfyh='Y'";//Y���л���N���޻�
	//	sql+=" and jxc_cljgb.xsfs in('1')";//1������Ʒ��2���ֻ����ۣ�3������޻�������
		sql+=" and jxc_clbm.ppmc='"+trim(listform.ppmc[row].value)+"' and jxc_cljgb.dqbm='<%=dqbm%>'";
		sql+=" and jxc_clbm.xh is null ";
		sql+=" order by jxc_clbm.clbm";
	}
	else{
		sql="select jxc_clbm.clbm,clmc||'��'||xh||'����'||gg||'��'||'��'||xsj||'/'||jldwbm||'��' ";
		sql+=" FROM jxc_clbm,jxc_cljgb";
		sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
		sql+=" and jxc_clbm.cllb='0'";//0�����ģ�1������
	//	sql+=" and jxc_cljgb.sfyh='Y'";//Y���л���N���޻�
	//	sql+=" and jxc_cljgb.xsfs in('1')";//1������Ʒ��2���ֻ����ۣ�3������޻�������
		sql+=" and jxc_clbm.ppmc='"+trim(listform.ppmc[row].value)+"' and jxc_cljgb.dqbm='<%=dqbm%>'";
		sql+=" and jxc_clbm.xh like '"+trim(FormName.xh[row].value)+"%'";
		sql+=" order by jxc_clbm.clbm";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(codeSQL(actionStr));
	openAjax(actionStr);

}


function changeBm(FormName,row)
{
	FormName.dj[row].value="";

	if (FormName.zcbm[row].value=="")
	{
		return;
	}

	fieldName="dj";
	rowVal=row;

	
	var actionStr="GetCpxxByAjax.jsp?dqbm=<%=dqbm%>&clbm="+listform.zcbm[row].value;

//	window.open(codeSQL(actionStr));
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="ppmc")
	{
		strToItem2(listform.ppmc[rowVal],ajaxRetStr);
	}
	else if (fieldName=="xh")
	{
		strToItem2(listform.xh[rowVal],ajaxRetStr);
	}
	else if (fieldName=="cpbm")
	{
		strToSelect(listform.zcbm[rowVal],ajaxRetStr);
	}
	else if (fieldName=="dj")
	{
		listform.dj[rowVal].value=ajaxRetStr;
	}
}





function f_do(formName)
{
	formName.action="SaveAllBj_khzcmx.jsp";
	formName.submit();
	return true;
} 

function f_del(formName,xh)
{
	if ( confirm("ȷʵҪɾ����?") )	
	{
		formName.action="DeleteBj_khzcmx.jsp?khbh=<%=khbh%>&xh="+xh;
		formName.submit();
		return true;
	}
} 

//-->
</script>
