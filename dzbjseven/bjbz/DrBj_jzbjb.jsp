<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double clbj=0;
double rgbj=0;
double jxbj=0;
double bj=0;
double sgdbj=0;
String gycl=null;
String xh=null;
String zdyxmyxq=null;
String flmcgg=null;
String bz=null;
String sfxycl=null;
String sfxyyjd=null;

double zcf=0;
double shf=0;
double ysf=0;
double qtf=0;
String xmflbm=null;
double sgcbj=0;

String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String bjbbh=cf.GB2Uni(cf.getParameter(request,"bjbbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select xmflbm,sgcbj,zcf,shf,ysf,qtf,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,clbj,rgbj,jxbj,bj,sgdbj,gycl,xh,flmcgg,bz,sfxycl,sfxyyjd ";
	ls_sql+=" from  bj_jzbjb";
	ls_sql+=" where  dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		sgcbj=rs.getDouble("sgcbj");
		zcf=rs.getDouble("zcf");
		shf=rs.getDouble("shf");
		ysf=rs.getDouble("ysf");
		qtf=rs.getDouble("qtf");
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		clbj=rs.getDouble("clbj");
		rgbj=rs.getDouble("rgbj");
		jxbj=rs.getDouble("jxbj");
		bj=rs.getDouble("bj");
		sgdbj=rs.getDouble("sgdbj");
		gycl=cf.fillNull(rs.getString("gycl"));
		xh=cf.fillNull(rs.getString("xh"));
		flmcgg=cf.fillNull(rs.getString("flmcgg"));
		bz=cf.fillNull(rs.getString("bz"));
		sfxycl=cf.fillNull(rs.getString("sfxycl"));
		sfxyyjd=cf.fillNull(rs.getString("sfxyyjd"));
	}
	rs.close();
	ps.close();

	ls_sql="select TO_CHAR(ADD_MONTHS(SYSDATE,zdyxmyxq),'YYYY-MM-DD') ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dqbm='"+dqbm+"' and dwlx='F0'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdyxmyxq=rs.getString(1);
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
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
String yhjs=(String)session.getAttribute("yhjs");
String zwbm=(String)session.getAttribute("zwbm");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<html>
<head>
<title>�ӱ�׼��Ŀ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �ӱ�׼��Ŀ����--�Զ�����Ŀ��<font color="#0000FF">ԭ��Ŀ��ţ�<%=xmbh%></font>��</div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveDrBj_jzbjb.jsp" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>���۰汾��</td>
              <td colspan="3"><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:522PX">
                  <%
		cf.selectItem(out,"select bjbbh c1,bjbbh||'��'||dqmc||'����'||DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��')||'��' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.dqbm='"+dqbm+"' and bj_dzbjbb.bjbbh='"+bjbbh+"' order by bj_dzbjbb.dqbm,bjbbh","");
%>
                </select>              </td>
            </tr>
            <tr> 
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">����</font></td>
              <td width="34%" bgcolor="#FFFFFF"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,false);
%> 
                </select>              </td>
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">���ۼ���</font></td>
              <td width="34%" bgcolor="#FFFFFF"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm,false);
%> 
                </select>              </td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>��Ŀ����</td>
              <td bgcolor="#FFFFFF"><select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%>
                </select>              </td>
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>��ĿС��</td>
              <td bgcolor="#FFFFFF"><select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm);
%>
                </select>              </td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF">��Ŀ����</td>
              <td bgcolor="#FFFFFF"><select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select xmflbm,xmflmc from bdm_xmflbm order by xmflbm",xmflbm);
%>
              </select></td>
              <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>��Ŀ����</td>
              <td colspan="3" bgcolor="#FFFFFF" > 
                <input type="text" name="xmmc" size="72" maxlength="100"  value="<%=xmmc%>" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>������λ</td>
              <td width="34%" bgcolor="#FFFFFF" ><select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm",jldwbm);
%>
              </select></td>
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">�Զ�����Ŀ��Ч��</font></td>
              <td width="34%" bgcolor="#FFFFFF" ><input type="text" name="zdyxmyxq" value="<%=zdyxmyxq%>" size="20" maxlength="10" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ���Ҫ����</td>
              <td><%
	cf.radioToken(out, "sfxycl","Y+��Ҫ&N+��",sfxycl);
%></td>
              <td align="right"><font color="#FF0000">*</font>�Ƿ���ҪԤ����</td>
              <td><%
	cf.radioToken(out, "sfxyyjd","Y+��Ҫ&N+��",sfxyyjd);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF"><strong>���ⱨ��</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>���ķ�</td>
              <td bgcolor="#CCCCFF"><input type="text" name="clbj" value="<%=clbj%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>���ķ�</td>
              <td bgcolor="#CCCCFF"><input type="text" name="zcf" value="<%=zcf%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�˹���</td>
              <td bgcolor="#CCCCFF"><input type="text" name="rgbj" value="<%=rgbj%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>�����</td>
              <td bgcolor="#CCCCFF"><input type="text" name="ysf" value="<%=ysf%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>��е��</td>
              <td bgcolor="#CCCCFF"><input type="text" name="jxbj" value="<%=jxbj%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>��ķ�</td>
              <td bgcolor="#CCCCFF"><input type="text" name="shf" value="<%=shf%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>������</td>
              <td bgcolor="#CCCCFF"><input type="text" name="qtf" value="<%=qtf%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font><font color="#0000CC">����Ԥ���</font></td>
              <td bgcolor="#CCCCFF"><input type="text" name="bj" value="<%=bj%>" size="20" maxlength="17" readonly></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF">&nbsp;</td>
              <td colspan="3" bgcolor="#CCCCFF"><font color="#0000CC"><strong>ע�⣺����Ԥ���<font color="#FF0000">(<font color="#0000CC"><strong>�Զ�����</strong></font>)</font>�����ķ�+���ķѣ��˹��ѣ�����ѣ���е�ѣ���ķѣ�������</strong></font></td>
            </tr>
            
            
            <tr> 
              <td width="16%" align="right" bgcolor="#CCCCFF">���ղ��ϼ��</td>
              <td colspan="3" bgcolor="#CCCCFF"> 
                <textarea name="gycl" cols="76" rows="8"><%=gycl%></textarea></td>
            </tr>
              <tr bgcolor="#FFFFFF">
              <td align="right">�������ƹ��</td>
              <td colspan="3"><textarea name="flmcgg" cols="71" rows="4"><%=flmcgg%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ע</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="2"><%=bz%></textarea>              </td>
            </tr>
          <tr> 
              <td colspan="4" align="center" >
                  <input type="hidden" name="xmbh" value="<%=xmbh%>"> 
                <input type="hidden" name="smbm" value="<%=smbm%>" >
                <input type="hidden" name="shbz" value="N" >
                <input type="hidden" name="bjlx" value="2" >
                <input type="hidden" name="lrr" value="<%=yhdlm%>" >
                <input type="hidden" name="lrsj" value="<%=cf.today()%>" >

				  <input type="hidden" name="wheredqbm"  value="<%=dqbm%>" >
                  <input type="hidden" name="wherexmbh"  value="<%=xmbh%>" >
                  <input type="hidden" name="wherebjjbbm"  value="<%=bjjbbm%>" >
                  <input type="hidden" name="wherebjbbh"  value="<%=bjbbh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">              </td>
            </tr>
          </table>
</form>
	  </div>    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_jsjg(FormName)//����FormName:Form������
{
	var bj=FormName.clbj.value*1+FormName.rgbj.value*1+FormName.jxbj.value*1+FormName.zcf.value*1+FormName.shf.value*1+FormName.ysf.value*1+FormName.qtf.value*1;
	bj=round(bj,2);
	FormName.bj.value=bj;
}
function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("��ѡ��[��ĿС��]��");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("������[��Ŀ����]��");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}

	if(	javaTrim(FormName.bj)=="") {
		alert("������[����Ԥ���]��");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "����Ԥ���"))) {
		return false;
	}
	if(	javaTrim(FormName.clbj)=="") {
		alert("������[���ķ�]��");
		FormName.clbj.focus();
		return false;
	}
	if(!(isFloat(FormName.clbj, "���ķ�"))) {
		return false;
	}
	if(	javaTrim(FormName.rgbj)=="") {
		alert("������[�˹���]��");
		FormName.rgbj.focus();
		return false;
	}
	if(!(isFloat(FormName.rgbj, "�˹���"))) {
		return false;
	}
	if(	javaTrim(FormName.jxbj)=="") {
		alert("������[��е��]��");
		FormName.jxbj.focus();
		return false;
	}
	if(!(isFloat(FormName.jxbj, "��е��"))) {
		return false;
	}
	if(	javaTrim(FormName.zcf)=="") {
		alert("������[���ķ�]��");
		FormName.zcf.focus();
		return false;
	}
	if(!(isFloat(FormName.zcf, "���ķ�"))) {
		return false;
	}
	if(	javaTrim(FormName.shf)=="") {
		alert("������[��ķ�]��");
		FormName.shf.focus();
		return false;
	}
	if(!(isFloat(FormName.shf, "��ķ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ysf)=="") {
		alert("������[�����]��");
		FormName.ysf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysf, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.qtf)=="") {
		alert("������[������]��");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "������"))) {
		return false;
	}

	if(	javaTrim(FormName.zdyxmyxq)=="") {
		alert("������[�Զ�����Ŀ��Ч��]��");
		FormName.zdyxmyxq.focus();
		return false;
	}
	if(!(isDatetime(FormName.zdyxmyxq, "�Զ�����Ŀ��Ч��"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxycl)) {
		alert("��ѡ��[�Ƿ���Ҫ����]��");
		FormName.sfxycl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxyyjd)) {
		alert("��ѡ��[�Ƿ���ҪԤ����]��");
		FormName.sfxyyjd[0].focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
