<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String gcyszxmbm=null;
String gcjdbm=null;
String yssj=null;
String ysr=null;
String lrr=null;
String lrsj=null;
String lrdw=null;
String bz=null;
String ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;

try {
	conn=cf.getConnection();

	ls_sql="select khbh,gcyszxmbm,gcjdbm,yssj,ysr,lrr,lrsj,lrdw,bz ";
	ls_sql+=" from  crm_gcyszxmjl";
	ls_sql+=" where  (ysjlh='"+ysjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		gcyszxmbm=cf.fillNull(rs.getString("gcyszxmbm"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		yssj=cf.fillNull(rs.getDate("yssj"));
		ysr=cf.fillNull(rs.getString("ysr"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select crm_khxx.khxm,fwdz,lxfs,hth,sjs,qye,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,dwbh,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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
      <div align="center">���Ͻ���ά�������ռ�¼�ţ�<%=ysjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="31%"> <%=khxm%>��<%=lxfs%>�� </td>
              <td width="17%"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="33%"><%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">���ݵ�ַ</td>
              <td width="31%"><%=fwdz%></td>
              <td width="17%" align="right">���̵���</td>
              <td width="33%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="17%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="33%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="31%"><%=qyrq%> </td>
              <td width="17%"> 
                <div align="right">����ǩԼ��</div>
              </td>
              <td width="33%"> <%=qye%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="17%"> 
                <div align="right">�೤</div>
              </td>
              <td width="33%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">��ͬ��������</td>
              <td width="31%"><font color="#000000"><%=kgrq%></font></td>
              <td width="17%" align="right">��ͬ��������</td>
              <td width="33%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">ʵ�ʿ�������</td>
              <td width="31%"><font color="#000000"><%=sjkgrq%></font></td>
              <td width="17%" align="right">ʵ�ʿ�������</td>
              <td width="33%"><font color="#000000"><%=sjjgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��������Ŀ</div>
              </td>
              <td width="31%"> 
                <select name="gcyszxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='"+gcjdbm+"' order by gcjdbm,gcyszxmbm",gcyszxmbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">���շ���</div>
              </td>
              <td width="33%"> 
                <select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"2+���Ͻ���&3+���ι�������&4+��������&5+�깤����",gcjdbm,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="yssj" size="20" maxlength="10"  value="<%=yssj%>" >
              </td>
              <td width="17%"> 
                <div align="right">������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ysr" size="20" maxlength="20"  value="<%=ysr%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">¼��ʱ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
              </td>
              <td width="17%"> 
                <div align="right">¼����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">¼�뵥λ</div>
              </td>
              <td width="31%"> 
                <select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'",lrdw);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="4"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
				<input type="hidden" name="ysjlh"  value="<%=ysjlh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="button"  value="¼�������ϸ" onClick="f_lrcl(editform)" name="lrcl" >
                  <input type="button"  value="�鿴������ϸ" onClick="f_ckcl(editform)" name="ckcl" >
                  <input type="button"  value="�ϴ���Ƭ" onClick="f_lr(editform)" name="lr" >
                  <input type="button"  value="�鿴��Ƭ" onClick="f_ck(editform)" name="ck" >
                  <input type="button"  value="¼��ʩ���Ӵ���" onClick="f_lrcf(editform)" name="lrcf" >
                  <input type="reset"  value="����">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gcyszxmbm)=="") {
		alert("��ѡ��[��������Ŀ]��");
		FormName.gcyszxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcjdbm)=="") {
		alert("��ѡ��[���շ���]��");
		FormName.gcjdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yssj)=="") {
		alert("������[����ʱ��]��");
		FormName.yssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yssj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.ysr)=="") {
		alert("������[������]��");
		FormName.ysr.focus();
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
	if(	javaTrim(FormName.lrdw)=="") {
		alert("��ѡ��[¼�뵥λ]��");
		FormName.lrdw.focus();
		return false;
	}

	FormName.action="SaveEditCrm_gcyszxmjl.jsp";
	FormName.submit();
	return true;
}
function f_lrcl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="InsertCrm_cljcmx.jsp";
	FormName.submit();
	return true;
}

function f_ckcl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="Crm_cljcmxList.jsp";
	FormName.submit();
	return true;
}
function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}

function f_lrcf(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="/gcgl/zjygl/xjgd/InsertKp_xjgdjl.jsp?khbh=<%=khbh%>";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
