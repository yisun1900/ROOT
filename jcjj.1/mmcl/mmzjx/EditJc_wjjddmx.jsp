<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String xh=null;
String dj=null;
String bzdj=null;
String zjhsl=null;
String bz=null;

String wjjbm=null;
String mmsbsbm=null;
String xinghao=null;
String xinghao1=null;


String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String dqbm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select yddbh,xh,dj,bzdj,zjhsl,bz,wjjbm,mmsbsbm,xinghao ";
	ls_sql+=" from  jc_wjjddmx";
	ls_sql+=" where  lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		xh=cf.fillNull(rs.getString("xh"));
		dj=cf.fillNull(rs.getString("dj"));
		bzdj=cf.fillNull(rs.getString("bzdj"));
		zjhsl=cf.fillNull(rs.getString("zjhsl"));
		bz=cf.fillNull(rs.getString("bz"));

		wjjbm=cf.fillNull(rs.getString("wjjbm"));
		mmsbsbm=cf.fillNull(rs.getString("mmsbsbm"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm ";
	ls_sql+=" from jc_mmydd,sq_dwxx ";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select xinghao";
	ls_sql+=" from  jc_wjjbj";
	ls_sql+=" where  xh="+xh;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xinghao1=cf.fillNull(rs.getString("xinghao"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " +e);
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">���޸����������ϸ����������ţ�<%=zjxxh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_wjjddmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">������</td>
              <td width="32%"> 
                <select name="wjjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getWjjbm(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wjjbm,wjjmc from jdm_wjjbm order by wjjbm",wjjbm);
%> 
                </select>
              </td>
              <td width="19%" align="right">������</td>
              <td width="31%"> 
                <select name="mmsbsbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getBm()">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmsbsbm,mmsbsmc||':'||bm from jdm_mmsbsbm order by mmsbsbm",mmsbsbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����</td>
              <td colspan="3"> 
                <select name="xh" style="FONT-SIZE:12PX;WIDTH:510PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,wjmc||'��:'||dj from jc_wjjbj,jdm_wjjbm where jc_wjjbj.wjjbm=jdm_wjjbm.wjjbm and jc_wjjbj.wjjbm='"+wjjbm+"' and jc_wjjbj.dqbm='"+dqbm+"' order by xh",xh);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�ͺ�</td>
              <td colspan="3"> 
                <input type="text" name="xinghao" value="<%=xinghao%>" size="71" maxlength="50" >
                <input type="hidden" name="xinghao1" value="<%=xinghao1%>" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">����</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="dj" size="20" maxlength="9"  value="<%=bzdj%>" readonly>
              </td>
              <td width="19%"> 
                <div align="right">��������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="zjhsl" size="20" maxlength="8"  value="<%=zjhsl%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="69" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center">
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����">
                  <input type="hidden" name="lrxh"  value="<%=lrxh%>" >
                  <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
                  <input type="hidden" name="yddbh" value="<%=yddbh%>">
                </div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function getWjjbm(FormName)
{
	FormName.mmsbsbm.value="";
	FormName.dj.value="";
	FormName.zjhsl.value="";

	var str="Jc_wjjbjCx.jsp?dqbm=<%=dqbm%>&wjjbm="+FormName.wjjbm.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}
function getDj(FormName)
{

	var str="Jc_wjjbjCx.jsp?dqbm=<%=dqbm%>&xh="+FormName.xh.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function addItem(f1,text,value)
{
	var op1=document.createElement("OPTION");
	op1.text=text;
	op1.value=value;
	f1.add(op1);
}

function getBm()//����FormName:Form������
{
	if ((insertform.mmsbsbm.value!="") && (insertform.xinghao1.value.indexOf("**")!=-1))
	{
		insertform.xinghao.value=replace(insertform.xinghao1.value,"**",getSubStr(insertform.mmsbsbm));
	}
	else{
		insertform.xinghao.value=insertform.xinghao1.value;
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("��ѡ��[�������]��");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "�������"))) {
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
	if(	javaTrim(FormName.zjhsl)=="") {
		alert("������[��������]��");
		FormName.zjhsl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjhsl, "��������"))) {
		return false;
	}
	if (parseFloat(FormName.zjhsl.value)<=0)
	{
		alert("����[����]�������0��");
		FormName.zjhsl.select();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
