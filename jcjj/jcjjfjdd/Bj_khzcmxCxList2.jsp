<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<form method="POST" name="listform" action="" target="_blank">

  <table border="0" cellspacing="2" bgcolor="#999999" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
	
	<tr bgcolor="#FFFF99"    >
	  <td width="25%" ><span class="STYLE1">�ṹλ��</span>	    
	    <select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:118PX" >
          <option value=""></option>
          <%
				cf.selectItem(out,"select jgwzbm c1,jgwzbm c2 from bj_fjxx where khbh='"+khbh+"' order by xuhao","");
			%>
      </select></td>
	  <td width="25%" ><span class="STYLE1">���Ĵ���</span>	    
	    <select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:118PX" onChange="changeDl(listform)">
          <option value=""></option>
          <%
				cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
			%>
      </select></td>
	  <td width="25%"><span class="STYLE1">Ʒ&nbsp;&nbsp;&nbsp;&nbsp;��</span>	    
	  <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:118PX" >
          <option value=""></option>
      </select></td>
	  <td width="25%" bgcolor="#CCCCCC" ><input type="button" value='��  ѯ' onClick="f_cx(listform)" >
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value='��  ��' onClick="f_do(listform)"  >
	  
		<input type="hidden" name="khbh" value="<%=khbh%>" >
		<input type="hidden" name="dxpzcsq" value="<%=dxpzcsq%>" >
	  <input type="hidden" name="dqbm" value="<%=dqbm%>" >	  </td>
    </tr>
	<tr bgcolor="#FFFF99"    >
	  <td bgcolor="#FFFF99" ><strong>��&nbsp;&nbsp;&nbsp;&nbsp;��</strong>
      <input type="text" name="clmc" size="15" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  onChange="changeXh(listform)"></td>
	  <td ><strong>��&nbsp;&nbsp;&nbsp;&nbsp;��</strong>
      <input type="text" name="xh" size="15" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  onChange="changeXh(listform)"></td>
	  <td ><strong>��&nbsp;&nbsp;&nbsp;&nbsp;��</strong>
      <input type="text" name="gg" size="15" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  onChange="changeXh(listform)"></td>
	  <td ><strong>ϵ&nbsp;&nbsp;��</strong>
      <input type="text" name="cllbbm" size="15" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  onChange="changeXh(listform)"></td>
    </tr>
	<tr bgcolor="#FFFFFF"    >
	  <td colspan="3" ><span class="STYLE1">���ı���</span>	    
	    <select name="zcbm" style="FONT-SIZE:12PX;WIDTH:525PX" onChange="changeBm(listform)">
	      <option value=""></option>
	      <option value="0">�����롾���ơ��ͺš�����ϵ�С����ѯ��ťģ����ѯ</option>
      </select></td>
	  <td ><span class="STYLE1">��&nbsp;&nbsp;��</span>
      <input type="text" name="dj" size="15" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
    </tr>
	<tr bgcolor="#FFFFFF"    >
	  <td ><span class="STYLE1">��&nbsp;&nbsp;&nbsp;&nbsp;��</span>
      <input type="text" name="sl" size="15" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
	  <td ><span class="STYLE1">Զ&nbsp;��&nbsp;��</span>
      <input type="text" name="ycf" size="15" value="0" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
	  <td ><span class="STYLE1">��������</span>	    
	    <select name="qtfy" style="FONT-SIZE:12PX;WIDTH:118PX"  >
          <option value=""></option>
          <%
					cf.selectToken(out,"1+��װ��&2+�ӹ���&3+�����շ�&W+��","W");
				%>
      </select></td>
	  <td ><span class="STYLE1">������</span>
      <input type="text" name="qtfyje" size="15" value="0" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
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

var fieldName="";
function changeDl(FormName)
{
	FormName.ppmc.length=1;
	fieldName="ppmc";

	if (FormName.zcdlbm.value=="")
	{
		return;
	}

	var sql;
	sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='<%=ssfgs%>' and jxc_ppxx.cldl='"+listform.zcdlbm.value+"' order by jxc_ppxx.ppmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(codeSQL(actionStr));
	openAjax(actionStr);

}


function changeBm(FormName)
{
	FormName.dj.value="";

	if (FormName.zcbm.value=="")
	{
		return;
	}

	fieldName="dj";

	
//	var actionStr="GetCpxxByAjax.jsp?dqbm=<%=dqbm%>&clbm="+listform.zcbm.value;
	var actionStr="GetCpxxByAjax.jsp?ssfgs=<%=dxpzcsq%>&clbm="+listform.zcbm.value;

//	window.open(codeSQL(actionStr));
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="ppmc")
	{
		strToItem2(listform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="cpbm")
	{
		strToSelect(listform.zcbm,ajaxRetStr);
	}
	else if (fieldName=="dj")
	{
		listform.dj.value=ajaxRetStr;
	}
}





function f_cx(FormName)
{
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}

	FormName.zcbm.length=1;


	fieldName="cpbm";

	var sql;

	sql="select jxc_clbm.clbm,clmc||'��'||xh||'����'||gg||'����'||cllbbm||'��'||'��'||xsj||'/'||jldwbm||'��' ";
	sql+=" FROM jxc_clbm,jxc_cljgb";
	sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
	sql+=" and jxc_clbm.cllb='0'";//0�����ģ�1������
//	sql+=" and jxc_cljgb.sfyh='Y'";//Y���л���N���޻�
//	sql+=" and jxc_cljgb.xsfs in('1')";//1������Ʒ��2���ֻ����ۣ�3������޻�������
//	sql+=" and jxc_clbm.ppmc='"+trim(listform.ppmc.value)+"' and jxc_cljgb.dqbm='<%=dqbm%>'";
	sql+=" and jxc_clbm.ppmc='"+trim(listform.ppmc.value)+"' and jxc_cljgb.ssfgs='<%=dxpzcsq%>'";

	if (trim(FormName.clmc.value)!="")
	{
		sql+=" and jxc_clbm.clmc like '%"+trim(FormName.clmc.value)+"%'";
	}
	if (trim(FormName.xh.value)!="")
	{
		sql+=" and jxc_clbm.xh like '%"+trim(FormName.xh.value)+"%'";
	}
	if (trim(FormName.gg.value)!="")
	{
		sql+=" and jxc_clbm.gg like '%"+trim(FormName.gg.value)+"%'";
	}
	if (trim(FormName.cllbbm.value)!="")
	{
		sql+=" and jxc_clbm.cllbbm like '%"+trim(FormName.cllbbm.value)+"%'";
	}

	sql+=" order by jxc_clbm.clmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(codeSQL(actionStr));
	openAjax(actionStr);

} 



function f_do(FormName)
{
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("������[�ṹλ��]��");
		FormName.jgwzbm.focus();
		return false;
	}

	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}



	if(	javaTrim(FormName.zcbm)=="") {
		alert("������[���ı���]��");
		FormName.zcbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.ycf)=="") {
		alert("������[Զ�̷�]��");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "Զ�̷�"))) {
		return false;
	}

	if(	javaTrim(FormName.qtfy)=="") {
		alert("������[��������]��");
		FormName.qtfy.focus();
		return false;
	}

	if(FormName.qtfy.value!="W") 
	{
		if(	javaTrim(FormName.qtfyje)=="") {
			alert("������[������]��");
			FormName.qtfyje.focus();
			return false;
		}
		if(!(isFloat(FormName.qtfyje, "������"))) {
			return false;
		}
		if (FormName.qtfyje.value=="0")
		{
			alert("[������]����Ϊ0��");
			FormName.qtfyje.select();
			return false;
		}
	}
	else{
		FormName.qtfyje.value="0";
	}



	FormName.target="xg";
	FormName.action="SaveInsertBj_khzcmx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

