<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=null;
String cgbm=null;
String dgcd=null;
String dggd=null;
String dgjs=null;
String dgdj=null;
double dgfbxs=0;
String tdcd=null;
String tggd=null;
String tgjs=null;
String tgdj=null;
double tgfbxs=0;
String tmbm=null;
String tmcd=null;
String tmdj=null;
double tmfbxs=0;
String mbmj=null;
String mbdj=null;
String mbbm=null;
String mbfbbm=null;
String mbfbjg=null;
String xtbm=null;
String xtjg=null;
String lsbm=null;
String lsjg=null;
String tjbbm=null;
String tjbjg=null;
String ctbm=null;
String ctjg=null;
String jlbm=null;
String jljg=null;
String sjzj=null;
String bz=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ddbh,cgbm,dgcd,dggd,dgjs,dgdj,dgfbxs,tdcd,tggd,tgjs,tgdj,tgfbxs,tmbm,tmcd,tmdj,tmfbxs,mbmj,mbdj,mbbm,mbfbbm,mbfbjg,xtbm,xtjg,lsbm,lsjg,tjbbm,tjbjg,ctbm,ctjg,jlbm,jljg,sjzj,bz ";
	ls_sql+=" from  jc_cgccdmx";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		cgbm=cf.fillNull(rs.getString("cgbm"));
		dgcd=cf.fillNull(rs.getString("dgcd"));
		dggd=cf.fillNull(rs.getString("dggd"));
		dgjs=cf.fillNull(rs.getString("dgjs"));
		dgdj=cf.fillNull(rs.getString("dgdj"));
		dgfbxs=rs.getDouble("dgfbxs");
		tdcd=cf.fillNull(rs.getString("tdcd"));
		tggd=cf.fillNull(rs.getString("tggd"));
		tgjs=cf.fillNull(rs.getString("tgjs"));
		tgdj=cf.fillNull(rs.getString("tgdj"));
		tgfbxs=rs.getDouble("tgfbxs");
		tmbm=cf.fillNull(rs.getString("tmbm"));
		tmcd=cf.fillNull(rs.getString("tmcd"));
		tmdj=cf.fillNull(rs.getString("tmdj"));
		tmfbxs=rs.getDouble("tmfbxs");
		mbmj=cf.fillNull(rs.getString("mbmj"));
		mbdj=cf.fillNull(rs.getString("mbdj"));
		mbbm=cf.fillNull(rs.getString("mbbm"));
		mbfbbm=cf.fillNull(rs.getString("mbfbbm"));
		mbfbjg=cf.fillNull(rs.getString("mbfbjg"));
		xtbm=cf.fillNull(rs.getString("xtbm"));
		xtjg=cf.fillNull(rs.getString("xtjg"));
		lsbm=cf.fillNull(rs.getString("lsbm"));
		lsjg=cf.fillNull(rs.getString("lsjg"));
		tjbbm=cf.fillNull(rs.getString("tjbbm"));
		tjbjg=cf.fillNull(rs.getString("tjbjg"));
		ctbm=cf.fillNull(rs.getString("ctbm"));
		ctjg=cf.fillNull(rs.getString("ctjg"));
		jlbm=cf.fillNull(rs.getString("jlbm"));
		jljg=cf.fillNull(rs.getString("jljg"));
		sjzj=cf.fillNull(rs.getString("sjzj"));
		bz=cf.fillNull(rs.getString("bz"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸ĳ�����ⵥ�������ţ�<%=ddbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_cgccdmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <select name="cgbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cgbm,cgmc from jc_cgjgb order by cgbm",cgbm);
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right"><font color="#0000CC">�����ܼ�</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="sjzj" size="20" maxlength="9"  value="<%=sjzj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">������mm��</td>
              <td width="32%"> 
                <input type="text" name="dgjs" size="20" maxlength="8"  value="<%=dgjs%>"  onChange="getDj(insertform)">
              </td>
              <td width="20%" align="right">����߶ȣ�mm��</td>
              <td width="30%"> 
                <input type="text" name="dggd" size="20" maxlength="8"  value="<%=dggd%>"  onChange="getDj(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">���񳤶ȣ����ף�</div>
              </td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="dgcd" size="20" maxlength="9"  value="<%=dgcd%>" >
              </td>
              <td width="20%"> 
                <div align="right">����Ǳ�ϵ��</div>
              </td>
              <td width="30%">
                <input type="text" name="dgfbxs" value="<%=dgfbxs%>" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#0000CC">���񵥼ۣ�Ԫ/���ף�</font></td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="dgdj" size="20" maxlength="9"  value="<%=dgdj%>" >
              </td>
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#0000CC">�ع񵥼ۣ�Ԫ/���ף�</font></td>
              <td width="32%" bgcolor="#CCFFCC"> 
                <input type="text" name="tgdj" size="20" maxlength="9"  value="<%=tgdj%>" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%"> 
                <div align="right">�ع���mm��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="tgjs" size="20" maxlength="8"  value="<%=tgjs%>"  onChange="getDj(insertform)">
              </td>
              <td width="20%"> 
                <div align="right">�ع�߶ȣ�mm��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="tggd" size="20" maxlength="8"  value="<%=tggd%>"  onChange="getDj(insertform)">
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%"> 
                <div align="right">�ع񳤶ȣ����ף�</div>
              </td>
              <td width="32%"> 
                <input type="text" name="tdcd" size="20" maxlength="9"  value="<%=tdcd%>" >
              </td>
              <td width="20%"> 
                <div align="right">�ع�Ǳ�ϵ��</div>
              </td>
              <td width="30%">
                <input type="text" name="tgfbxs" value="<%=tgfbxs%>" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">̨��</div>
              </td>
              <td width="32%"> 
                <select name="tmbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(tmbm,tmdj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tmbm,tmmc||'('||xh||')'||'��:'||ymjg from jc_tmbj order by tmbm",tmbm);
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right"><font color="#0000CC">̨�浥�ۣ�Ԫ/���ף�</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="tmdj" size="20" maxlength="9"  value="<%=tmdj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" bgcolor="#FFFFCC"> 
                <div align="right">̨�泤�ȣ����ף�</div>
              </td>
              <td width="32%"> 
                <input type="text" name="tmcd" size="20" maxlength="9"  value="<%=tmcd%>" >
              </td>
              <td width="20%"> 
                <div align="right">̨��Ǳ�ϵ��</div>
              </td>
              <td width="30%">
                <input type="text" name="tmfbxs" value="<%=tmfbxs%>" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%" align="right">�Ű�</td>
              <td width="32%"> 
                <select name="mbbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(mbbm,mbdj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_mbbm.mbbm,jdm_mbbm.mbmc||'��:'||jc_mbjg.jg from jdm_mbbm,jc_mbjg where jdm_mbbm.mbbm=jc_mbjg.mbbm  order by jdm_mbbm.mbbm",mbbm);
%> 
                </select>
              </td>
              <td width="20%" align="right"><font color="#0000CC">�Ű嵥�ۣ�Ԫ/ƽ�ף�</font></td>
              <td width="30%"> 
                <input type="text" name="mbdj" size="20" maxlength="9"  value="<%=mbdj%>" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%"> 
                <div align="right">�Ű������ƽ�ף�</div>
              </td>
              <td width="32%"> 
                <input type="text" name="mbmj" size="20" maxlength="9"  value="<%=mbmj%>" >
              </td>
              <td width="20%"> 
                <div align="right"></div>
              </td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">�Ű���</div>
              </td>
              <td width="32%"> 
                <select name="mbfbbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(mbfbbm,mbfbjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_mbfbbm.mbfbbm,jdm_mbfbbm.mbfbmc||'��:'||jc_mbfbjg.jg  from jdm_mbfbbm,jc_mbfbjg where jdm_mbfbbm.mbfbbm=jc_mbfbjg.mbfbbm order by jdm_mbfbbm.mbfbbm",mbfbbm);
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right"><font color="#0000CC">�Ű��߼۸�</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="mbfbjg" size="20" maxlength="9"  value="<%=mbfbjg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <select name="xtbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(xtbm,xtjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_xtbm.xtbm,jdm_xtbm.xtmc||'��:'||jc_xtjg.jg  from jdm_xtbm,jc_xtjg where jdm_xtbm.xtbm=jc_xtjg.xtbm order by jdm_xtbm.xtbm",xtbm);
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right"><font color="#0000CC">����۸�</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="xtjg" size="20" maxlength="9"  value="<%=xtjg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <select name="lsbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(lsbm,lsjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_lsbm.lsbm,jdm_lsbm.lsmc||'��:'||jc_lsjg.jg from jdm_lsbm,jc_lsjg where jdm_lsbm.lsbm=jc_lsjg.lsbm order by jdm_lsbm.lsbm",lsbm);
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right"><font color="#0000CC">���ּ۸�</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="lsjg" size="20" maxlength="9"  value="<%=lsjg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">�߽Ű�</div>
              </td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <select name="tjbbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(tjbbm,tjbjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_tjbbm.tjbbm,jdm_tjbbm.tjbmc||'��:'||jc_tjbjg.jg from jdm_tjbbm,jc_tjbjg where jdm_tjbbm.tjbbm=jc_tjbjg.tjbbm order by jdm_tjbbm.tjbbm",tjbbm);
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right"><font color="#0000CC">�߽Ű�۸�</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="tjbjg" size="20" maxlength="9"  value="<%=tjbjg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <select name="ctbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(ctbm,ctjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_ctbm.ctbm,jdm_ctbm.ctmc||'��:'||jc_ctjg.jg from jdm_ctbm,jc_ctjg where jdm_ctbm.ctbm=jc_ctjg.ctbm order by jdm_ctbm.ctbm",ctbm);
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right"><font color="#0000CC">����۸�</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="ctjg" size="20" maxlength="9"  value="<%=ctjg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <select name="jlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(jlbm,jljg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_jlbm.jlbm,jdm_jlbm.jlmc||'��:'||jc_jljg.jg from jdm_jlbm,jc_jljg where jdm_jlbm.jlbm=jc_jljg.jlbm order by jdm_jlbm.jlbm",jlbm);
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right"><font color="#0000CC">�����۸�</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="jljg" size="20" maxlength="9"  value="<%=jljg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="ddbh" value="<%=ddbh%>" >
            <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="button"  value="����۸�" onClick="jsjg(insertform)" name="button">
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
function getDj(FormName)
{
	if (FormName.cgbm.value=='')
	{
		return;
	}

	if (FormName.dgjs.value=='' && FormName.tgjs.value=='')
	{
		return;
	}

	if (FormName.dgjs.value!='' && FormName.dggd.value=='')
	{
		return;
	}
	if (FormName.tgjs.value!='' && FormName.tggd.value=='')
	{
		return;
	}

/*
	var str="Jc_cgddmxCx.jsp?cgbm="+FormName.cgbm.value+"&dgjs="+FormName.dgjs.value+"&dggd="+FormName.dggd.value;
	str+="&tgjs="+FormName.tgjs.value+"&tggd="+FormName.tggd.value;
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
*/
}
function jsjg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dgcd)=="") {
		alert("������[���񳤶�]��");
		FormName.dgcd.focus();
		return false;
	}
	if(!(isFloat(FormName.dgcd, "���񳤶�"))) {
		return false;
	}
	if(	javaTrim(FormName.dgdj)=="") {
		alert("������[���񵥼�]��");
		FormName.dgdj.focus();
		return false;
	}
	if(!(isFloat(FormName.dgdj, "���񵥼�"))) {
		return false;
	}
	if(	javaTrim(FormName.dgfbxs)=="") {
		alert("������[����Ǳ�ϵ��]��");
		FormName.dgfbxs.focus();
		return false;
	}
	if(!(isFloat(FormName.dgfbxs, "����Ǳ�ϵ��"))) {
		return false;
	}


	if(	javaTrim(FormName.tdcd)=="") {
		alert("������[�ع񳤶�]��");
		FormName.tdcd.focus();
		return false;
	}
	if(!(isFloat(FormName.tdcd, "�ع񳤶�"))) {
		return false;
	}
	if(	javaTrim(FormName.tgdj)=="") {
		alert("������[�ع񵥼�]��");
		FormName.tgdj.focus();
		return false;
	}
	if(!(isFloat(FormName.tgdj, "�ع񵥼�"))) {
		return false;
	}
	if(	javaTrim(FormName.tgfbxs)=="") {
		alert("������[�ع�Ǳ�ϵ��]��");
		FormName.tgfbxs.focus();
		return false;
	}
	if(!(isFloat(FormName.tgfbxs, "�ع�Ǳ�ϵ��"))) {
		return false;
	}


	if(	javaTrim(FormName.tmcd)=="") {
		alert("������[̨�泤��]��");
		FormName.tmcd.focus();
		return false;
	}
	if(!(isFloat(FormName.tmcd, "̨�泤��"))) {
		return false;
	}
	if(	javaTrim(FormName.tmdj)=="") {
		alert("������[̨�浥��]��");
		FormName.tmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.tmdj, "̨�浥��"))) {
		return false;
	}
	if(	javaTrim(FormName.tmfbxs)=="") {
		alert("������[̨��Ǳ�ϵ��]��");
		FormName.tmfbxs.focus();
		return false;
	}
	if(!(isFloat(FormName.tmfbxs, "̨��Ǳ�ϵ��"))) {
		return false;
	}


	if(	javaTrim(FormName.mbmj)=="") {
		alert("������[�Ű����]��");
		FormName.mbmj.focus();
		return false;
	}
	if(!(isFloat(FormName.mbmj, "�Ű����"))) {
		return false;
	}
	if(	javaTrim(FormName.mbdj)=="") {
		alert("������[�Ű嵥��]��");
		FormName.mbdj.focus();
		return false;
	}
	if(!(isFloat(FormName.mbdj, "�Ű嵥��"))) {
		return false;
	}

	if(	javaTrim(FormName.mbfbjg)=="") {
		alert("��ѡ��[�Ű��߼۸�]��");
		FormName.mbfbjg.focus();
		return false;
	}
	if(!(isFloat(FormName.mbfbjg, "�Ű��߼۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.xtjg)=="") {
		alert("������[����۸�]��");
		FormName.xtjg.focus();
		return false;
	}
	if(!(isFloat(FormName.xtjg, "����۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.lsjg)=="") {
		alert("������[���ּ۸�]��");
		FormName.lsjg.focus();
		return false;
	}
	if(!(isFloat(FormName.lsjg, "���ּ۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.tjbjg)=="") {
		alert("������[�߽Ű�۸�]��");
		FormName.tjbjg.focus();
		return false;
	}
	if(!(isFloat(FormName.tjbjg, "�߽Ű�۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.ctjg)=="") {
		alert("������[����۸�]��");
		FormName.ctjg.focus();
		return false;
	}
	if(!(isFloat(FormName.ctjg, "����۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.jljg)=="") {
		alert("������[�����۸�]��");
		FormName.jljg.focus();
		return false;
	}
	if(!(isFloat(FormName.jljg, "�����۸�"))) {
		return false;
	}

	var zj=0;
	zj=FormName.dgcd.value*FormName.dgdj.value*FormName.dgfbxs.value+FormName.tdcd.value*FormName.tgdj.value*FormName.tgfbxs.value;
	zj+=FormName.tmcd.value*FormName.tmdj.value*FormName.tmfbxs.value+FormName.mbmj.value*FormName.mbdj.value;
	zj+=FormName.mbfbjg.value*1+FormName.xtjg.value*1+FormName.lsjg.value*1;
	zj+=FormName.tjbjg.value*1+FormName.ctjg.value*1+FormName.jljg.value*1;
	
	FormName.sjzj.value=parseInt(zj*100)/100;
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cgbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.cgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dgcd)=="") {
		alert("������[���񳤶�]��");
		FormName.dgcd.focus();
		return false;
	}
	if(!(isFloat(FormName.dgcd, "���񳤶�"))) {
		return false;
	}
	if(	javaTrim(FormName.dggd)=="") {
		alert("������[����߶�]��");
		FormName.dggd.focus();
		return false;
	}
	if(!(isNumber(FormName.dggd, "����߶�"))) {
		return false;
	}
	if(	javaTrim(FormName.dgjs)=="") {
		alert("������[�������]��");
		FormName.dgjs.focus();
		return false;
	}
	if(!(isNumber(FormName.dgjs, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.dgdj)=="") {
		alert("������[���񵥼�]��");
		FormName.dgdj.focus();
		return false;
	}
	if(!(isFloat(FormName.dgdj, "���񵥼�"))) {
		return false;
	}
	if(	javaTrim(FormName.dgfbxs)=="") {
		alert("������[����Ǳ�ϵ��]��");
		FormName.dgfbxs.focus();
		return false;
	}
	if(!(isFloat(FormName.dgfbxs, "����Ǳ�ϵ��"))) {
		return false;
	}
	if(	javaTrim(FormName.tdcd)=="") {
		alert("������[�ع񳤶�]��");
		FormName.tdcd.focus();
		return false;
	}
	if(!(isFloat(FormName.tdcd, "�ع񳤶�"))) {
		return false;
	}
	if(	javaTrim(FormName.tggd)=="") {
		alert("������[�ع�߶�]��");
		FormName.tggd.focus();
		return false;
	}
	if(!(isNumber(FormName.tggd, "�ع�߶�"))) {
		return false;
	}
	if(	javaTrim(FormName.tgjs)=="") {
		alert("������[�ع����]��");
		FormName.tgjs.focus();
		return false;
	}
	if(!(isNumber(FormName.tgjs, "�ع����"))) {
		return false;
	}
	if(	javaTrim(FormName.tgdj)=="") {
		alert("������[�ع񵥼�]��");
		FormName.tgdj.focus();
		return false;
	}
	if(!(isFloat(FormName.tgdj, "�ع񵥼�"))) {
		return false;
	}
	if(	javaTrim(FormName.tgfbxs)=="") {
		alert("������[�ع�Ǳ�ϵ��]��");
		FormName.tgfbxs.focus();
		return false;
	}
	if(!(isFloat(FormName.tgfbxs, "�ع�Ǳ�ϵ��"))) {
		return false;
	}
	if(	javaTrim(FormName.tmbm)=="") {
		alert("��ѡ��[̨��]��");
		FormName.tmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tmcd)=="") {
		alert("������[̨�泤��]��");
		FormName.tmcd.focus();
		return false;
	}
	if(!(isFloat(FormName.tmcd, "̨�泤��"))) {
		return false;
	}
	if(	javaTrim(FormName.tmdj)=="") {
		alert("������[̨�浥��]��");
		FormName.tmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.tmdj, "̨�浥��"))) {
		return false;
	}
	if(	javaTrim(FormName.tmfbxs)=="") {
		alert("������[̨��Ǳ�ϵ��]��");
		FormName.tmfbxs.focus();
		return false;
	}
	if(!(isFloat(FormName.tmfbxs, "̨��Ǳ�ϵ��"))) {
		return false;
	}
	if(	javaTrim(FormName.mbmj)=="") {
		alert("������[�Ű����]��");
		FormName.mbmj.focus();
		return false;
	}
	if(!(isFloat(FormName.mbmj, "�Ű����"))) {
		return false;
	}
	if(	javaTrim(FormName.mbdj)=="") {
		alert("������[�Ű嵥��]��");
		FormName.mbdj.focus();
		return false;
	}
	if(!(isFloat(FormName.mbdj, "�Ű嵥��"))) {
		return false;
	}
	if(	javaTrim(FormName.mbbm)=="") {
		alert("��ѡ��[�Ű�]��");
		FormName.mbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mbfbjg)=="") {
		alert("��ѡ��[�Ű��߼۸�]��");
		FormName.mbfbjg.focus();
		return false;
	}
	if(!(isFloat(FormName.mbfbjg, "�Ű��߼۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.xtbm)=="") {
		alert("��ѡ��[����]��");
		FormName.xtbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xtjg)=="") {
		alert("������[����۸�]��");
		FormName.xtjg.focus();
		return false;
	}
	if(!(isFloat(FormName.xtjg, "����۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.lsbm)=="") {
		alert("��ѡ��[����]��");
		FormName.lsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsjg)=="") {
		alert("������[���ּ۸�]��");
		FormName.lsjg.focus();
		return false;
	}
	if(!(isFloat(FormName.lsjg, "���ּ۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.tjbbm)=="") {
		alert("��ѡ��[�߽Ű�]��");
		FormName.tjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tjbjg)=="") {
		alert("������[�߽Ű�۸�]��");
		FormName.tjbjg.focus();
		return false;
	}
	if(!(isFloat(FormName.tjbjg, "�߽Ű�۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.ctbm)=="") {
		alert("��ѡ��[����]��");
		FormName.ctbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ctjg)=="") {
		alert("������[����۸�]��");
		FormName.ctjg.focus();
		return false;
	}
	if(!(isFloat(FormName.ctjg, "����۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.jlbm)=="") {
		alert("��ѡ��[����]��");
		FormName.jlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jljg)=="") {
		alert("������[�����۸�]��");
		FormName.jljg.focus();
		return false;
	}
	if(!(isFloat(FormName.jljg, "�����۸�"))) {
		return false;
	}


	jsjg(FormName);

	if(	javaTrim(FormName.sjzj)=="") {
		alert("������[�����ܼ�]��");
		FormName.sjzj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzj, "�����ܼ�"))) {
		return false;
	}




	FormName.submit();
	return true;
}
//-->
</SCRIPT>
