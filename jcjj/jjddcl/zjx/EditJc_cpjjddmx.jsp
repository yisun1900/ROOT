<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cpjjbh=null;
String cpjjfg=null;
String cpjjmc=null;
String xh=null;
String gg=null;
String cpjjxl=null;
String cpjjcz=null;
double bzdj=0;
String zjhsl=null;
double zjhzj=0;
double zqzjhzj=0;
String cpsm=null;
String bz=null;
String cpjjhs=null;
String cpbz=null;
String wherecpjjbh=cf.GB2Uni(request.getParameter("cpjjbh"));
String zjxxh=request.getParameter("zjxxh");
String ddbh=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String dqbm=null;
try {
	conn=cf.getConnection();

	String lx=null;
	ls_sql="select lx,ddbh ";
	ls_sql+=" from  jc_cpjjzjxmx";
	ls_sql+=" where  zjxxh='"+zjxxh+"' and cpjjbh='"+wherecpjjbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lx=cf.fillNull(rs.getString("lx"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
	}
	else{
		out.println("���󣡲����ڵ�[��Ʒ�Ҿ߱��]");
		return;
	}
	rs.close();
	ps.close();
	if (lx.equals("1"))//1��������Ŀ��2��������Ŀ
	{
		out.println("����[������Ŀ]�����ڴ��޸���ϸ");
		return;
	}

	ls_sql="select cpjjbh,cpjjfg,cpjjmc,xh,gg,cpjjxl,cpjjcz,bzdj,zjhsl,zjhzj,zqzjhzj,cpsm,bz,cpjjhs,cpbz ";
	ls_sql+=" from  jc_cpjjddmx";
	ls_sql+=" where  (ddbh='"+ddbh+"') and  (cpjjbh='"+wherecpjjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpjjbh=cf.fillNull(rs.getString("cpjjbh"));
		cpjjfg=cf.fillNull(rs.getString("cpjjfg"));
		cpjjmc=cf.fillNull(rs.getString("cpjjmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		cpjjxl=cf.fillNull(rs.getString("cpjjxl"));
		cpjjcz=cf.fillNull(rs.getString("cpjjcz"));
		bzdj=rs.getDouble("bzdj");
		zjhsl=cf.fillNull(rs.getString("zjhsl"));
		zjhzj=rs.getDouble("zjhzj");
		zqzjhzj=rs.getDouble("zqzjhzj");
		cpsm=cf.fillNull(rs.getString("cpsm"));
		bz=cf.fillNull(rs.getString("bz"));
		cpjjhs=cf.fillNull(rs.getString("cpjjhs"));
		cpbz=cf.fillNull(rs.getString("cpbz"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm ";
	ls_sql+=" from jc_jjdd,sq_dwxx";
	ls_sql+=" where jc_jjdd.fgsbh=sq_dwxx.dwbh and jc_jjdd.ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJc_cpjjddmx.jsp" name="insertform" >
  <div align="center">��Ʒ�Ҿ������������ţ�<%=zjxxh%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font>�ͺ�</td>
      <td width="32%"> 
        <input type="text" name="xh" value="<%=xh%>" size="20" maxlength="50" onKeyUp="keyTo(gg)" onChange="getXh(insertform)">
      </td>
      <td align="right" width="20%"><font color="#FF0000">*</font>���</td>
      <td width="31%"> 
        <select name="gg" style="FONT-SIZE:12PX;WIDTH:152PX"  onKeyUp="keyTo(cpjjcz)" onChange="getGg(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct gg c1,gg c2 from  jc_cpjjbj where dqbm='"+dqbm+"' and xh='"+xh+"' order by gg",gg);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font>����</td>
      <td width="32%"> 
        <select name="cpjjcz" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(cpjjhs)" onChange="getCpjjcz(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjcz c1,cpjjcz c2 from jc_cpjjbj where  dqbm='"+dqbm+"' and xh='"+xh+"' and gg='"+gg+"' order by cpjjcz",cpjjcz);
%> 
        </select>
      </td>
      <td align="right" width="20%"><font color="#FF0000">*</font>��ɫ����</td>
      <td width="31%"> 
        <select name="cpjjhs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jdm_cpjjhs.cpjjhs c1,jdm_cpjjhs.cpjjhs c2 from  jdm_cpjjhs,jdm_cpjjcz where jdm_cpjjhs.cpjjczbm=jdm_cpjjcz.cpjjczbm and jdm_cpjjcz.cpjjcz='"+cpjjcz+"' order by jdm_cpjjhs.cpjjhs",cpjjhs);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">����</font></td>
      <td width="32%"> 
        <input type="text" name="cpjjmc" value="<%=cpjjmc%>" size="20" maxlength="50" readonly>
      </td>
      <td align="right" width="20%"><font color="#FF0000">*</font><font color="#0000CC">����</font></td>
      <td width="31%"> 
        <input type="text" name="bzdj" size="20" maxlength="17"  value="<%=bzdj%>" readonly onChange="f_jszj(insertform)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">���</font></td>
      <td width="32%"> 
        <input type="text" name="cpjjfg" value="<%=cpjjfg%>" size="20" maxlength="50" readonly>
      </td>
      <td align="right" width="20%"><font color="#0000CC">ϵ������</font></td>
      <td width="31%"> 
        <input type="text" name="cpjjxl" value="<%=cpjjxl%>" size="20" maxlength="50" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font>����</td>
      <td width="32%"> 
        <input type="text" name="sl" size="20" maxlength="8"  value="<%=zjhsl%>" onchange="f_jszj(insertform)">
      </td>
      <td align="right" width="20%"><font color="#FF0000">*</font><font color="#0000CC">�ܼ�</font></td>
      <td width="31%"> 
        <input type="text" name="zj" size="20" maxlength="17"  value="<%=zqzjhzj%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">��Ʒ˵��</font></td>
      <td colspan="3"> 
        <textarea name="cpsm" cols="74" rows="6"><%=cpsm%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">��Ʒ��ע</font></td>
      <td colspan="3"> 
        <textarea name="cpbz" cols="74" rows="1"><%=cpbz%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">������ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="74" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(insertform)">
          <input type="reset"  value="����">
          <input type="hidden" name="whereddbh"  value="<%=ddbh%>" >
          <input type="hidden" name="wherecpjjbh"  value="<%=wherecpjjbh%>" >
          <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
          <input type="hidden" name="dqbm" value="<%=dqbm%>" >
          <input type="hidden" name="cpjjbh" size="20" maxlength="4"  value="<%=cpjjbh%>" >
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function getXh(FormName)
{
	if(FormName.xh.value=="") 
	{
		alert("������[�ͺ�]��");
		FormName.xh.focus();
		return false;
	}

	FormName.gg.value="";
	FormName.cpjjcz.value="";
	FormName.cpjjhs.value="";
	FormName.bzdj.value="";
	FormName.zj.value="";

	var str="Jc_cpjjddmxCx.jsp?dqbm=<%=dqbm%>&xh="+escape(escape(FormName.xh.value));
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getGg(FormName)
{
	if(FormName.xh.value=="") 
	{
		alert("������[�ͺ�]��");
		FormName.xh.focus();
		return false;
	}
	if(FormName.gg.value=="") 
	{
		alert("������[���]��");
		FormName.gg.focus();
		return false;
	}

	FormName.cpjjcz.value="";
	FormName.cpjjhs.value="";
	FormName.bzdj.value="";
	FormName.zj.value="";

	var str="Jc_cpjjddmxCx.jsp?dqbm=<%=dqbm%>&xh="+escape(escape(FormName.xh.value))+"&gg="+escape(escape(FormName.gg.value));
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getCpjjcz(FormName)
{
	if(FormName.xh.value=="") 
	{
		alert("������[�ͺ�]��");
		FormName.xh.focus();
		return false;
	}
	if(FormName.gg.value=="") 
	{
		alert("������[���]��");
		FormName.gg.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjcz)=="") {
		alert("��ѡ��[����]��");
		FormName.cpjjcz.focus();
		return false;
	}

	FormName.cpjjhs.value="";
	FormName.bzdj.value="";
	FormName.zj.value="";

	var str="Jc_cpjjddmxCx.jsp?dqbm=<%=dqbm%>&xh="+escape(escape(FormName.xh.value))+"&gg="+escape(escape(FormName.gg.value))+"&cpjjcz="+escape(escape(FormName.cpjjcz.value));
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function addGg(str)
{
	strToItem1(insertform.gg,str);
}

function addCpjjcz(str)
{
	strToItem1(insertform.cpjjcz,str);
}

function addCpjjhs(str)
{
	strToItem1(insertform.cpjjhs,str);
}

function f_jszj(FormName)//����FormName:Form������
{
	var je=FormName.bzdj.value*FormName.sl.value;
	je=round(je,2);
	FormName.zj.value=je;
}

function f_do(FormName)//����FormName:Form������
{
	if(FormName.xh.value=="") 
	{
		alert("������[�ͺ�]��");
		FormName.xh.focus();
		return false;
	}
	if(FormName.gg.value=="") 
	{
		alert("������[���]��");
		FormName.gg.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjcz)=="") {
		alert("��ѡ��[����]��");
		FormName.cpjjcz.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjhs)=="") {
		alert("��ѡ��[��ɫ����]��");
		FormName.cpjjhs.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjfg)=="") {
		alert("��ѡ��[���]��");
		FormName.cpjjfg.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjmc)=="") {
		alert("��ѡ��[����]��");
		FormName.cpjjmc.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjbh)=="") {
		alert("������[��Ʒ�Ҿ߱�ţ�4λ��]��");
		FormName.cpjjbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bzdj)=="") {
		alert("������[����]��");
		FormName.bzdj.focus();
		return false;
	}
	if(!(isFloat(FormName.bzdj, "����"))) {
		return false;
	}
	
	f_jszj(FormName);

	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "����"))) {
		return false;
	}

	if(	javaTrim(FormName.zj)=="") {
		alert("������[�ܼ�]��");
		FormName.zj.focus();
		return false;
	}
	if(!(isFloat(FormName.zj, "�ܼ�"))) {
		return false;
	}
	if (parseFloat(FormName.zj.value)<=0)
	{
		alert("[�ܼ�]����Ϊ0��");
		FormName.zj.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
