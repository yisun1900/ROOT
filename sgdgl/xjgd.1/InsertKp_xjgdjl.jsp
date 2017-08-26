<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");
String xjr=cf.GB2Uni(request.getParameter("ysr"));
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
//����¼��
String xjjlh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgdmc=null;
String sgd=null;
String zjxm=null;
String sgbz=null;

int count=0;

try {
	conn=cf.getConnection();

//����¼��
	ls_sql="select NVL(max(substr(xjjlh,8,3)),0)";
	ls_sql+=" from  kp_xjgdjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xjjlh=khbh+cf.addZero(count+1,3);

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,crm_khxx.sgd,sgdmc,zjxm,sgbz";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	rs.close();
	ps.close();

	if (xjr.equals(""))
	{
		xjr=zjxm;
	}


}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
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
<body bgcolor="#FFFFFF">
<%
if (count>0)
{
	%>
	<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">����¼��</td>
		<td  width="6%">ʩ����</td>
		<td  width="7%">�����ܶ�</td>
		<td  width="6%">�۷�</td>
		<td  width="7%">�۳��ӵ���ٷֱ�</td>
		<td  width="10%">�������</td>
		<td  width="12%">�����</td>
		<td  width="22%">�������</td>
		<td  width="6%">�����</td>
		<td  width="8%">���ʱ��</td>
		<td  width="8%">������־</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT kp_xjgdjl.xjjlh,sgdmc,fkze,kfzs,kp_xjgdjl.kcjdebl||'%',xjlxmc,xjjgmc,xjwtflmc,kp_xjgdjl.xjr,kp_xjgdjl.xjsj,DECODE(kp_xjgdjl.cfspbz,'1','��������','2','δ����','3','����ͨ��','4','����δͨ��')";
	ls_sql+=" FROM kp_xjgdjl,sq_sgd,kp_xjlxbm,dm_xjjgbm,dm_xjwtflbm  ";
    ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+) and kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm(+)";
    ls_sql+=" and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm";
    ls_sql+=" and kp_xjgdjl.xjwtflbm=dm_xjwtflbm.xjwtflbm(+)";
    ls_sql+=" and kp_xjgdjl.khbh='"+khbh+"'";
    ls_sql+=" order by kp_xjgdjl.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(400);//����ÿҳ��ʾ��¼��


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"xjjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewKp_xjgdjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xjjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
}
%> 
</table>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�����ʼ촦������¼�ţ�<%=xjjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
               <font color="#000099">�ͻ����</font>            </td>
              <td width="32%"><%=khbh%> </td>
              <td width="18%" align="right"> <font color="#000099">ʵ��������</font>              </td>
              <td width="32%"><%=sjkgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">�ͻ�����</font></td>
              <td width="32%"><%=khxm%></td>
              <td width="18%" align="right"><font color="#000099">���ݵ�ַ</font></td>
              <td width="32%"><%=fwdz%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">���ʦ</font></td>
              <td width="32%"><%=sjs%></td>
              <td width="18%" align="right"><font color="#000099">ʩ����</font></td>
              <td width="32%"><%=sgdmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">�ʼ�����</font></td>
              <td width="32%"><%=zjxm%></td>
              <td width="18%" align="right"><font color="#000099">ʩ������</font></td>
              <td width="32%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�������</td>
              <td width="32%"> 
                <select name="xjlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_jszk(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xjlxbm,xjlxmc from kp_xjlxbm order by xjlxbm","");
%> 
              </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>�����</td>
              <td width="32%"><select name="xjjgbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
		cf.selectItem(out,"select xjjgbm,xjjgmc from dm_xjjgbm order by xjjgbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�������</td>
              <td><select name="xjwtflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
		cf.selectItem(out,"select xjwtflbm,xjwtflmc from dm_xjwtflbm order by xjwtflbm","");
%>
              </select></td>
              <td align="right"><font color="#FF0000">*</font>�������</td>
              <td><input type="text" name="jlje" value="0" size="20" maxlength="16" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <div align="right"><font color="#FF0000">*</font>�����</div>              </td>
              <td width="32%"> 
              <input type="text" name="xjr" value="" size="20" maxlength="20">              </td>
              <td width="18%"> 
              <div align="right"><font color="#FF0000">*</font>���ʱ��</div>              </td>
              <td width="32%"> 
              <input type="text" name="xjsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
              <td width="32%"> 
              <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
              <td width="32%"> 
              <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font></td>
              <td width="32%"> 
                <select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'","");
%> 
              </select>              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
              <div align="right">��ע</div>              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="74" rows="5"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="xjjlh" value="<%=xjjlh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="sgd" value="<%=sgd%>" >
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="button"  value="����¼��" onClick="window.open('PlInsertKp_xjgdmx.jsp?xjjlh=<%=xjjlh%>')" name="pllr" disabled>
                <input type="button"  value="����¼��" onClick="window.open('yrk_lrxxmain.jsp?xjjlh=<%=xjjlh%>')" name="lr" disabled=true >
                <input type="button"  value="�鿴�����Ŀ" onClick="window.open('Kp_xjgdmxList.jsp?xjjlh=<%=xjjlh%>')" name="cx" disabled=true>
                <input type="button"  value="�ϴ���Ƭ" onClick="f_lrzp(insertform)" name="lrzp" disabled>
                <input type="button"  value="�鿴��Ƭ" onClick="f_ckzp(insertform)" name="ckzp" disabled>
                <input type="reset"  value="����" name="reset">              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xjjlh)=="") {
		alert("������[����¼��]��");
		FormName.xjjlh.focus();
		return false;
	}

	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("������[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.xjlxbm)=="") {
		alert("������[�������]��");
		FormName.xjlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xjjgbm)=="") {
		alert("������[�����]��");
		FormName.xjjgbm.focus();
		return false;
	}
	if (FormName.xjjgbm.value=="11")
	{
		if(	javaTrim(FormName.xjwtflbm)!="") {
			alert("û���⣬��������[�������]��");
			FormName.xjwtflbm.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.xjwtflbm)=="") {
			alert("������[�������]��");
			FormName.xjwtflbm.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.jlje)=="") {
		alert("��ѡ��[�������]��");
		FormName.jlje.focus();
		return false;
	}
	if(!(isFloat(FormName.jlje, "�������"))) {
		return false;
	}

	if(	javaTrim(FormName.xjr)=="") {
		alert("������[�����]��");
		FormName.xjr.focus();
		return false;
	}
	if(	javaTrim(FormName.xjsj)=="") {
		alert("������[���ʱ��]��");
		FormName.xjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xjsj, "���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}

	FormName.action="SaveInsertKp_xjgdjl.jsp";
	FormName.submit();
	FormName.pllr.disabled=false;
	FormName.lr.disabled=false;
	FormName.cx.disabled=false;
	FormName.lrzp.disabled=false;
	FormName.ckzp.disabled=false;
	return true;
}
function f_jszk(FormName)//����FormName:Form������
{
	if ((FormName.xjlxbm.options[1].selected))
	{
		FormName.xjr.value="<%=zjxm%>";
	}
	else
	{
		FormName.xjr.value="";
	}
	
}
function f_lrzp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xjjlh)=="") {
		alert("������[����¼��]��");
		FormName.xjjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ckzp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xjjlh)=="") {
		alert("������[����¼��]��");
		FormName.xjjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
